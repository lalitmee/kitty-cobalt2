#!/bin/bash

KITTY_DIR="$HOME/.config/kitty"
KITTY_THEMES_DIR="$HOME/.config/kitty/themes/"

if [ -d "$KITTY_THEMES_DIR" ]; then
    cd "$KITTY_THEMES_DIR" || exit
else
    echo "$HOME/.config/kitty/themes directory doesn't exist, creating..."
    mkdir "$KITTY_THEMES_DIR"
    cd "$KITTY_THEMES_DIR" || exit
fi

curl -k https://github.com/lalitmee/kitty-cobalt2/blob/master/cobalt2.conf >> cobalt2.conf
cd "$KITTY_DIR" || exit

KITTY_CONF_KITTY_CONTENT="

# >> cobalt2 theme
# >> don't remove this if you don't want to loose your cobalt2 theme
include $HOME/.config/kitty/themes/cobalt2.conf
"

echo "$KITTY_CONF_KITTY_CONTENT" >> kitty.conf

printf "\n"

echo "==============================="
echo "RESTART your kitty and enjoy   "
echo "==============================="
