PROVIDER	=	docker
UNAME		=	ninachloe
IMAGE		=	orfs_compact
LABEL		=	latest

.PHONY: build
build:
	$(PROVIDER) build --no-cache -t $(UNAME)/$(IMAGE):$(LABEL) .

.PHONY: run
run:
	$(PROVIDER) run --rm -it --hostname $(IMAGE) --name $(UNAME)_testrun $(UNAME)/$(IMAGE):$(LABEL) "/bin/bash"

.PHONY: publish
publish: build
	$(PROVIDER) push $(UNAME)/$(IMAGE):$(LABEL)
	$(PROVIDER) rmi $(IMAGE)
