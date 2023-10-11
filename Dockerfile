FROM alpine:3.18
LABEL "com.github.actions.name"="md-linkcheck"
LABEL "com.github.actions.description"="Validate links in Markdown files."
LABEL "com.github.actions.icon"="link"
LABEL "com.github.actions.color"="green"
LABEL "repository"="https://github.com/testthedocs/md-linkcheck-action.git"
LABEL "homepage"="https://github.com/testthedocs/md-linkcheck-action"
LABEL maintainer="svx <sven@testthedocs.org>"

# Version of markdown-link-check
ENV MD_LINKCHECK 3.11.2

# Install
# hadolint ignore=DL3018
RUN apk add --no-cache \
        bash \
        nodejs \
        npm \
        fd \
    && npm install --no-cache -g markdown-link-check@${MD_LINKCHECK}

WORKDIR /srv
COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh
#ENTRYPOINT ["bash"]
ENTRYPOINT ["/srv/entrypoint.sh"]
