
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
