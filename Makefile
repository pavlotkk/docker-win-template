APP_VERSION = 0.0.0-alfa
APP_NAME = demo_server
DOCKER_IMAGE_NAME = $(APP_NAME):$(APP_VERSION)
DOCKER_IMAGE_FILE = $(APP_NAME)_$(APP_VERSION)
DOCKER_CONTAINER_NAME = $(APP_NAME)-$(APP_VERSION)

.PHONY: help

help:
	@echo "\
--- docker ---\n\
docker-build:               build portable docker image\n\
docker-build-image:         build docker image\n\
docker-export-image:        export image\n\
docker-import-image:        load image to docker registry\n\
--- common ---\n\
version:                    get app version\n\
"

# docker commands

docker-build: docker-build-image docker-export-image
	docker image rm $(DOCKER_IMAGE_NAME)

docker-build-image:
	docker build --file Dockerfile.server --no-cache -t $(DOCKER_IMAGE_NAME) .

docker-export-image:
	docker save -o $(DOCKER_IMAGE_FILE).tar $(DOCKER_IMAGE_NAME)

docker-import-image:
	docker load -i $(DOCKER_IMAGE_FILE).tar

# common

version:
	@echo $(APP_VERSION)
