# Useful paths
export DOTFILES="$HOME/dotfiles"
export INSTALLS="$HOME/installs"
export LOCAL="$HOME/local"
export OPT="$HOME/opt"
export SOURCES="$HOME/sources"
export SCRIPTS="$HOME/scripts"

# Make directories for local installs
mkdir -p "$INSTALLS" "$LOCAL" "$OPT" "$SOURCES"

# Compilers
export CC="$LOCAL/bin/clang"
export CXX="$LOCAL/bin/clang++"

# Compilation environment variables
export CFLAGS="-I$LOCAL/include $CFLAGS"
export LDFLAGS="-L$LOCAL/lib $LDFLAGS"

# Journal command
JOURNAL="$HOME/journal"
editjournal () {
	JOURNAL_URL="git@github.com:quinnlp/journal.git"

	# Clone the journal github repo if the local journal dir does not exist
	if [[ ! -d "$JOURNAL" ]]; then
		git clone "$JOURNAL_URL" -q || { echo "Error: failed to clone $JOURNAL_URL"; exit 1; }
	fi

	cd "$JOURNAL"

	# Ensure the local journal dir is a git repo
	if [[ ! -d "$JOURNAL/.git" ]]; then
		echo "Error: $JOURNAL is not a git repo"
		exit 1
	fi

	# Ensure the remote origin url of the local journal dir matches the journal github repo URL
	ORIGIN="$(git remote get-url origin 2> /dev/null)"
	if [[ "$ORIGIN" != "$JOURNAL_URL" ]]; then
		echo "Error: $JOURNAL has origin $ORIGIN instead of $JOURNAL_URL"
		exit 1
	fi

	git pull origin main -q || { echo "Error: failed to pull from $JOURNAL_URL"; exit 1; }

	nvim "$JOURNAL"

	git add -A > /dev/null 2>&1 || { echo "Error: failed to add changes in $JOURNAL"; exit 1; }
	git commit -m "$(date)" > /dev/null 2>&1 # do not error here to allow for no changes
	git push origin main -q || { echo "Error: failed to push to $JOURNAL_URL"; exit 1; }
	git status -s || { echo "Error: failed to get the status of $JOURNAL"; exit 1; }

	cd "$OLDPWD"
}
alias ej=editjournal

# Time aliases
alias tij="TZ=Japan date"
alias tia="TZ=America/Edmonton date"

# Private /usr/local
export PATH="$HOME/local/bin:$PATH"

# CMPUT415 ANTLR4 setup
export ANTLR_INS="$INSTALLS/antlr4-4.13.2-install"
export ANTLR_JAR="$INSTALLS/antlr-4.13.2-complete.jar"
export CLASSPATH="$ANTLR_JAR:$CLASSPATH"
alias antlr4="java -Xmx500M org.antlr.v4.Tool"
alias grun="java org.antlr.v4.gui.TestRig"
