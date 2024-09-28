FROM nginxinc/nginx-unprivileged:alpine

ARG APP_NAME="MieditEmulator"
ARG APP_DESCRIPTION="Alpine NGINX server container containing miedit emulator"
ARG APP_VCS_REF
ARG APP_VCS_URL="https://github.com/Zigazou/miedit.git"
ARG APP_VERSION
ARG BUILD_DATE
ARG BUILD_VCS_REF
ARG BUILD_VCS_URL="https://github.com/bill-of-materials/docker-miedit-emulator"

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.description=$APP_DESCRIPTION \
      org.label-schema.name=$APP_NAME \
      org.label-schema.schema-version="1.0" \
      org.label-schema.url=$BUILD_VCS_URL \
      org.label-schema.vcs-ref=$APP_VCS_REF \
      org.label-schema.vcs-url=$APP_VCS_URL \
      org.label-schema.version=$APP_VERSION

USER root

COPY index.html.tmpl /tmp/index.html.tmpl
COPY 99-replace_env_vars.sh /docker-entrypoint.d/99-replace_env_vars.sh

RUN set -x \
      && apk add --update git \
      && rm -rf /usr/share/nginx/html \
      && git clone $APP_VCS_URL /usr/share/nginx/html \
      && cd /usr/share/nginx/html && git checkout $APP_VCS_REF \
      && rm -rf .git .gitignore \
      && apk del git \
      && rm -rf /var/cache/apk/* \
      && chown nginx:nginx /usr/share/nginx/html/index.html

USER nginx
