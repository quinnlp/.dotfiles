#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH="$(realpath "${DOTFILES:?DOTFILES not set}")"

if ! [[ -d "${DOTFILES_PATH}" ]]; then
	printf "Error: ${DOTFILES_PATH} is not a directory\n"
	exit 1
fi

symlink() {
	local relative_path="$1"
	local target_path="${DOTFILES_PATH}/${relative_path}"
	local symlink_path="${HOME}/${relative_path}"

	printf "Creating ${relative_path} symlink\n"

	if ! [[ -e "${target_path}" ]]; then
		printf "Error: ${target_path} does not exist\n"
		return 1
	elif [[ -L "${symlink_path}" ]]; then
		symlink_target="$(readlink "${symlink_path}")"
		if [[ "${symlink_target}" = "${target_path}" ]]; then
			printf "'${symlink_path}' -> '${target_path}'\n"
		else
			printf "Error: ${symlink_path} exists and is a symlink for ${symlink_target}\n"
			return 1
		fi
	elif [[ -e "${symlink_path}" ]]; then
		printf "Error: ${symlink_path} exists and is not a symlink\n"
		return 1
	else
		mkdir -p "$(dirname "${symlink_path}")"
		ln -sv -- "${target_path}" "${symlink_path}"
	fi
}

SYMLINKS=(
	".config/git/ignore"
	".config/nvim"
	".local/lib/tmux-setup.sh"
	"scripts"
	".bash_aliases"
	".gitconfig"
	".tmux.conf"
)

for path in "${SYMLINKS[@]}"; do
	symlink "${path}"
done
