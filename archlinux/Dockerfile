FROM archlinux:latest

ENV TZ=America/New_York
RUN ln -sf "/usr/share/zoneinfo/${TZ}" /etc/localtime

ENV LANG=en_US.UTF-8
RUN echo "${LANG} UTF-8" >> /etc/locale.gen && \
    locale-gen && \
    echo "LANG=${LANG}" > /etc/locale.conf

ARG SHELL
ARG USER
RUN useradd -m -G wheel -s ${SHELL} ${USER} && \
    echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

ARG BUILD_TIME
COPY packages.txt /tmp/
RUN xargs -a /tmp/packages.txt pacman -Sy --needed --noconfirm && \
    pacman -Scc && \
    rm /tmp/packages.txt

USER ${USER}
WORKDIR /home/${USER}

CMD ["sleep", "infinity"]
