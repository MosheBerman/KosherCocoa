#!/usr/bin/env python3
"""
extract_golden.py - Parse golden zmanim values out of the canonical KosherJava
test sources into KosherCocoaTests/Golden/ZmanimGolden.json.

Reads (never modifies):
    <KOSHER_JAVA>/src/test/java/com/kosherjava/zmanim/
        ComprehensiveZmanimCalendarTest.java   (EXPECTED array)
        ZmanimCalendarTest.java                (assertInstant / Duration asserts)
        AstronomicalCalendarTest.java          (assertInstant / Duration asserts, polar nulls)
        SpecialDayZmanimTest.java              (chametz, molad/kidush levana, polar)

Writes:
    KosherCocoaTests/Golden/ZmanimGolden.json

Paths resolve from the repo root (parent of this script's directory), so the
script works both in the real repo and in a staged mirror. KOSHER_JAVA may be
a sibling directory (default) or set via the KOSHER_JAVA env var.

JSON shape:
    {"fixtures": {"lakewood": {...}, "norway": {...}, "norway_utc": {...}},
     "cases": [{"method": "getSofZmanShmaGRA", "calendar": "comprehensive",
                "fixture": "lakewood", "date": "2017-10-17",
                "kind": "instant"|"duration"|"null"|"nonNull",
                "expected": "2017-10-17T13:55:53.352746510Z" | "PT55M20.649853956S" | null},
               ...]}
"""

import json
import os
import re
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)  # scripts/ -> repo root
KOSHER_JAVA = os.environ.get(
    "KOSHER_JAVA", os.path.join(os.path.dirname(REPO_ROOT), "KosherJava")
)
TEST_SRC = os.path.join(
    KOSHER_JAVA, "src/test/java/com/kosherjava/zmanim"
)
OUT_PATH = os.path.join(REPO_ROOT, "KosherCocoaTests", "Golden", "ZmanimGolden.json")

# Fixtures, cross-checked against TestLocations.java.
FIXTURES = {
    "lakewood": {
        "name": "Lakewood, NJ",
        "lat": 40.0721087,
        "lon": -74.2400243,
        "elev": 15,
        "tz": "America/New_York",
    },
    "norway": {
        "name": "Northern Norway",
        "lat": 70.1498248,
        "lon": 9.1456867,
        "elev": 0,
        "tz": "Europe/Oslo",
    },
    "norway_utc": {
        "name": "Northern Norway",
        "lat": 70.1498248,
        "lon": 9.1456867,
        "elev": 0,
        "tz": "UTC",
    },
}

DATE_RE = r"LocalDate\.of\((\d{4}),\s*(\d{1,2}),\s*(\d{1,2})\)"


def iso_date(y, m, d):
    return "%04d-%02d-%02d" % (int(y), int(m), int(d))


def read(name):
    with open(os.path.join(TEST_SRC, name), encoding="utf-8") as fh:
        return fh.read()


def kind_of(value):
    if value is None:
        return "null"
    if value.startswith("PT"):
        return "duration"
    return "instant"


def case(method, fixture, date, kind, expected):
    return {
        "method": method,
        "calendar": "comprehensive",
        "fixture": fixture,
        "date": date,
        "kind": kind,
        "expected": expected,
    }


def parse_comprehensive(src):
    """EXPECTED array: { {"getX", "iso"|null}, ... } -> lakewood / 2017-10-17."""
    cases = []
    for m in re.finditer(r'\{\s*"([A-Za-z0-9]+)",\s*(?:"([^"]*)"|null)\s*\}', src):
        method, value = m.group(1), m.group(2)
        cases.append(case(method, "lakewood", "2017-10-17", kind_of(value), value))
    return cases


# assertInstant("label", "iso", <anything>.getXxx())
ASSERT_INSTANT_RE = re.compile(
    r'assertInstant\(\s*"[^"]+",\s*"([^"]+)",\s*.*?\.get([A-Za-z0-9]+)\(\)\s*\)',
    re.DOTALL,
)
# assertEquals("label"?, Duration.parse("PT..."), <anything>.getXxx())
ASSERT_DURATION_RE = re.compile(
    r'assertEquals\(\s*(?:"[^"]+",\s*)?Duration\.parse\("([^"]+)"\),\s*'
    r'.*?\.get([A-Za-z0-9]+)\(\)\s*\)',
    re.DOTALL,
)
# assertNull("label"?, <anything>.getXxx())
ASSERT_NULL_RE = re.compile(
    r'assertNull\(\s*(?:"[^"]+",\s*)?.*?\.get([A-Za-z0-9]+)\(\)\s*\)',
    re.DOTALL,
)
# assertNotNull(<anything>.getXxx())
ASSERT_NOT_NULL_RE = re.compile(
    r'assertNotNull\(\s*.*?\.get([A-Za-z0-9]+)\(\)\s*\)',
    re.DOTALL,
)


def parse_simple_asserts(src, fixture, date):
    """ZmanimCalendarTest / AstronomicalCalendarTest: all asserts share one fixture/date."""
    cases = []
    for m in ASSERT_INSTANT_RE.finditer(src):
        cases.append(case("get" + m.group(2), fixture, date, "instant", m.group(1)))
    for m in ASSERT_DURATION_RE.finditer(src):
        cases.append(case("get" + m.group(2), fixture, date, "duration", m.group(1)))
    return cases


def parse_astronomical_polar(src):
    """polarNoEventReturnsNull: norway(TestLocations.UTC), 2017-06-21, sunrise/sunset null."""
    cases = []
    body = src[src.index("polarNoEventReturnsNull"):]
    body = body[: body.index("@Test", 1) if "@Test" in body[10:] else len(body)]
    date_m = re.search(DATE_RE, body)
    date = iso_date(*date_m.groups()) if date_m else "2017-06-21"
    fixture = "norway_utc" if "norway(TestLocations.UTC)" in body else "norway"
    for m in ASSERT_NULL_RE.finditer(body):
        cases.append(case("get" + m.group(1), fixture, date, "null", None))
    return cases


def parse_special_day(src):
    """Per-test-method parsing: each assert may carry its own calendarFor(date)."""
    # Named date constants, e.g. EREV_PESACH = LocalDate.of(2017, 4, 10)
    constants = {}
    for m in re.finditer(
        r"LocalDate\s+([A-Z_]+)\s*=\s*" + DATE_RE, src
    ):
        constants[m.group(1)] = iso_date(m.group(2), m.group(3), m.group(4))

    def resolve_date(text):
        m = re.search(DATE_RE, text)
        if m:
            return iso_date(*m.groups())
        m = re.search(r"calendarFor\(\s*([A-Z_]+)\s*\)", text)
        if m and m.group(1) in constants:
            return constants[m.group(1)]
        m = re.search(r"norwayCalendarFor\(\s*([A-Z_]+)\s*\)", text)
        if m and m.group(1) in constants:
            return constants[m.group(1)]
        return None

    cases = []
    for tm in re.finditer(r"@Test\s+public void (\w+)\(\)\s*\{(.*?)\n\t\}", src, re.DOTALL):
        name, body = tm.group(1), tm.group(2)
        default_fixture = "norway" if "norwayCalendarFor" in body else "lakewood"
        default_date = resolve_date(body) or "2017-10-17"

        def fixture_date(match_text):
            fixture = "norway" if "norwayCalendarFor" in match_text else None
            date = resolve_date(match_text)
            if fixture is None:
                # assert on the method-level `calendar` variable -> method default
                fixture = default_fixture if "calendar." in match_text else default_fixture
            return fixture or default_fixture, date or default_date

        for m in ASSERT_INSTANT_RE.finditer(body):
            fx, dt = fixture_date(m.group(0))
            cases.append(case("get" + m.group(2), fx, dt, "instant", m.group(1)))
        for m in ASSERT_NOT_NULL_RE.finditer(body):
            fx, dt = fixture_date(m.group(0))
            cases.append(case("get" + m.group(1), fx, dt, "nonNull", None))
        for m in ASSERT_NULL_RE.finditer(body):
            fx, dt = fixture_date(m.group(0))
            cases.append(case("get" + m.group(1), fx, dt, "null", None))
    return cases


def main():
    cases = []
    cases += parse_comprehensive(read("ComprehensiveZmanimCalendarTest.java"))
    cases += parse_simple_asserts(read("ZmanimCalendarTest.java"), "lakewood", "2017-10-17")
    astro = read("AstronomicalCalendarTest.java")
    cases += parse_simple_asserts(astro, "lakewood", "2017-10-17")
    cases += parse_astronomical_polar(astro)
    cases += parse_special_day(read("SpecialDayZmanimTest.java"))

    payload = {"fixtures": FIXTURES, "cases": cases}
    os.makedirs(os.path.dirname(OUT_PATH), exist_ok=True)
    with open(OUT_PATH, "w", encoding="utf-8") as fh:
        json.dump(payload, fh, indent=2, ensure_ascii=False)
        fh.write("\n")

    by_kind = {}
    for c in cases:
        by_kind[c["kind"]] = by_kind.get(c["kind"], 0) + 1
    print("wrote %s" % OUT_PATH)
    print("cases: %d  %s" % (len(cases), by_kind))


if __name__ == "__main__":
    main()
