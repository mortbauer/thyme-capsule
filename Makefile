.PHONY: build publish run

IMAGE_NAME=mortbauer/thyme-capsule

build:
	docker build . --tag ${IMAGE_NAME}

publish:
	docker push ${IMAGE_NAME}

run:
	docker run --rm -it -v ${PWD}/.env:/app/.env -v /var/run/postgresql:/var/run/postgresql -v ${PWD}/database.json:/app/src/database.json  -p 5000:5000 -v ${PWD}/tmp:/app/tmp -e NODE_ENV=production mortbauer/thyme-capsule

#  vim: set noexpandtab ts=2 sw=2 tw=0 :
