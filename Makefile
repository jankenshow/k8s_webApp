.PHONY: all
all: ;

## environment
.PHONY: setup
setup:
	./minikube.sh

.PHONY: clean
setup:
	minikube stop
	minikube delete

.PHONY: get_vm_ip
get_vm_ip:
	minikube ip


## app
.PHONY: run
run: apply_debug apply_database ;

.PHONY: stop
stop: delete_debug delete_database ;

.PHONY: delete
delete: delete_debug delete_database clean_storage ;


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