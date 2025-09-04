# Test Repository for Exclude-Paths Functionality

This repository contains a comprehensive test setup for the `exclude-paths` functionality across all Dependabot-supported ecosystems.

## Structure

```
test-exclude-paths-all-ecosystems/
├── .github/dependabot.yml           # Dependabot configuration with exclude-paths
├── README.md                        # This file
├── main/                           # Main applications (SHOULD be processed)
│   ├── ruby-app/
│   ├── node-app/  
│   ├── go-app/
│   ├── python-app/
│   ├── java-maven/
│   ├── java-gradle/
│   ├── php-app/
│   ├── rust-app/
│   ├── docker-app/
│   ├── terraform-app/
│   ├── elm-app/
│   ├── elixir-app/
│   ├── dart-app/
│   ├── swift-app/
│   └── conda-app/
└── legacy/                         # Legacy applications (SHOULD be excluded)
    ├── ruby-app/
    ├── node-app/
    ├── go-app/
    ├── python-app/
    ├── java-maven/
    ├── java-gradle/
    ├── php-app/
    ├── rust-app/
    ├── docker-app/
    ├── terraform-app/
    ├── elm-app/
    ├── elixir-app/
    ├── dart-app/
    ├── swift-app/
    └── conda-app/
```

## Testing Strategy

Each ecosystem has:
1. **Main app** - Contains dependencies that SHOULD be processed by Dependabot
2. **Legacy app** - Contains dependencies that SHOULD be excluded by the `exclude-paths: ["legacy/**"]` configuration

## Expected Behavior

When Dependabot runs:
- Dependencies in `main/*/` directories should be processed and receive update PRs
- Dependencies in `legacy/*/` directories should be ignored due to exclude-paths configuration

## Ecosystems Tested

- Ruby (Bundler)
- Node.js (npm)
- Go (go modules) 
- Python (pip)
- Java (Maven & Gradle)
- PHP (Composer)
- Rust (Cargo)
- Docker
- GitHub Actions
- Terraform
- Elm
- Elixir (Hex)
- Dart (Pub)
- Swift
- Conda

Each ecosystem includes minimal but valid manifest files with real dependencies to test the exclude functionality.
