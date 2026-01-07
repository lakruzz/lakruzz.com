<!-- markdownlint-disable MD041-->
# Dev Container Lifecycle Events Cheat Sheet

## 📋 Overview

Dev containers have several lifecycle hooks that run at different stages of the container creation and startup process.

## 🔄 Lifecycle Events (in execution order)

### 1. `initializeCommand`

- **When**: Runs on the **host machine** before the container is created
- **Frequency**: Every time you open/rebuild the container
- **Use cases**:
  - Generate files needed for container build
  - Set up host-side prerequisites
  - Create temporary tokens/credentials

- **Example**:

```jsonc
"initializeCommand": "./.devcontainer/initializeCommand.sh"
```

### 2. `onCreateCommand` (deprecated)

- **Status**: ⚠️ Deprecated - use `postCreateCommand` instead
- **When**: After container is created (first time only)

### 3. `postCreateCommand`

- **When**: Runs **inside the container** after it's created
- **Frequency**: **Only once** when container is first created (not on reuse)
- **Use cases**:
  - Install dependencies
  - Set up databases
  - Configure the development environment
  - One-time setup tasks

- **Example**:

```jsonc
"postCreateCommand": "bundle install && npm install"
```

### 4. `postStartCommand`

- **When**: Runs **inside the container** after it starts
- **Frequency**: **Every time** the container starts (including reuse)
- **Use cases**:
  - Start services that don't persist
  - Clean up temporary files
  - Update dynamic configurations
  - Health checks

- **Example**:

```jsonc
"postStartCommand": [
    "rm -f ./.devcontainer/_temp.token",
    "service redis-server start"
]
```

### 5. `postAttachCommand`

- **When**: Runs **inside the container** after VS Code attaches to it
- **Frequency**: Every time VS Code connects to the container
- **Use cases**:
  - Start development servers
  - Open specific files/terminals
  - Set up VS Code specific environment

- **Example**:

```jsonc
"postAttachCommand": "code README.md"
```

## 🎯 Command Format Options

### String Format

```jsonc
"postStartCommand": "echo 'Hello World'"
```

### Array Format (sequential execution)

```jsonc
"postStartCommand": [
    "echo 'First command'",
    "echo 'Second command'"
]
```

### Object Format (parallel execution)

```jsonc
"postStartCommand": {
    "server": "npm start",
    "watch": "npm run watch"
}
```

## 🚀 Quick Reference Table

| Event | Location | Frequency | Best For |
| ----- | -------- | --------- | -------- |
| `initializeCommand` | Host | Every open/rebuild | Host setup, token generation |
| `postCreateCommand` | Container | Once (creation) | Dependency installation, DB setup |
| `postStartCommand` | Container | Every start | Service startup, cleanup |
| `postAttachCommand` | Container | Every VS Code attach | Dev server, file opening |

## 💡 Pro Tips

### 1. Error Handling

```jsonc
"postStartCommand": "service redis-server start || echo 'Redis failed to start'"
```

### 2. Conditional Execution

```jsonc
"postStartCommand": "[ -f package.json ] && npm install || echo 'No package.json found'"
```

### 3. Background Processes

```jsonc
"postStartCommand": "nohup redis-server > /dev/null 2>&1 &"
```

### 4. Working Directory

Commands run from the `workspaceFolder` by default.

### 5. Environment Variables

You can use environment variables in commands:

```jsonc
"postStartCommand": "echo $USER"
```

## 🐛 Troubleshooting

### File Not Deleted Issue

If your `postStartCommand` isn't working as expected:

1. **Check working directory**: Commands run from `workspaceFolder`
2. **Use absolute paths**: `rm -f /workspaces/yourproject/.devcontainer/_temp.token`
3. **Add debugging**:

```jsonc
"postStartCommand": [
    "pwd",
    "ls -la .devcontainer/",
    "rm -f ./.devcontainer/_temp.token",
    "echo 'Token cleanup completed'"
]
```

### Common Issues

- Commands fail silently - add error handling
- Timing issues - use `sleep` or proper dependency checks
- Permission issues - check file ownership and permissions
- Path issues - use absolute paths when in doubt

## 📚 Additional Resources

- [Dev Container specification](https://containers.dev/implementors/spec/)
- [VS Code Dev Container docs](https://code.visualstudio.com/docs/remote/devcontainer-cli)
