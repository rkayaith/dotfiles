# zsh
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
bindkey -v

# compinstall
zstyle :compinstall filename '/home/rk/.zshrc'
autoload -Uz compinit
compinit

# plugins
ANTIGEN=/usr/share/zsh-antigen/
if [ ! -d $ANTIGEN ]; then
    echo "Install antigen: https://github.com/zsh-users/antigen"
else
    source $ANTIGEN/antigen.zsh
    antigen theme subnixr/minimal minimal
    antigen bundle chriskempson/base16-shell
    antigen bundle zsh-users/zsh-autosuggestions
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle zsh-users/zsh-history-substring-search
    antigen apply
fi

# MNML theme config
export MNML_INFOLN=()
export MNML_MAGICENTER=()
export MNML_USER_CHAR='‹::'
export MNML_INSERT_CHAR='$›'

# history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# make fzf use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# git but for dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

alias ls='ls --color=auto'

# Replace all in files
function wrg {
    if [[ $2 != '--replace' ]]
    then
        echo "wrg foo --replace bar -> rg -l foo | xargs sed -i '' 's/foo/bar/g'"
    else
        rg -l $1 | xargs sed -i '' "s/$1/$3/g"
    fi
}
