# MCP Playground - Quick Start

## Project Motivation

This project is designed to help you spin up MCP servers containers on a different host than where you run VS Code. This separation ensures your development environment remains responsive and avoids resource contention while coding or building.

## Spin Up Containers


For convenience, you can use the provided `Makefile` to manage containers:

- `make up` — Start all containers
- `make down` — Stop all containers
- `make logs` — Follow logs for all containers
- `make logs SERVICE=<service-name>` — Follow logs for a single container (e.g., `make logs SERVICE=caddy`)
- `make status` — Show container status
- `make restart` — Restart all containers

## Required Step: Hostname Resolution

You must add an entry to your `/etc/hosts` file on the client machine:

```
<IP_OF_MCP_HOST> mcpservers-playground
```

Replace `<IP_OF_MCP_HOST>` with the actual IP address of the host running the containers. This ensures that requests to `http://mcpservers-playground:8888` resolve correctly.

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

- Caddy reverse proxy: http://mcpservers-playground:8888
- Context7: http://mcpservers-playground:8888/context7/mcp
- Sequential Thinking: http://mcpservers-playground:8888/sequentialthinking/

## Troubleshooting

- If a container fails to start, check logs:
  ```bash
  podman-compose logs <service-name>
  ```
- Make sure ports are not blocked by other processes.
