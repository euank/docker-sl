
all: scratch alpine

scratch:
	docker build -f Dockerfile.build -t euank/sl:build .
	mkdir -p bin
	docker run -v "$(shell pwd)/bin:/out" euank/sl:build
	docker build -f Dockerfile.release -t euank/sl:latest .

alpine:
	docker build -f Dockerfile.build -t euank/sl:build .
	docker run -v "$(shell pwd)/bin:/out" euank/sl:build
	docker build -f Dockerfile.alpinerelease -t euank/sl:tty .

