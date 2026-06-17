# rqwstr

AI-native HTTP security testing toolkit, shipped as an MCP server. It gives an AI agent low-level control over HTTP/1.1 and HTTP/2 — raw framing, connection pinning, intruder-style fuzzing, request racing, OOB detection, and multi-step chains — on its own Go engine, rather than wrapping a high-level HTTP client.

This repository hosts the **release binaries and Claude Desktop `.mcpb` bundles**. The source is proprietary. Docs and sign-up: **[rqwstr.com](https://rqwstr.com)**.

## Install

### Claude Desktop (one-click)

Download the `.mcpb` for your platform from the [latest release](https://github.com/Kjopstad-IT/rqwstr-mcp/releases/latest) and double-click it to add rqwstr as a Claude Desktop extension.

- **macOS** — Apple silicon (`darwin_arm64`) or Intel (`darwin_amd64`)
- **Linux** — `linux_amd64` or `linux_arm64`
- **Windows** — `windows_amd64`

### Standalone MCP server

Download the binary for your platform from the [latest release](https://github.com/Kjopstad-IT/rqwstr-mcp/releases/latest), then point your MCP client at it:

```json
{
  "mcpServers": {
    "rqwstr": {
      "command": "rqwstr",
      "args": ["serve"]
    }
  }
}
```

`rqwstr serve` runs the MCP server on stdio.

## What's in the box

17 HTTP tools driven by an AI agent over MCP:

- **Traffic** — `send` (HTTP/1.1), `send_h2` (HTTP/2), `fetch`, `import` (Burp / HAR), `export` (curl / python / requests)
- **Hunt lifecycle** — `hunt`, `scope`, `save`, `search`, `session`, `profile`
- **Attacks** — `intruder` (sniper, battering ram, pitchfork, cluster bomb), `race` (single-packet), `chain`, `parallel`
- **OOB** — `oob` with Interactsh integration
- **Encoding** — `encode` (URL, base64, JWT, and more)

Agents discover workflows through the `rqwstr_docs` tool. Per-hunt state lives in SQLite. The free tier is the core toolset; a Pro tier unlocks the heavier offensive tools.

## Verify a download

Each release includes `checksums.txt`. Verify before running:

```sh
sha256sum -c checksums.txt
```

## License

Proprietary. © Kjøpstad IT. See [rqwstr.com](https://rqwstr.com) for terms.
