#!/bin/bash
set -e
set -x

sed -i "s,TARGET_HOST_PORT,${TARGET_HOST_PORT},g" /etc/nginx/conf.d/default.conf
sed -i "s,HEALTHCHECK_PATH,${HEALTHCHECK_PATH},g" /etc/nginx/conf.d/default.conf

openssl req -x509 -nodes -days 3650 -subj "/C=DE/ST=Hamburg/O=https-auth-proxy/CN=localhost" \
            -addext "subjectAltName=DNS:localhost" -newkey rsa:2048 \
            -keyout /tmp/nginx/nginx-selfsigned.key -out /tmp/nginx/nginx-selfsigned.crt

# generate encrypted password by using secret variable
htpasswd -c -b /etc/nginx/.htpasswd admin "${ADMIN_PASSWD}"

# run additional commands given by Dockerfile
exec "$@"
