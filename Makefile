.PHONY: clean down perms rmq-perms up

clean: down perms
	rm -rf $(CURDIR)/data/rmq0/rabbit*
	rm -rf $(CURDIR)/log/rmq0/*.log

down:
	docker compose down

perms:
	sudo chown -R "$(USER):$(USER)" data log

rmq-perms:
	sudo chown -R '100:101' data log
	sudo chmod 0755 data
	sudo chmod 0755 data/rmq0
	sudo chmod 0755 log
	sudo chmod 0755 log/rmq0

up: rmq-perms
	docker compose build --build-arg VERSION=3.10-management-alpine
	docker compose up

upgrade: down
	docker compose build --build-arg VERSION=3.11-management-alpine
	docker compose up
