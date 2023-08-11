FROM ubuntu:22.04

LABEL maintainer="Reinhard Pointner <rednoah@filebot.net>"


ENV SENCHA_CMD_URL https://trials.sencha.com/cmd/7.7.0/SenchaCmd-7.7.0.36-linux-amd64.sh.zip
ENV SENCHA_CMD_SHA256 29e3290a4e91330b6b16ec06bc967ae04609eb70e39d58c7e3ea45f3f77e95e2


ENV LANG C.UTF-8


RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y curl unzip openjdk-11-jdk-headless nodejs npm \
 && rm -rvf /var/lib/apt/lists/*


RUN set -eux \
 ## * fetch installer archive
 && curl -L -o /tmp/SenchaCmd.zip "$SENCHA_CMD_URL" \
 && echo "$SENCHA_CMD_SHA256 */tmp/SenchaCmd.zip" | sha256sum -c - \
 ## * extract installer
 && unzip -o /tmp/SenchaCmd.zip -d /tmp \
 && /tmp/SenchaCmd-*.sh -q -dir /opt/sencha/cmd \
 && rm -v /tmp/*.sh /tmp/*.zip
 ## * remove native dependencies
 && find /opt/sencha/cmd/bin/linux-x64 -type f -executable -print -delete \
 && ln -s /usr/bin/node /opt/sencha/cmd/bin/linux-x64/node/node


EXPOSE 1841


WORKDIR /src


ENTRYPOINT ["/opt/sencha/cmd/sencha"]
