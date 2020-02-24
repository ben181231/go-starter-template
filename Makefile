TIMESTAMP=$(shell date +%s)
COMMIT_HASH=$(shell git rev-parse --short HEAD)

IMAGE_NAME="localhost/go-starter-template"


.PHONY: all
all: dep build

.PHONY: dep
dep:
	@go mod tidy

.PHONY: build
build:
	@CGO_ENABLED=0 go build -o bin/run ./cmd/run

.PHONY: run
run:
	@CGO_ENABLED=0 go run ./cmd/run

.PHONY: docker/image
docker/image:
	@docker build \
		-t "${IMAGE_NAME}:commit-${COMMIT_HASH}" \
		.
	@docker tag \
		"${IMAGE_NAME}:commit-${COMMIT_HASH}" \
		"${IMAGE_NAME}:build-${TIMESTAMP}"
