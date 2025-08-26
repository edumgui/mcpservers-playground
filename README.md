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


### Environment Variables

Some containers require environment variables to start correctly. For example, the GitHub MCP server uses the following variables in your `.env` file:

```env
GITHUB_PERSONAL_ACCESS_TOKEN=your_github_token_here
GITHUB_TOOLSETS=issues,pull_requests,search,commits,repository
GITHUB_READ_ONLY=1
```

You can copy `.env.original` to `.env` and fill in your values. These variables are referenced in `podman-compose.yml` for easier configuration and updates.

### YAML Reusable Blocks

The `podman-compose.yml` uses YAML anchors and aliases for reusable container configuration blocks. This reduces duplication and makes maintenance easier.

## Required Step: Hostname Resolution

You must add an entry to your `/etc/hosts` file on the client machine:

```bash
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

## Services

- [Caddy reverse proxy](https://github.com/caddyserver/caddy)
- [Context7](https://github.com/upstash/context7)
- [GitHub MCP Server](https://github.com/github/github-mcp-server)
- [Sequential Thinking](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking)
- [Terraform MCP](https://github.com/hashicorp/terraform-mcp-server)

## Troubleshooting

- If a container fails to start, check logs:

   ```bash
   podman-compose logs <service-name>
   ```

- Make sure ports are not blocked by other processes.
