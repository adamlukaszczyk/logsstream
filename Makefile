.PHONY: help

help: # https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

configure: ## Configure vm.max_map_count required by Elasticsearch
	sudo sysctl -w vm.max_map_count=262144 \
		&& sudo echo 'vm.max_map_count=262144' >> /etc/sysctl.conf;

elk-build: ## Setup ELK
	docker-compose -f docker-compose-elk.yml up --build -d;

elk-stop: ## Stop ELK
	docker-compose -f docker-compose-elk.yml stop;

emitters-build: ## Setup logs emitters
	docker-compose -f docker-compose-logsemitters.yml up --build -d;

emitters-stop: ## Stop logs emitters
	docker-compose -f docker-compose-logsemitters.yml stop;

logs: ## Open Kibana in a browser
	open http://0.0.0.0:5611/app/logtrail

emit: ## Open emitter in a browser
	open http://0.0.0.0:7777/
