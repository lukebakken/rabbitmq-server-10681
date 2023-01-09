.PHONY: clean down perms rmq-perms up

clean: down perms
	rm -rf $(CURDIR)/data/*/rabbit*
	rm -rf $(CURDIR)/log/*.log

down:
	docker compose down

perms:
	sudo chown -R "$(USER):$(USER)" data log

rmq-perms:
	sudo chown -R '999:999' data log
	sudo chmod 0775 data log
	sudo chmod 0775 data/rmq0 log/rmq0

up: rmq-perms
	docker compose build --build-arg VERSION=3.10-management-alpine
	docker compose up

upgrade: down
	docker compose build --build-arg VERSION=3.11-management-alpine
	docker compose up
