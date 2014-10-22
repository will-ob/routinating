
install:
	./scripts/install-deps

reset:
	echo "Not implemented"

run:
	foreman start

.PHONY: install reset run
