BRANCH_NAME ?= $(shell git rev-parse --abbrev-ref HEAD)
GIT_COMMIT ?= $(shell git rev-parse --short=7 HEAD)
DOCKER_DOMAIN ?= docker-hub.grofer.io

docker_build:
	docker build -t ${DOCKER_DOMAIN}/prerender/prerender:${BRANCH_NAME}-${GIT_COMMIT} -f Dockerfile .

docker_push:
	docker push ${DOCKER_DOMAIN}/prerender/prerender:${BRANCH_NAME}-${GIT_COMMIT}