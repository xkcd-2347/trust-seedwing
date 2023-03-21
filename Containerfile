FROM ghcr.io/seedwing-io/swio:0.1.0-nightly.273eeb38

ADD data /data
ADD policies /policies

EXPOSE 8080

ENTRYPOINT ["/swio", "serve", "-p", "/policies", "-d", "/data"]
