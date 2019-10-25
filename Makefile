DOCKER_TAG:=1.0
DOCKER_IMAGE:=njoyce/helloworld-python

.PHONY: build
build: requirements.txt
	@docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .

.PHONY: push
push: build
	@docker push $(DOCKER_IMAGE):$(DOCKER_TAG)

.PHONY: run
run: build
	@docker run --rm -it -p8080:8080 $(DOCKER_IMAGE):$(DOCKER_TAG)

Pipfile.lock: Pipfile
	@pipenv install
	@touch $@

requirements.txt: Pipfile.lock
	@pipenv lock -r > $@
