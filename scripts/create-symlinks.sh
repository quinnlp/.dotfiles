#!/usr/bin/env bash

if [[ ! -d $DOTFILES ]]; then
	echo "Error: DOTFILES='$DOTFILES'"
	exit 1
fi

DOTFILES_PATH="$(realpath "$DOTFILES")"

symlink() {
	RELATIVE_PATH="$1"

	TARGET_PATH="$DOTFILES_PATH/$RELATIVE_PATH"
	SYMLINK_PATH="$HOME/$RELATIVE_PATH"

	echo "Creating $RELATIVE_PATH symlink"

	if [[ ! -e "$TARGET_PATH" ]]; then
		echo "Error: $TARGET_PATH does not exist"
	elif [[ -L "$SYMLINK_PATH" ]]; then
		symlink_target="$(readlink "$SYMLINK_PATH")"
		if [[ "$symlink_target" = "$TARGET_PATH" ]]; then
			echo "'$SYMLINK_PATH' -> '$TARGET_PATH'"
		else
			echo "Error: $SYMLINK_PATH exists and is a symlink for $symlink_target"
		fi
	elif [[ -e "$SYMLINK_PATH" ]]; then
		echo "Error: $SYMLINK_PATH exists and is not a symlink"
	else
		ln -sv "$TARGET_PATH" "$SYMLINK_PATH"
	fi
}

symlink ".bash_aliases"
symlink ".config/nvim"
symlink ".gitconfig"
symlink ".tmux.conf"
symlink "scripts"
