IDENTIFIER="${TRAVIS_REPO_SLUG}"
BUILD_NUMBER="${TRAVIS_BUILD_NUMBER}"

all:

build:
	docker build -t $(IDENTIFIER):$(BUILD_NUMBER) docker

test:
	docker run -d -p 2379:2379 -t $(IDENTIFIER):$(BUILD_NUMBER)
	until curl http://127.0.0.1:2379/version; do sleep 2; done

push:
	docker push $(IDENTIFIER):$(BUILD_NUMBER)
