
clean:
	rm -rf ./build/*

install:
	./scripts/install-deps

run:
	sudo echo "Starting..."
	foreman start

.PHONY: install clean run
