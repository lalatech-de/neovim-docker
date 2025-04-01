FROM archlinux:base

ENV PATH="${PATH}:/root/.local/bin"

RUN \
  pacman -Syu --noconfirm && \
  pacman -S --noconfirm \
    fd    \
    gcc   \
    gcc13 \
    fzf   \
    git   \
    make  \
    curl  \
    wget  \
    bash  \
    gzip  \
    unzip \
    neovim \
    ripgrep \
    lazygit \
    python-pip \
    pkg-config \
    base-devel \
    go \
    npm \
    ruby \
    yarn  \
    cargo  \
    python3 \
    zsh  && \
  mkdir -p /edit

COPY entrypoint.sh .

VOLUME  /root
WORKDIR /root

CMD ["/bin/bash", "/entrypoint.sh"]