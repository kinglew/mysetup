#!/bin/bash
# Use > 1 to consume two arguments per pass in the loop (e.g. each
# argument has a corresponding value to go with it).
# Use > 0 to consume one or more arguments per pass in the loop (e.g.
# some arguments don't have a corresponding value to go with it such
# as in the --default example).
# note: if this is set to > 0 the /etc/hosts part is not recognized ( may be a bug )

if [[ -z "$WORK_DIR" ]];
then
  work_directory="/cygdrive/d"
  echo -n "Enter path to work directory below: (default: /cygdrive/d)"
  read work
  if [[ -z "$work" ]];
  then
    echo "using default: $work_directory"
  else
    echo "a $work"
    work_directory=$work
  fi
  (grep -q '^export WORK_DIR=' ~/.bash_profile && sed -i 's/^export WORK_DIR=.*/export WORK_DIR=__TOKEN__/' ~/.bash_profile && sed -i "s@__TOKEN__@$work_directory@" ~/.bash_profile) || echo "export WORK_DIR=$work_directory" >> ~/.bash_profile
  source ~/.bash_profile
fi

HOME_DIR=$WORK_DIR
echo "work directory set to $HOME_DIR"

(grep -q '^alias work' ~/.zshrc && sed -i 's/^alias.work=.*/alias work="cd __HOME_DIR__"/' ~/.zshrc && sed -i "s@__HOME_DIR__@$HOME_DIR@" ~/.zshrc) || echo "alias work=\"cd $HOME_DIR\"" >> ~/.zshrc

#modify zsh plugins
sed -i 's/^plugins=.*/plugins=(git z jump sublime)/' ~/.zshrc

#update aliases
cp zsh.aliases ~/.oh-my-zsh/zsh.aliases
source ~/.oh-my-zsh/zsh.aliases

#make sure aliases are reloaded at startup
grep -q '^source.$ZSH.*aliases' ~/.zshrc || echo 'source $ZSH/zsh.aliases' >> ~/.zshrc
grep -q '^source ~/.bash_profile' ~/.zshrc || echo 'source ~/.bash_profile' >> ~/.zshrc

echo "updated and reloaded zsh.aliases"
