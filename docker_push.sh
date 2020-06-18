#!/usr/bin/env bash
set -e

docker login -u "$DOCKERHUB_USERNAME" -p "$DOCKERHUB_PASSWORD"
docker push hlag/https-auth-proxy:latest
