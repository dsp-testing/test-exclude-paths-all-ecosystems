# Dependabot Exclude Paths Testing Repository

This repository is designed to test Dependabot's `exclude-paths` functionality across different package ecosystems.

## Repository Structure

```
├── bundler/
│   ├── Gemfile                   # Root level - SHOULD be processed by Dependabot
│   ├── Gemfile.lock              # Root level - SHOULD be processed by Dependabot
│   ├── include-me/               # These files SHOULD be processed by Dependabot
│   │   ├── Gemfile
│   │   └── Gemfile.lock
│   └── exclude-me/               # These files should NOT be processed (excluded)
│       ├── Gemfile
│       └── Gemfile.lock
├── cargo/
│   ├── Cargo.toml                # Root level - SHOULD be processed by Dependabot
│   ├── Cargo.lock                # Root level - SHOULD be processed by Dependabot
│   ├── include-me/               # These files SHOULD be processed by Dependabot
│   │   ├── Cargo.toml
│   │   └── Cargo.lock
│   └── exclude-me/               # These files should NOT be processed (excluded)
│       ├── Cargo.toml
│       └── Cargo.lock
└── .github/
    └── dependabot.yml            # Dependabot configuration with exclude-paths
```

## Test Scenarios

### Bundler Ecosystem
- **Root Level**: `bundler/Gemfile` - Contains basic dependencies (should be processed)
- **Include**: `bundler/include-me/` - Contains a Rails application with various gems
- **Exclude**: `bundler/exclude-me/` - Contains a Sinatra application (should be ignored)

### Cargo Ecosystem  
- **Root Level**: `cargo/Cargo.toml` - Contains basic dependencies (should be processed)
- **Include**: `cargo/include-me/` - Contains a web server project with various dependencies
- **Exclude**: `cargo/exclude-me/` - Contains a CLI tool project (should be ignored)

## Expected Behavior

When Dependabot runs, it should:

1. ✅ Process and create PRs for dependencies in:
   - `bundler/Gemfile` (root level)
   - `bundler/include-me/Gemfile`
   - `cargo/Cargo.toml` (root level)
   - `cargo/include-me/Cargo.toml`

2. ❌ Ignore dependencies in:
   - `bundler/exclude-me/Gemfile` (excluded by path pattern)
   - `cargo/exclude-me/Cargo.toml` (excluded by path pattern)

## Configuration Details

The `.github/dependabot.yml` uses:
- `exclude-paths: ["bundler/exclude-me/**"]` for the bundler ecosystem
- `exclude-paths: ["cargo/exclude-me/**"]` for the cargo ecosystem

This ensures that only the `include-me` folders are processed for dependency updates.

## Testing

To verify the exclude-paths functionality:

1. Monitor Dependabot PRs after pushing this configuration
2. Check that PRs are only created for dependencies in the `include-me` folders
3. Verify that no PRs are created for dependencies in the `exclude-me` folders
