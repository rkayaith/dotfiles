export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# git but for dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Replace all in files
function wrg {
    if [[ $2 != '--replace' ]]
    then
        echo "wrg foo --replace bar -> rg -l foo | xargs sed -i '' 's/foo/bar/g'"
    else
        rg -l $1 | xargs sed -i '' "s/$1/$3/g"
    fi
}
