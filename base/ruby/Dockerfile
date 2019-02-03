FROM ruby:2.6.1-alpine3.8 as base

RUN mkdir -p /usr/local/etc \
  && { \
    echo 'install: --no-document'; \
    echo 'update: --no-document'; \
  } >> /etc/gemrc

# RUN apk add --no-cache qt-dev

# install ruby, ruby dev, bundler
RUN apk update && apk add --no-cache \
  ruby \
  ruby-bundler \
  ruby-bigdecimal \
	ruby-dev \
	build-base \
  libssl1.0 \
  libc6-compat
