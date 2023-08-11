# Sencha Build Tools

Docker image for [Sencha Cmd](https://docs.sencha.com/cmd/guides/intro_to_cmd.html).
- [`sencha` (*Dockerfile*)](https://github.com/rednoah/docker-sencha/blob/main/Dockerfile)


## Usage:

The [`sencha`](https://docs.sencha.com/cmd/guides/intro_to_cmd.html) command-line tool:

```sh
docker run -it -v "$PWD/example:/src" -p 1841:1841 docker-sencha app watch
```


## GitHub Actions:
[![Build Docker](https://github.com/rednoah/docker-sencha/actions/workflows/docker.yml/badge.svg)](https://github.com/rednoah/docker-sencha/actions/workflows/docker.yml)
