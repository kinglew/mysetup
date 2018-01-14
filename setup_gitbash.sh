# install bash-it (for git-bash)
#if ! [ -x "$(command -v bash-it)" ]; then
if ! [ -d "/bash_it" ]; then
    net session > /dev/null 2>&1
    if [ $? -eq 0 ];
    then echo "Installing bash-it ..."
    else echo "Need to run shell as administrator to install bash-it"; exit 1;
    fi

    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it

    # create symlink to avoid issues with spaces in user paths
    ln -s ~/.bash_it /bash_it

    /bash_it/install.sh --silent

    # make bash-it command available by refreshing shell
#    source ~/.bashrc
fi
source ~/.bashrc

bash-it enable plugin autojump aws git extract z fzf
bash-it enable alias git curl

# set theme to minimal
sed -i 's/^export BASH_IT_THEME=.*/export BASH_IT_THEME="minimal"/' ~/.bashrc
sed -i 's/^export SCM_CHECK=.*/export SCM_CHECK=true/' ~/.bashrc
sed -i 's/^export SCM_GIT_SHOW_DETAILS=.*/export SCM_GIT_SHOW_DETAILS=true/' ~/.bashrc
sed -i 's/^export SCM_GIT_IGNORE_UNTRACKED=.*/export SCM_GIT_IGNORE_UNTRACKED=true/' ~/.bashrc

# copy custom aliases
cp ./zsh/git.plugin.zsh /bash_it/aliases/custom.aliases.bash
cat .aliases >> /bash_it/aliases/custom.aliases.bash

# setup basic git configuration
echo "Verifying git configs..."
if [[ $(uname) =~ ^CYGWIN ]] || [[ $(uname) =~ ^MINGW ]];
then
  git config --global credential.helper store ;
else
  git config --global credential.helper cache ;
fi
echo "Git credential helper set"

cp ./git_global_attributes ~/.gitattributes
git config --global core.attributesfile '~/.gitattributes'
echo "Updated and set git global attributes"

cp ./git_global_ignore ~/.gitignore
git config --global core.excludesfile '~/.gitignore'
echo "Updated and set git global ignore"

if grep -Fq "bash_it_override.sh" ~/.bash_profile
then
  echo "no need to modify bash_profile for bash_it_override.sh"
else
  echo "test -f ~/.bash_it_override.sh && ~/.bash_it_override.sh" >> ~/.bash_profile
fi
cp ./bash_it_override.sh ~/.bash_it_override.sh
echo "Updated ~/.bash_it_override.sh"



#refresh bash_profile
source ~/.bash_profile
