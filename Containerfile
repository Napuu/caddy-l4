FROM docker.io/golang:1.22.5 AS build
WORKDIR /build

RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
RUN xcaddy build --with github.com/mholt/caddy-l4

FROM scratch
COPY --from=build /build/caddy /bin/caddy
ENTRYPOINT ["/bin/caddy"]
