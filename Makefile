all: build run

build:
	docker build -t nerdfont:latest .

run:
	docker run -it --rm -v ${PWD}:/opt nerdfont:latest bash
