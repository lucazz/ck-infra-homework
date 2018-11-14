.DEFAULT_GOAL:=help
SHELL:=/bin/bash
DOCKER_TAG=$(shell git rev-parse --short HEAD)

##@ Cleanup
.PHONY: clean
clean: ## Cleanup the project folders
	$(info Cleaning up things)
	docker-compose stop
	docker-compose rm -f
	docker rmi -f lucazz/convertkit:latest
	rm -rf .mysql

##@ Building
.PHONY: build
build: clean ## Build the project
	$(info Building the project)
	docker-compose build app
	docker build -t lucazz/convertkit:$(DOCKER_TAG) .
	docker tag lucazz/convertkit:$(DOCKER_TAG) lucazz/convertkit:latest

##@ Running
.PHONY: run
run: ## Run the project
	$(info Running the project)
	docker-compose up -d

##@ Pushing
.PHONY: push
push: ## Push recently built docker images to registry
	$(info Pushing docker images)
	docker push lucazz/convertkit:$(DOCKER_TAG)
	docker push lucazz/convertkit:latest

##@ Helpers
.PHONY: help
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
