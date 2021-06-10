# Sencha Build Tools

`sencha` command as [`docker container`](https://hub.docker.com/r/rednoah/sencha-build).
- [`sencha` (*Dockerfile*)](https://github.com/rednoah/docker-sencha/blob/master/Dockerfile)

## Usage:
```sh
docker run -it -v "$PWD/example:/src" -p 1841:1841 docker-sencha app watch
```

## GitHub Actions:
[![Build Docker](https://github.com/rednoah/docker-sencha/actions/workflows/docker.yml/badge.svg)](https://github.com/rednoah/docker-sencha/actions/workflows/docker.yml)
