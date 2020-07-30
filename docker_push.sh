#!/usr/bin/env bash
set -e

# Information about user and password can be found in the README.md file
docker login -u "$DOCKERHUB_USERNAME" -p "$DOCKERHUB_PASSWORD"
docker push hlag/https-auth-proxy:latest
