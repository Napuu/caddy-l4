FROM docker.io/golang:1.22.5 AS build
#WORKDIR /build
#COPY . .

RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
RUN xcaddy build --with github.com/mholt/caddy-l4


#FROM docker.io/fedora:41
#COPY --from=build /build/coredns /bin/coredns
CMD ["/go/caddy"]
