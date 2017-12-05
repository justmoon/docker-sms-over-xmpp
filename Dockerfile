# Build environment
FROM golang:latest AS build-env
RUN go get github.com/mndrix/sms-over-xmpp/...

# Actual image
FROM alpine

# Install Dockerize
RUN apk add --no-cache openssl
ENV DOCKERIZE_VERSION v0.6.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# And run
WORKDIR /app
COPY --from=build-env /go/bin/sms-over-xmpp /app/
COPY ./config.toml.tmpl /app/config.toml.tmpl
CMD dockerize -template /app/config.toml.tmpl:/app/config.toml /app/sms-over-xmpp /app/config.toml
