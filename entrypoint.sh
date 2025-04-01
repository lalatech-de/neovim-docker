#!/bin/bash

[ -f "/root/.zshrc" ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install NVIM distribution if set
if [ -n "$NVIM_DISTRO" ] && [ ! -d "/root/.config/nvim" ] && [ ! -d "/root/.config/lvim" ]; then
  NVIM_DISTRO="${NVIM_DISTRO,,}"
  case "$NVIM_DISTRO" in
    astronvim ) repo="https://github.com/AstroNvim/template"     ;;
    lazyvim   ) repo="https://github.com/LazyVim/starter"        ;;
    lunarvim  ) bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) ;;
    kickstart ) repo="https://github.com/nvim-lua/kickstart.nvim.git" ;;
    normalnvim) repo="https://github.com/NormalNvim/NormalNvim.git" ;;
    nvchad    ) repo="https://github.com/NvChad/starter"         ;;
    spacevim  ) curl -sLf https://spacevim.org/install.sh | bash ;;
  esac

  if [[ -n "$repo" ]]; then
    git clone --depth 1 "$repo" /root/.config/nvim && rm -rf /root/.config/nvim/.git
  fi
fi

# Launch the appropriate editor
[ "$NVIM_DISTRO" == "lunarvim" ] && exec lvim || exec nvim
