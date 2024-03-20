. "$HOME/.cargo/env"

# Source Jobber API Keys
if [ -e "$HOME/.zshenv.jobber" ]; then
    source "$HOME/.zshenv.jobber"
fi

export PATH=$PATH:"$HOME/.local/share/bob/nvim-bin"

export OPENAI_API_KEY="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"

export GPG_TTY=$TTY
export LESS="-F -g -i -M -R -S -w -X -z-4"

export ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS=0
export ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=0
export ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES=1

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

