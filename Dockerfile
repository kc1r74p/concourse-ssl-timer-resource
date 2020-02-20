FROM alpine:latest
LABEL maintainer="Patrick M."

# coreutils for date -d
# bash
# bind-tools for host
# openssl for cert checks
# jq for json transforms
RUN apk upgrade --update-cache --available && \
    apk add coreutils bash jq bind-tools openssl && \
    rm -rf /var/cache/apk/*

COPY ./assets/* /opt/resource/

RUN chmod 755 /opt/resource/check \
    && chmod +x /opt/resource/days_left.sh \
    && chmod +x /opt/resource/in \
    && chmod +x /opt/resource/out
