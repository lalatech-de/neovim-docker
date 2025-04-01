

# put path relative to script
SCRIPT_PATH="${BASH_SOURCE[0]}"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
# Load env File

if [ ! -f $SCRIPT_DIR/.env ]; then
  cp $SCRIPT_DIR/.env.template $SCRIPT_DIR/.env
  echo ".env file created from .env.template"
fi

. $SCRIPT_DIR/.env

mkdir -p $SCRIPT_DIR/configs

if [ ! $# -eq 0 ]; then
  [[ -d "$1" ]] || [[ -f "$1" ]] || touch "$1"
  [[ -f "$1" ]] && NWD="$(dirname $1)" || NWD="$(realpath $1)"
  docker run -it --rm --name nvim-docker-cli \
    -w "/edit$NWD" \
    -v "$(realpath $1)":"/edit$(realpath $1)" \
    -v $SCRIPT_DIR/configs/$NVIM_DISTRO:/root \
    neovim-docker:latest \
    nvim "/edit$(realpath $1)"
else
  docker run -it --rm --name nvim-docker-cli \
    -w "/root" \
    -v $SCRIPT_DIR/configs/$NVIM_DISTRO:/root \
    neovim-docker:latest \
    nvim
fi