ARG platform="linux/amd64"
FROM --platform=$platform golang:1.15 AS builder

RUN go get github.com/distribution/distribution/cmd/registry

FROM --platform=$platform gcr.io/distroless/base

COPY --from=builder /go/bin/registry /registry
COPY config.yml /config/config.yml

EXPOSE 5000

CMD ["serve", "/config/config.yml"]
ENTRYPOINT ["/registry"]
