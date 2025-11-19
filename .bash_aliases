if [[ -n "${BASH_ALIASES_LOADED}" ]]; then
	return
fi
export BASH_ALIASES_LOADED=1

# Constant paths
export LOCAL="${HOME}/.local"
export OPT="${HOME}/.opt"
export DOTFILES="${HOME}/dotfiles"
export SCRIPTS="${HOME}/scripts"
export SRC="${HOME}/src"

# Make directories for local install
mkdir -p "${LOCAL}" "${OPT}" "${SRC}" >/dev/null 2>&1

# Editor
if command -v nvim >/dev/null 2>&1; then
	EDITOR="nvim"
else
	EDITOR="vim"
fi
export EDITOR

# Shared library path
LD_LIBRARY_PATH="${LOCAL}/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export LD_LIBRARY_PATH

# CUDA
if [[ -d "/usr/local/cuda" ]]; then
	LD_LIBRARY_PATH="/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
	PATH="/usr/local/cuda/bin${PATH:+:${PATH}}"
fi

# PATH
PATH="${SCRIPTS}${PATH:+:${PATH}}"
PATH="${LOCAL}/bin${PATH:+:${PATH}}"
export PATH

# Timezone aliases
alias tia="TZ=America/Edmonton date"
alias tij="TZ=Japan date"
