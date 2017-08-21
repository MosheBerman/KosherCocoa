# Change Log
Notable changes documented here, per keepachangelog.com. Yes, we use [semantic versioning](http://semver.org).

## [3.6.0] - 2017-08-20
### Changed 
- Prefixed categories to avoid Objective-C namespacing collisions resulting in compiler warning.
- Nullability audit, for better Swift interoperability.
- Changed #import syntax to @import syntax, to take advantage of modules.

## [3.0.0] - 2015-11-12
### Changed
- Removed the old project targets and replaced them with a new single Framework target.
- Changed the KCAstronomicalCalculator class into a protocol.
