.PHONY: clean down perms rmq-perms up

clean: down perms
	rm -rf $(CURDIR)/data/rmq0/rabbit*
	rm -rf $(CURDIR)/log/rmq0/*.log

down:
	docker compose down

perms:
	sudo chown -R "$$(id -u):$$(id -g)" data log

rmq-perms:
	sudo chown -R '999:999' data log
	sudo chmod 0755 data
	sudo chmod 0755 data/rmq0
	sudo chmod 0755 log
	sudo chmod 0755 log/rmq0

up: rmq-perms
	docker compose build --pull --build-arg VERSION=3.12-management
	docker compose up --detach

upgrade: down
	$(CURDIR)/upgrade.sh
