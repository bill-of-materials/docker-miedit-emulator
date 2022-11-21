#!/bin/sh

set -e

envsubst < "/tmp/index.html.tmpl" > "/usr/share/nginx/html/index.html"

exit 0
