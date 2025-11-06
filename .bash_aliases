[ -n "${BASH_ALIASES_LOADED}" ] && return
export BASH_ALIASES_LOADED=1

# Useful paths
export DOTFILES="${HOME}/dotfiles"
export SCRIPTS="${HOME}/scripts"

# Local install paths
export LOCAL="${HOME}/.local"
export OPT="${HOME}/.opt"
export SRC="${HOME}/src"

# Make directories for local install
mkdir -p "${LOCAL}" "${OPT}" "${SRC}" >/dev/null 2>&1

# Compiler flags
export CFLAGS="${CFLAGS:+${CFLAGS} }-I${LOCAL}/include"
export CXXFLAGS="${CXXFLAGS:+${CXXFLAGS} }-I${LOCAL}/include"
export LDFLAGS="${LDFLAGS:+${LDFLAGS} }-L${LOCAL}/lib"

# Clang
[ -x "${LOCAL}/bin/clang" ]   && export CC="${LOCAL}/bin/clang"
[ -x "${LOCAL}/bin/clang++" ] && export CXX="${LOCAL}/bin/clang++"

# CUDA
if [[ -d "/usr/local/cuda" ]]; then
	PATH="/usr/local/cuda/bin${PATH:+:${PATH}}"
	LD_LIBRARY_PATH="/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
fi

# Shared library path
LD_LIBRARY_PATH="${HOME}/.local/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export LD_LIBRARY_PATH

# Editor
if command -v nvim >/dev/null 2>&1; then
	EDITOR="nvim"
else
	EDITOR="vim"
fi
export EDITOR

# Update PATH
PATH="${SCRIPTS}${PATH:+:${PATH}}"
PATH="${LOCAL}/bin${PATH:+:${PATH}}"
export PATH

# Timezone aliases
alias tia="TZ=America/Edmonton date"
alias tij="TZ=Japan date"
