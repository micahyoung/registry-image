# docker-distribution image built for Linux and Windows, AMD64 and ARM64

Equivalent to `docker.io/library/registry:2` with the following changes:
  * Builds binaries from latest released [docker-distribution](https://github.com/distribution/distribution/releases) source using `docker.io/library/golang`.
  * Builds multi-os images:
    * `linux/amd64`, `linux/arm64` (`gcr.io/distroless/base`-based)
    * `windows/amd64` (`mcr.microsoft.com/windows/nanoserver:1809`-based)
  * All images built/published from this repo via [GitHub Actions](https://github.com/micahyoung/registry-image/actions).
  * Registry config allows [foreign layers](https://github.com/distribution/distribution/blob/main/docs/spec/manifest-v2-2.md) (present in all Windows images).

## Motivation
`docker.io/library/registry` does not publish Windows images and is [unresponsive](https://github.com/docker/distribution-library-image/pull/42) on creating them. Their [default config](https://github.com/docker/distribution-library-image/blob/master/config-example.yml) also does not allow foreign layers [by default](https://github.com/distribution/distribution/issues/2795). There is also little transparency into the current build processes for their images.

## Usage (any OS/arch)
```bash
docker run --detach --publish 5000:5000 docker.io/micahyoung/registry
```

### Optional: reuse registry store
```bash
docker run --detach --publish 5000:5000 --volume registry-storage:/registry-storage docker.io/micahyoung/registry
```
