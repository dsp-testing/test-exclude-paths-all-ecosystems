# Dependabot Exclude Paths Testing Repository

This repository is designed to test Dependabot's `exclude-paths` functionality across different package ecosystems.

## Repository Structure

```
├── bundler/
│   ├── include-me/               # These files SHOULD be processed by Dependabot
│   │   ├── Gemfile
│   │   └── Gemfile.lock
│   └── exclude-me/               # These files should NOT be processed (excluded)
│       ├── Gemfile
│       └── Gemfile.lock
├── cargo/
│   ├── Cargo.toml                # Workspace configuration
│   ├── include-me/               # These files SHOULD be processed by Dependabot
│   │   ├── Cargo.toml
│   │   └── Cargo.lock
│   └── exclude-me/               # These files should NOT be processed (excluded)
│       ├── Cargo.toml
│       └── Cargo.lock
├── pnpm/
│   ├── package.json              # Root workspace package.json with workspaces
│   ├── pnpm-workspace.yaml       # PNPM workspace configuration
│   ├── .npmrc                    # PNPM configuration
│   ├── include-me/               # These files SHOULD be processed by Dependabot
│   │   └── package.json          # React app dependencies
│   └── exclude-me/               # These files should NOT be processed (excluded)
│       └── package.json          # Node.js API dependencies
├── bun/
│   ├── package.json              # Root workspace package.json with workspaces
│   ├── bunfig.toml               # Bun configuration
│   ├── include-me/               # These files SHOULD be processed by Dependabot
│   │   └── package.json          # Bun web app dependencies (Hono, Drizzle)
│   └── exclude-me/               # These files should NOT be processed (excluded)
│       └── package.json          # Bun CLI tool dependencies
└── .github/
    └── dependabot.yml            # Dependabot configuration with exclude-paths
```

## Test Scenarios

### Bundler Ecosystem
- **Include**: `bundler/include-me/` - Contains a Rails application with various gems
- **Exclude**: `bundler/exclude-me/` - Contains a Sinatra application (should be ignored)

### Cargo Ecosystem  
- **Include**: `cargo/include-me/` - Contains a web server project with various dependencies
- **Exclude**: `cargo/exclude-me/` - Contains a CLI tool project (should be ignored)

### PNPM Ecosystem
- **Root**: `pnpm/package.json` - Workspace root with dev dependencies (should be processed)
- **Include**: `pnpm/include-me/` - Contains a React application with UI dependencies
- **Exclude**: `pnpm/exclude-me/` - Contains a Node.js API server (should be ignored)

### Bun Ecosystem
- **Root**: `bun/package.json` - Workspace root with dev dependencies (should be processed)
- **Include**: `bun/include-me/` - Contains a Bun web app with Hono framework and Drizzle ORM
- **Exclude**: `bun/exclude-me/` - Contains a Bun CLI tool (should be ignored)

## Expected Behavior

When Dependabot runs, it should:

1. ✅ Process and create PRs for dependencies in:
   - `bundler/include-me/Gemfile`
   - `cargo/include-me/Cargo.toml`
   - `pnpm/package.json` (root level)
   - `pnpm/include-me/package.json`
   - `bun/package.json` (root level)
   - `bun/include-me/package.json`

2. ❌ Ignore dependencies in:
   - `bundler/exclude-me/Gemfile` (excluded by path pattern)
   - `cargo/exclude-me/Cargo.toml` (excluded by path pattern)
   - `pnpm/exclude-me/package.json` (excluded by path pattern)
   - `bun/exclude-me/package.json` (excluded by path pattern)
   - `bundler/exclude-me/Gemfile` (excluded by path pattern)
   - `cargo/exclude-me/Cargo.toml` (excluded by path pattern)
   - `pnpm/exclude-me/package.json` (excluded by path pattern)

## Configuration Details

The `.github/dependabot.yml` uses:
- `exclude-paths: ["exclude-me/**"]` for the bundler ecosystem
- `exclude-paths: ["exclude-me/**"]` for the cargo ecosystem  
- `exclude-paths: ["exclude-me/**"]` for the npm/pnpm ecosystem

This ensures that only the `include-me` folders are processed for dependency updates.

## PNPM Workspace Features

The PNPM setup includes:
- **Workspace configuration**: `pnpm-workspace.yaml` defines workspace packages
- **Root package.json**: Contains shared dev dependencies and workspace scripts
- **PNPM configuration**: `.npmrc` with PNPM-specific settings
- **Package isolation**: Each workspace package has its own dependencies

## Testing

To verify the exclude-paths functionality:

1. Monitor Dependabot PRs after pushing this configuration
2. Check that PRs are only created for dependencies in the `include-me` folders
3. Verify that no PRs are created for dependencies in the `exclude-me` folders
