# environment specific stuff
source $HOME/.env 2>/dev/null

# zsh
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
# history opts from oh-my-zsh/history.zsh
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

set -o vi
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}"  end-of-line
bindkey "${terminfo[kdch1]}" delete-char

# plugins
ANTIGEN=/usr/share/zsh-antigen/
if [ ! -d $ANTIGEN ]; then ANTIGEN=/usr/local/share/antigen/ fi
if [ ! -d $ANTIGEN ]; then
    echo "Install antigen: https://github.com/zsh-users/antigen"
else
    source $ANTIGEN/antigen.zsh
    antigen bundle subnixr/minimal
    antigen bundle chriskempson/base16-shell
    antigen bundle zsh-users/zsh-autosuggestions
    # antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle zsh-users/zsh-history-substring-search
    antigen apply
fi

# compinstall
zstyle :compinstall filename '/home/rk/.zshrc'
autoload -Uz compinit
compinit

# MNML theme config
export MNML_INFOLN=()
export MNML_MAGICENTER=()
export MNML_USER_CHAR='‹::'
export MNML_INSERT_CHAR='$›'

# zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export EDITOR=vim

# make fzf use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# git but for dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# TODO: fix on linux
# alias ls='ls --color=auto'
alias ls='ls -G'

# Replace all in files
function wrg {
    if [[ $2 != '--replace' ]]; then
        echo "wrg foo --replace bar -> rg -l foo | xargs sed -i '' 's/foo/bar/g'"
    else
        echo "rg -l \"$1\" | xargs sed -i '' \"s/$1/$3/g\""
        rg -l $1 | xargs sed -i '' "s/$1/$3/g"
    fi
}
