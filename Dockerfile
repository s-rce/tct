FROM debian:bookworm-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl ffmpeg \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /

# Download entrypoint.sh from gist instead of copying from repo
RUN curl -sSL https://gist.githubusercontent.com/i-tct/91d711c339d322ea300011cf929b7e0d/raw/7ee4f9caadff06c568dbd26572ed82f3d1720d7d/entrypoint.sh \
    -o /entrypoint.sh \
 && chmod +x /entrypoint.sh

EXPOSE 7860

ENTRYPOINT ["/entrypoint.sh"]
