
install:
	./scripts/install-deps

reset:
	echo "Not implemented"

run:
	sudo echo "Starting..."
	foreman start

.PHONY: install reset run
