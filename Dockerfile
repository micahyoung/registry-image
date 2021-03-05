ARG arch="amd64"
FROM ${arch}/golang:1.15 AS builder

RUN go get github.com/distribution/distribution/cmd/registry

FROM alpine

COPY --from=builder /go/bin/registry /registry
COPY config.yml /config/config.yml

CMD ["serve", "/config/config.yml"]
ENTRYPOINT ["/registry"]
