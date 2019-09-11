FROM alpine:3.10
LABEL "com.github.actions.name"="md-linkcheck"
LABEL "com.github.actions.description"="Validate links in markdown files."
LABEL "com.github.actions.icon"="link"
LABEL "com.github.actions.color"="green"
LABEL "repository"="https://github.com/testthedocs/md-linkcheck-action.git"
LABEL "homepage"="https://github.com/testthedocs/md-linkcheck-action"
LABEL maintainer="svx <sven@testthedocs.org>"

# Version of markdown-link-check
ENV MD_LINKCHECK 3.7.3

# Install
RUN apk add --no-cache \
        bash \
        nodejs \
        npm \
    && apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        fd \
    && npm install --no-cache -g markdown-link-check@${MD_LINKCHECK}

WORKDIR /srv
COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh
#ENTRYPOINT ["bash"]
ENTRYPOINT ["entrypoint.sh"]
