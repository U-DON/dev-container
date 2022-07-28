FROM manjarolinux/base:latest

ENV TZ=America/New_York
RUN ln -sf "/usr/share/zoneinfo/${TZ}" /etc/localtime

ARG SHELL
ARG USER

# The base image creates a builder user.
# It needs to be deleted in order to give ID 1000 to the default user,
# allowing ownership in the home volume to be shared across containers.

RUN userdel -r builder && \
    groupadd -g 20 staff && \
    useradd -m -G staff -s ${SHELL} ${USER} && \
    useradd -G staff -u 501 macos && \
    echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

ARG BUILD_TIME
COPY packages.txt /tmp/
RUN xargs -a /tmp/packages.txt pacman -Sy --needed --noconfirm && \
    pacman -Scc && \
    rm /tmp/packages.txt

USER ${USER}
WORKDIR /home/${USER}

CMD ["sleep", "infinity"]
