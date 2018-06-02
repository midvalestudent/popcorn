include Makefile.local


.PHONY: all
all:
	@echo "popcorn: serve mvk files for streaming"
	@echo
	@echo "Available targets:"
	@echo
	@echo "  build - build container"
	@echo "  install - install script"
	@echo
	@echo "Contact: roger.d.donaldson@gmail.com"

.PHONY: build
build:
	( \
    cd docker; \
    docker build -t popcorn .; \
)

.PHONY: install
install:
	( \
    cp scripts/popcorn.sh $(BIN_DIRECTORY); \
)
