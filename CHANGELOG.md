# Changelog

All notable changes to this project will be documented in this file.

## [0.3.0] - 2025-11-28

### Changed
- **BREAKING**: Updated to Faraday 2.x (from 0.17.x)
  - Removed `faraday_middleware` and `faraday_middleware-parse_oj` dependencies
  - Now uses built-in Faraday JSON parsing instead of OJ middleware
  - Added `faraday-retry` gem for retry functionality
- Updated ActiveSupport from ~> 6.0 to ~> 7.0
- Updated Rubocop from ~> 0.80 to ~> 1.50
- Removed `rubocop-performance` dependency
- Removed `bundler-audit` dependency (not compatible with Bundler 4.x)
- Updated Bundler requirement to >= 2.3

### Added
- Ruby 3.4+ support
- Verified compatibility with Massive.com API (formerly Polygon.io)

### Fixed
- Fixed bundler compatibility issues with Ruby 3.4.6
- Fixed retry middleware for Faraday 2.x
- All 38 tests passing with both VCR cassettes and live API

### Notes
- This release maintains the `polygonio` gem name but will be migrated to `massive` gem in the future
- API endpoints continue to work with both polygon.io and massive.com domains
- The `/v2/reference/financials` endpoint is deprecated by Massive.com API

## [0.2.4] - Previous Release
- Last version before modernization updates
- Used Faraday 0.17.x and ActiveSupport 6.x
