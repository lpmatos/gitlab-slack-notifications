ARG RUBY_VERSION=2.6.5-alpine3.10

FROM ruby:${RUBY_VERSION}

LABEL maintainer="Lucca Pessoa da Silva Matos - luccapsm@gmail.com" \
        org.label-schema.version="1.0.0" \
        org.label-schema.release-data="2020-04-05" \
        org.label-schema.url="https://github.com/lpmatos" \
        org.label-schema.project="https://github.com/lpmatos/gitlab-slack-notifications" \
        org.label-schema.ruby="https://www.ruby-lang.org/pt/" \
        org.label-schema.gitlab="https://docs.gitlab.com/" \
        org.label-schema.slack="https://api.slack.com/" \
        org.label-schema.name="GitLab Slack Notifications"

ENV HOME=/usr/src/code

RUN set -ex && apk update && \
    apk add --no-cache --update build-base make gcc

RUN mkdir -p /var/log && touch /var/log/file.log

WORKDIR ${HOME}

RUN gem install rake bundle

COPY [ "./code", "." ]

COPY [ "./values.yml", "." ]

RUN rake main:install

ENTRYPOINT []

CMD []
