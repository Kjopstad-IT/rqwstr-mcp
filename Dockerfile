# Dockerfile for Glama's start+introspect check of the rqwstr MCP server.
#
# rqwstr v1.2.0+ starts UNLICENSED in discovery-only mode: serve() answers
# initialize + tools/list without a license (tool *execution* stays gated
# behind free activation). That is exactly what Glama needs — "we only need
# the server to start and respond to introspection requests."
#
# The binary is pulled from the public distribution repo's signed release
# (Kjopstad-IT/rqwstr-mcp), not built from source (source is private and the
# release binary carries the embedded verification key).

FROM alpine:3.20

RUN apk add --no-cache ca-certificates

ARG RQWSTR_VERSION=1.2.0
ARG TARGETARCH=amd64

RUN wget -qO /tmp/rqwstr.tar.gz \
      "https://github.com/Kjopstad-IT/rqwstr-mcp/releases/download/v${RQWSTR_VERSION}/rqwstr_${RQWSTR_VERSION}_linux_${TARGETARCH}.tar.gz" \
 && mkdir -p /tmp/x \
 && tar -xzf /tmp/rqwstr.tar.gz -C /tmp/x \
 && cp "$(find /tmp/x -type f -name rqwstr | head -1)" /usr/local/bin/rqwstr \
 && chmod +x /usr/local/bin/rqwstr \
 && rm -rf /tmp/x /tmp/rqwstr.tar.gz

# stdio MCP transport; no config + no license → discovery-only.
ENTRYPOINT ["/usr/local/bin/rqwstr", "serve"]
