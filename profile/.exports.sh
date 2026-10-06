# Claude
export AWS_REGION="us-east-2"
export CLAUDE_CODE_USE_BEDROCK=1
export ANTHROPIC_MODEL="us.anthropic.claude-opus-5-5"

# Editor
if command -v nvim >/dev/null 2>&1; then
	export EDITOR="nvim"
	export VISUAL="nvim"
elif command -v vim >/dev/null 2>&1; then
    	export EDITOR="vim"
    	export VISUAL="vim"
else
    	export EDITOR="vi"
    	export VISUAL="vi"
fi
