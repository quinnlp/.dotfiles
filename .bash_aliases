# Useful paths
export LOCAL="${HOME}/.local"
export OPT="${HOME}/.opt"
export DOTFILES="${HOME}/dotfiles"
export SCRIPTS="${HOME}/scripts"
export SRC="${HOME}/src"

# Make directories for local installs
mkdir -p "${LOCAL}" "${OPT}" "${SRC}"

# Compilers
if [[ -x "${LOCAL}/bin/clang" ]]; then
	export CC="${LOCAL}/bin/clang"
fi
if [[ -x "${LOCAL}/bin/clang++" ]]; then
	export CXX="${LOCAL}/bin/clang++"
fi

# Neovim
if [[ -d "${OPT}/nvim-linux-x86_64" ]]; then
	export PATH="${OPT}/nvim-linux-x86_64/bin:${PATH}"
fi

# Compiler flags
export CFLAGS="-I ${LOCAL}/include ${CFLAGS}"
export CXXFLAGS="-I ${LOCAL}/include ${CXXFLAGS}"
export LDFLAGS="-L ${LOCAL}/lib ${LDFLAGS}"

# Time aliases
alias tij="TZ=Japan date"
alias tia="TZ=America/Edmonton date"

# Private local
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${LOCAL}/bin:${PATH}"

# Private scripts
export PATH="${SCRIPTS}:${PATH}"

# CMPUT415 ANTLR4 setup
export ANTLR_INS="${INSTALLS}/antlr4-4.13.2-install"
export ANTLR_JAR="${INSTALLS}/antlr-4.13.2-complete.jar"
export CLASSPATH="${ANTLR_JAR}:${CLASSPATH}"
alias antlr4="java -Xmx500M org.antlr.v4.Tool"
alias grun="java org.antlr.v4.gui.TestRig"
