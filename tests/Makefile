# Include user defined custom settings that overrides defaults. The dash (`-`)
# makes the missing `custom.mk` to not fail the `make` process
-include ./custom.mk

ECHO ?= echo

Q ?= @
IMAGE ?= rhtpa_installer_tester
CONTAINER ?= $(IMAGE)

.PHONY: help build test

help::
	@$(ECHO) ""
	@$(ECHO) "Usage: $(MAKE) TARGET [VARIABLES]"
	@$(ECHO) ""
	@$(ECHO) "where TARGET is one of"
	@$(ECHO) "  help"
	@$(ECHO) "    print this screen"
	@$(ECHO) ""

help::
	@$(ECHO) "  build"
	@$(ECHO) "    build the container image"
	@$(ECHO) ""
build:
	$(Q)Q="$(Q)" \
	FORCE="$(FORCE)" ./tools/build-image "$(IMAGE)" "$(CONTAINER)"

help::
	@$(ECHO) "  test"
	@$(ECHO) "    run tests in the containerized environment"
	@$(ECHO) ""
test: FORCE = 0
test: TEST =
test: build
	$(Q)Q="$(Q)" \
	TEST="$(TEST)" ./tools/run-tests "$(IMAGE)" "$(CONTAINER)"

help::
	@$(ECHO) "and VARIABLES are summarized in the following list:"
	@$(ECHO) "  VARIABLE_NAME [current value] (applies to)"
	@$(ECHO) ""
	@$(ECHO) "  CONTAINER [$(CONTAINER)] (build, test)"
	@$(ECHO) "    the container name"
	@$(ECHO) ""
	@$(ECHO) "  FORCE [$(FORCE)] (build, test)"
	@$(ECHO) "    force the image rebuild and/or container re-setup;"
	@$(ECHO) "    allowed values are:"
	@$(ECHO) "      0  do nothing (\`make test\` default)"
	@$(ECHO) "      1  do container re-setup"
	@$(ECHO) "      2  stop and remove the current running container and"
	@$(ECHO) "         rebuild the image (\`make build\` default); when"
	@$(ECHO) "         applied on \`make test\` also do container re-setup"
	@$(ECHO) ""
	@$(ECHO) "  IMAGE [$(IMAGE)] (build, test)"
	@$(ECHO) "    the image name"
	@$(ECHO) ""
	@$(ECHO) "  Q [$(Q)] (build, test)"
	@$(ECHO) "    quite mode (@ means quite, empty string means verbose)"
	@$(ECHO) ""
	@$(ECHO) "  TEST [$(TEST)] (test)"
	@$(ECHO) "    the \`grep -E\`-like test name pattern"
	@$(ECHO) ""
	@$(ECHO) "Once created and run, the container mounts the root"
	@$(ECHO) "directory of this project so it becomes a part of the file"
	@$(ECHO) "system of the container. This provides an advantage so one"
	@$(ECHO) "need not to build the container again with every change of"
	@$(ECHO) "Ansible playbooks or roles. On the other hand, one need to"
	@$(ECHO) "be cautious to not accidentally make a mistake that may lead"
	@$(ECHO) "to unrecoverable data loss."
	@$(ECHO) ""
	@$(ECHO) "In the same directory as this Makefile is located, the"
	@$(ECHO) "container creates a hidden directory with its name"
	@$(ECHO) "(.$(CONTAINER)) used as a place to store data generated at"
	@$(ECHO) "runtime, like logs, images, keys, or configuration files so"
	@$(ECHO) "these can be directly accessible and manageable from the"
	@$(ECHO) "host."
	@$(ECHO) ""
