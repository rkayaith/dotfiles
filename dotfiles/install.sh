git clone --bare git@github.com:troggo/dotfiles.git $HOME/dotfiles2
function dot {
   /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $@
}
mkdir -p $HOME/dotfiles-backup
dot checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dotfiles.";
    dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/dotfiles-backup/{}
fi;
dot checkout
dot config status.showUntrackedFiles no
