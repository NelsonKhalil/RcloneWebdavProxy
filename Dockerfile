FROM rclone/rclone:latest

ENV PORT=8080
ENV RCLONE_CONFIG_DRIME_TYPE=drime

EXPOSE 8080

ENTRYPOINT ["/bin/sh", "-c"]

CMD ["export RCLONE_CONFIG_DRIME_TOKEN=\"$DRIME_API_TOKEN\"; exec rclone serve webdav drime: --addr 0.0.0.0:${PORT} --user \"$WEBDAV_USER\" --pass \"$WEBDAV_PASSWORD\""]
