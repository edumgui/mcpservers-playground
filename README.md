# MCP Playground - Quick Start

## Project Motivation

This project is designed to help you spin up containers on a different machine than where you run VS Code. This separation ensures your development environment remains responsive and avoids resource contention while coding or building.

## Spin Up Containers

1. Make sure you have Podman and podman-compose installed.
2. In the project root, run:

   ```bash
   podman-compose up -d
   ```

3. To stop all containers:

   ```bash
   podman-compose down
   ```

## Accessing Services

- Caddy reverse proxy: http://mcp-playground:8888
- Sequential Thinking: http://mcp-playground:8888/sequentialthinking/
- Context7: http://mcp-playground:8888/context7/mcp

## VS Code Configuration

- Open the project folder in VS Code.
- Recommended extensions:
  - YAML
  - Docker
  - Remote - Containers (if you want to develop inside containers)
- For best experience, enable autosave and install syntax highlighting for your main languages (TypeScript, Python, etc).
- Use the built-in terminal for running Podman commands.

## Troubleshooting

- If a container fails to start, check logs:
  ```bash
  podman-compose logs <service-name>
  ```
- Make sure ports are not blocked by other processes.
- For permission issues with volumes, ensure your user has access and SELinux context is set (use `:z` or `:Z` in volume options).

---

That’s it! You’re ready to develop and test agents in MCP Playground.
