FROM alpine:latest
LABEL maintainer="Patrick M."

RUN apk upgrade --update-cache --available && \
    apk add openssl && \
    rm -rf /var/cache/apk/*

COPY ./assets/* /opt/resource/

RUN chmod 755 /opt/resource/check \
    && chmod +x /opt/resource/in \
    && chmod +x /opt/resource/out

RUN /opt/resource/check/days_left.sh google.com
