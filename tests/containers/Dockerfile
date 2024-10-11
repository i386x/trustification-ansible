FROM quay.io/fedora/fedora:latest

ARG SOURCEDIR
ARG WORKSPACE

RUN echo ==== Checking arguments ==== && \
    { test -n "${SOURCEDIR}" || { echo "Need SOURCEDIR" >&2; false; } } && \
    { test -n "${WORKSPACE}" || { echo "Need WORKSPACE" >&2; false; } } && \
    echo ==== Updating ==== && \
    dnf -y update && \
    echo ==== Installing bunch of handy utilities ==== && \
    dnf --setopt=install_weak_deps=False -y install \
        less \
        procps-ng \
        psmisc \
        tree \
        which && \
    echo ==== Installing tests requirements ==== && \
    dnf --setopt=install_weak_deps=False -y install \
        gcc \
        libvirt \
        libvirt-daemon-kvm \
        libvirt-devel \
        openssh \
        openssh-clients \
        pkgconf-pkg-config \
        python3-devel \
        qemu-system-x86-core \
        util-linux \
        xorriso && \
    echo ==== Cleaning dnf cache ==== && \
    dnf clean all && \
    echo ==== Customizing dot files ==== && \
    echo "alias la='ls -la'" >> ~/.bashrc && \
    echo ==== Creating directories ==== && \
    mkdir -p "/${SOURCEDIR}" && \
    echo ==== Configure libvirt ==== && \
    usermod -aG wheel qemu && \
    : Uncomment these \`sed\`s in case of problems && \
    sed -i -e 's/^#remember_owner[ ]*=.*$/remember_owner = 0/g' /etc/libvirt/qemu.conf && \
    : sed -i -e 's/^#cgroup_device_acl[ ]*=.*$/cgroup_device_acl = []/g' /etc/libvirt/qemu.conf && \
    sed -i -e 's/^#namespaces[ ]*=.*$/namespaces = []/g' /etc/libvirt/qemu.conf && \
    echo ==== Enabling services ==== && \
    systemctl enable libvirtd

WORKDIR /${SOURCEDIR}

ENTRYPOINT ["/usr/sbin/init"]
