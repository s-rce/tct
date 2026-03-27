FROM debian:bookworm-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl ffmpeg \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /

COPY . .

RUN chmod +x /entrypoint.sh 

EXPOSE 7860

ENTRYPOINT ["/entrypoint.sh"]
