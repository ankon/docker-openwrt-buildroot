VERSION				= 15.05
IMAGE				= openwrt_build
ifndef ($(SHELL))
	SHELL			=  bash
endif
RUN_CMD 			=  sudo docker run --rm -it \
						-v $(PWD)/bin/:/home/openwrt/build/bin/:Z \
						-v $(PWD)/files/:/home/openwrt/build/files/:Z \
						-v $(PWD)/:/srv/:Z \
						--name="$(IMAGE)_box" "$(IMAGE):$(VERSION)"
RUN_SHELL_CMD 		=  $(RUN_CMD) $(SHELL)
DOCKER_BUILD_FLAGS	+= 

.PHONY: $(IMAGE) mkdir run run-shell rmi

$(IMAGE):
	sudo docker build $(DOCKER_BUILD_FLAGS) --tag="$(IMAGE):$(VERSION)" .

mkdir:
	mkdir -p ./files
	mkdir -p ./bin

run: mkdir
	$(RUN_CMD)

run-shell: mkdir
	$(RUN_SHELL_CMD)

rmi:
	sudo docker rmi "$(IMAGE):$(VERSION)"
