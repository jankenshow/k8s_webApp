.PHONY: all
all: ;

## environment
.PHONY: setup
setup:
	./minikube_docker.sh
	./debug/docker/build.sh
	./database/docker/build.sh

.PHONY: docker
docker:
	./debug/docker/build.sh
	./database/docker/build.sh

.PHONY: secret_keyfile
secrets_keyfile:
	./database/utils/make_keyfile.sh

.PHONY: clean
clean: clean_storage
	minikube stop
	minikube delete

.PHONY: get_vm_ip
get_vm_ip:
	minikube ip

.PHONY: up
up:
	./minikube_docker.sh

.PHONY: down
down:
	minikube stop


## app
.PHONY: apply
apply: apply_debug apply_database ;

.PHONY: delete
delete: delete_debug delete_database ;

.PHONY: clear
clear: delete_debug delete_database clean_storage ;


## development
.PHONY: apply_debug
apply_debug:
	./debug/utils/apply_resources.sh

.PHONY: apply_database
apply_database:
	./database/utils/apply_resources.sh


.PHONY: delete_debug
delete_debug:
	./debug/utils/delete_resources.sh

.PHONY: delete_database
delete_database:
	./database/utils/delete_resources.sh


.PHONY: attach_debug
attach_debug:
	./debug/utils/exec_pod.sh

.PHONY: attach_database
attach_database:
	./database/utils/exec_pod.sh


## etc
.PHONY: clean_storage
clean_storage:
	./database/utils/clean_storage.sh
	touch ./storage/.gitkeep
	touch ./storage/pv000/.gitkeep
	touch ./storage/pv001/.gitkeep
	touch ./storage/pv002/.gitkeep