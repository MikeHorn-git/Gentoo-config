EMAINT_UPDATE := --auto sync

EMERGE_REBUILD := --ask --verbose --changed-use --update --deep @world
EMERGE_UPGRADE := --ask --verbose --update --deep --newuse @world

SU = sudo

.DEFAULT_GOAL := help

help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  help         Display this help message"
	@echo "  clean        Clean Gentoo"
	@echo "  obsolete     Check for obsolete package"
	@echo "  rebuild      Rebuild Gentoo after USE flags changed"
	@echo "  update       Update Gentoo"
	@echo "  upgrade      Upgrade Gentoo"
	@echo "  all          Update & Upgrade Gentoo"

clean:
	@$(SU) eclean-dist
	@$(SU) eclean-pkg
	@$(SU) emerge --depclean

obsolete:
	@$(SU) eix-test-obsolete

rebuild:
	@$(SU) emerge $(EMERGE_REBUILD)

update:
	@$(SU) emaint $(EMAINT_UPDATE)

upgrade:
	@$(SU) emerge $(EMERGE_UPGRADE

all: update upgrade

.PHONY: help clean obsolete rebuild update upgrade all
