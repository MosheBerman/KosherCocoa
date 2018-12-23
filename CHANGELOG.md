# Change Log
Notable changes documented here, per keepachangelog.com. Yes, we use [semantic versioning](http://semver.org).

## [4.0.0] 2018-12-08
### Added
- Added some utility classes.
    - Location management
    - Zmanim collections
    - Persistence management

### Changed
- Combined the various targets into one, for easier building and testing.

## [3.6.0] - 2017-08-20
### Changed 
- Prefixed categories to avoid Objective-C namespacing collisions resulting in compiler warning.
- Nullability audit, for better Swift interoperability.
- Changed #import syntax to @import syntax, to take advantage of modules.
- Redefined a few of the older enums to use proper `NS_ENUM` syntax.
- Added `NS_SWIFT_NAME`s to classes and enums.


## [3.0.0] - 2015-11-12
### Changed
- Removed the old project targets and replaced them with a new single Framework target.
- Changed the KCAstronomicalCalculator class into a protocol.
