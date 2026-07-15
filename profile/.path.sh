# Neovim
if [ -d "$HOME/opt/nvim-linux-x86_64/bin" ]; then
	case ":$PATH:" in
		*":$HOME/opt/nvim-linux-x86_64/bin:"*)
			;;
		*)
			PATH="$PATH:$HOME/opt/nvim-linux-x86_64/bin"
			;;
	esac
elif [ -d /opt/nvim-linux-x86_64/bin ]; then
	case ":$PATH:" in
		*":/opt/nvim-linux-x86_64/bin:"*)
			;;
		*)
			PATH="$PATH:/opt/nvim-linux-x86_64/bin"
			;;
	esac
fi
