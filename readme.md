# Readme

## Requirements

1. docker
2. docker compose
3. knowing how to quit vim

## Setup

1. (Optional) run `cp .env.template .env` in repo root path and set desired distro in lower case (see bellow)
2. run `docker compose build` to build the image
3. run the script via `./nvim.sh <project-path>`, example `./nvim.sh ~/.config/nvim`

## Available configurations

the following configurations can be set via `NVIM_DISTRO` in `.env` to be setup automatically

[AstroNvim](https://docs.astronvim.com/mappings)
[Kickstart](https://github.com/nvim-lua/kickstart.nvim)
[LazyVim](https://www.lazyvim.org)
[LunarVim](https://www.lunarvim.org/)
[NormalNvim](https://normalnvim.github.io/docs/keymaps/)
[NvChad](https://nvchad.com/docs/features#lsp_signature)
[SpaceVim](https://spacevim.org)

## Custom configuration

Just create a folder under `configs` ex `kickstart` and put
your `nvim` configuration folder under `configs/kickstart/.config/`
`configs/kickstart/.config/nvim/<your-files-are-here>`

If unsure start with a predefined example first.

## References

https://github.com/lanjelin/nvim-docker
