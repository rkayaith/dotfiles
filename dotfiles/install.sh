# To install run:
# $ curl -Lks https://raw.githubusercontent.com/troggo/dotfiles/master/dotfiles/install.sh | /bin/bash

function dot {
   /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $@
}

cd $HOME
git clone --bare git@github.com:troggo/dotfiles.git $HOME/dotfiles
dot checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles."
  else
    echo "Backing up pre-existing dotfiles."
    mkdir -p $HOME/dotfiles-backup
    dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/dotfiles-backup/{}
fi;
dot checkout
dot config status.showUntrackedFiles no
echo "Done."
