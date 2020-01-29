# =============================================================================
# BASE CONFIGURATION
# =============================================================================

ARG RUBY_VERSION=2.6.5-alpine3.10

# =============================================================================
# BASE ENV
# =============================================================================

FROM ruby:${RUBY_VERSION}

LABEL maintainer="Lucca Pessoa da Silva Matos - luccapsm@gmail.com"

WORKDIR /usr/src/app/

RUN apk add --no-cache build-base make gcc

COPY [ "./code", "." ]

COPY [ "./Gemfile", "." ]

RUN bundle install

ENTRYPOINT [ "ruby", "integration.rb" ]

CMD [ "-p", "msp/helm/charts", "-c", "saas-msp" ]
