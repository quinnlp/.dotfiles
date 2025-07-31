# Useful paths
export DOTFILES="${HOME}/dotfiles"
export INSTALLS="${HOME}/installs"
export LOCAL="${HOME}/local"
export OPT="${HOME}/opt"
export SCRIPTS="${HOME}/scripts"
export SOURCES="${HOME}/sources"

# Make directories for local installs
mkdir -p "${INSTALLS}" "${LOCAL}" "${OPT}" "${SOURCES}"

# Compilers
export CC="${LOCAL}/bin/clang"
export CXX="${LOCAL}/bin/clang++"

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
