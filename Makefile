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
	./app/docker/build.sh
	./server/docker/build.sh

.PHONY: push_image
push_image:
	minikube image load debug:k8s_webApp
	minikube image load weblog-db:v1.0.0
	minikube image load weblog-app:v1.0.0
	minikube image load weblog-web:v1.0.0

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
apply: apply_debug apply_database init_db apply_app ;

.PHONY: init_db
init_db:
	./database/utils/initialize_db.sh

.PHONY: delete
delete: delete_debug delete_database ;

.PHONY: terminate
terminate: delete_debug delete_database clean_storage ;


## development
.PHONY: apply_debug
apply_debug:
	./debug/utils/apply_resources.sh

.PHONY: apply_database
apply_database:
	./database/utils/apply_resources.sh

.PHONY: apply_app
apply_app:
	./app/utils/apply_resources.sh

.PHONY: apply_server
apply_server:
	./server/utils/apply_resources.sh

.PHONY: apply_app_debug
apply_app_debug:
	./app/debug/check_primary_db_ip.sh
	./app/debug/apply_resources.sh
	./app/debug/run_debug_app.sh

.PHONY: apply_server_debug
apply_server_debug:
	./server/debug/apply_resources.sh
	./server/debug/run_container.sh


.PHONY: delete_debug
delete_debug:
	./debug/utils/delete_resources.sh

.PHONY: delete_database
delete_database:
	./database/utils/delete_resources.sh

.PHONY: delete_app
delete_app:
	./app/utils/delete_resources.sh

.PHONY: delete_server
delete_server:
	./server/utils/delete_resources.sh

.PHONY: delete_app_debug
delete_app_debug:
	./app/debug/stop_debug.sh

.PHONY: delete_server_debug
delete_server_debug:
	./server/debug/stop_debug.sh


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