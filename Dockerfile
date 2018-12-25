FROM python:2.7-alpine

MAINTAINER Gamal Abdul Nasser <gamalanpro@gmail.com>

RUN adduser -D sixpack && \
    adduser sixpack tty

WORKDIR /home/sixpack

RUN apk update && \
    apk add --no-cache libstdc++ && \
    apk add --no-cache --virtual=.build-dependency openssl-dev gfortran gcc g++ file binutils musl-dev wget git

RUN pip install --upgrade pip && \
    pip install sixpack supervisor gunicorn

RUN apk del .build-dependency

COPY deployment /opt/docker/etc/supervisor.d
COPY supervisord.conf boot.sh ./

RUN chown -R sixpack:sixpack ./ && \
    chmod a+x boot.sh

ENV SIXPACK_PORT=8000
ENV SIXPACK_WEB_PORT=8080
ENV SIXPACK_CONFIG_ENABLED=true
ENV SIXPACK_CONFIG_REDIS_PORT=6379
ENV SIXPACK_CONFIG_REDIS_HOST=localhost
ENV SIXPACK_CONFIG_REDIS_PASSWORD=''
ENV SIXPACK_CONFIG_REDIS_DB=15
ENV SIXPACK_CONFIG_REDIS_PREFIX=sixpack
ENV SIXPACK_CONFIG_ROBOT_REGEX='$^|trivial|facebook|MetaURI|butterfly|google|amazon|goldfire|sleuth|xenu|msnbot|SiteUptime|Slurp|WordPress|ZIBB|ZyBorg|pingdom|bot|yahoo|slurp|java|fetch|spider|url|crawl|oneriot|abby|commentreader|twiceler'
ENV SIXPACK_CONFIG_ASSET_PATH=gen
ENV SIXPACK_CONFIG_SECRET='123456789'

EXPOSE 8000
EXPOSE 8080

USER sixpack

ENTRYPOINT ["./boot.sh"]