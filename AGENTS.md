# AGENTS.md

## Build/Lint/Test Commands

### Build

```bash
:Lazy
```

## Code Style Guidelines

### Imports

- Group imports in the following order:
  1. Lua built-in modules
  2. External modules
  3. Internal modules

### Formatting

- Use 4 spaces for indentation
- Use double quotes for strings
- Use semicolons

### Types

- Use Lua types for type checking
- Define tables for objects
- Use union types for variables that can be one of several types

### Naming Conventions

- Use camelCase for variables and functions
- Use PascalCase for classes and interfaces
- Use UPPER_CASE for constants

### Error Handling

- Use pcall for error handling
- Use custom error classes for specific error types
- Log errors using a logging library

### Documentation

- Use LuaDoc for documenting functions and classes
- Include examples in documentation

### Code Reviews

- Use GitHub pull requests for code reviews
- Include a description of the changes in the pull request
- Include screenshots or videos if the changes affect the UI

