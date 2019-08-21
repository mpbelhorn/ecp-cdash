#!/bin/bash

[ ! -e "./openshift/cdash_config.yaml" ] && \
  oc new-app src/CDash/. \
    --name ecp-cdash \
    -e CDASH_ROOT_ADMIN_PASS=secret \
    -e CDASH_STATIC_USERS="REPLACEME" \
    --output=yaml > openshift/cdash_config.yaml

[ ! -e "./openshift/db_config.yaml" ] && \
oc new-app mysql \
    --name ecp-cdash-db \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
    -e MYSQL_ROOT_PASSWORD= \
    -e MYSQL_DATABASE=cdash \
    -e MYSQL_ROOT_HOST='%' \
    --output=yaml > openshift/db_config.yaml
