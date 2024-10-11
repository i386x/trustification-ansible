FROM quay.io/fedora/fedora:latest

ARG SOURCEDIR
ARG WORKSPACE
ARG DEBUG1=""

RUN echo ==== Checking arguments ==== && \
    { test -n "${SOURCEDIR}" || { echo "Need SOURCEDIR" >&2; false; } } && \
    { test -n "${WORKSPACE}" || { echo "Need WORKSPACE" >&2; false; } } && \
    echo ==== Updating ==== && \
    ${DEBUG1} dnf -y update && \
    echo ==== Installing bunch of handy utilities ==== && \
    ${DEBUG1} dnf --setopt=install_weak_deps=False -y install \
        procps-ng \
        psmisc \
        tree \
        which && \
    echo ==== Installing tests requirements ==== && \
    ${DEBUG1} dnf --setopt=install_weak_deps=False -y install \
        qemu-system-x86-core \
        openssh \
        util-linux \
        xorriso && \
    echo ==== Cleaning dnf cache ==== && \
    ${DEBUG1} dnf clean all && \
    echo ==== Creating directories ==== && \
    mkdir -p "/${SOURCEDIR}"

WORKDIR /${SOURCEDIR}

ENTRYPOINT ["/usr/bin/sleep", "inf"]
