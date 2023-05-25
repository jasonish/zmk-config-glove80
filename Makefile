TAG :=	private/glove80

all:
	docker build --tag $(TAG) .
	docker run --rm -it -e PUID=$(id -u) -e PGID=$(id -g) \
		-v $(PWD)/output:/output:z \
		-v $(PWD)/config:/app/config:ro,z $(TAG)

clean:
	find . -name \*~ -delete
	cd output && git clean -df
