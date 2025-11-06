[ -n "${BASH_ALIASES_LOADED}" ] && return
export BASH_ALIASES_LOADED=1

# Prepend a path to PATH if not already present.
# Usage: prepend_path "/some/path"
prepend_path() {
	local dir="${1%/}"  # remove trailing slash
	case ":${PATH}:" in
		*":${dir}:"*)
			# do nothing
			;;
		*)
			PATH="${dir}:${PATH}"
			;;
	esac
}

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

# Shared library path
export LD_LIBRARY_PATH="${HOME}/.local/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

# Editor
if command -v nvim >/dev/null 2>&1; then
	EDITOR="nvim"
else
	EDITOR="vim"
fi
export EDITOR

# Update PATH
prepend_path "${SCRIPTS}"
prepend_path "${LOCAL}/bin"
export PATH

# Timezone aliases
alias tia="TZ=America/Edmonton date"
alias tij="TZ=Japan date"
