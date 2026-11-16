FROM rclone/rclone:latest

ENV PORT=8080

EXPOSE 8080

ENTRYPOINT ["/bin/sh", "-c"]

CMD ["set -eu; mkdir -p /config/rclone; printf '[drime]\\ntype = drime\\ntoken = %s\\n' \"$DRIME_API_TOKEN\" > /config/rclone/rclone.conf; exec rclone serve webdav drime: --addr 0.0.0.0:${PORT} --user \"$WEBDAV_USER\" --pass \"$WEBDAV_PASSWORD\" --config /config/rclone/rclone.conf"]
