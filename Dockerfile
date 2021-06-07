FROM ubuntu:18.04

LABEL maintainer="Reinhard Pointner <rednoah@filebot.net>"


ENV SENCHA_CMD_VERSION 7.4.0.39
ENV SENCHA_CMD_URL https://trials.sencha.com/cmd/$SENCHA_CMD_VERSION/no-jre/SenchaCmd-$SENCHA_CMD_VERSION-linux-64-no-jre.zip
ENV SENCHA_CMD_SHA256 63662988751948d52bc85c3a2c5286a6ad8cd232c5050cef231ac35c69241647


ENV LANG C.UTF-8


RUN apt-get update \
 && apt-get install -y curl p7zip-full openjdk-8-jdk nodejs \
 && rm -rvf /var/lib/apt/lists/*


RUN set -eux \
 ## * fetch installer archive
 && curl -L -o /tmp/SenchaCmd.zip "$SENCHA_CMD_URL" \
 && echo "$SENCHA_CMD_SHA256 */tmp/SenchaCmd.zip" | sha256sum -c - \
 ## * extract installer
 && 7z x -y -o/tmp /tmp/SenchaCmd.zip \
 && /tmp/SenchaCmd-*.sh -q -dir /opt/sencha/cmd \
 && rm -v /tmp/*.sh /tmp/*.zip


EXPOSE 1841


WORKDIR /src


ENTRYPOINT ["/opt/sencha/cmd/sencha"]
