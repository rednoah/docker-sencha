# Sencha Build Tools

Docker image for [Sencha Cmd](https://www.sencha.com/products/extjs/cmd-download/).
- [`sencha` (*Dockerfile*)](https://github.com/rednoah/docker-sencha/blob/master/Dockerfile)

## Usage:
```sh
docker run -it -v "$PWD/example:/src" -p 1841:1841 docker-sencha app watch
```

## GitHub Actions:
[![Build Docker](https://github.com/rednoah/docker-sencha/actions/workflows/docker.yml/badge.svg)](https://github.com/rednoah/docker-sencha/actions/workflows/docker.yml)
