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
    source ~/.bashrc
fi

bash-it enable plugin autojump aws git extract
#fasd - not compatible with windows

bash-it enable alias git curl

# set theme to minimal
sed -i 's/^BASH_IT_THEME=.*/BASH_IT_THEME="minimal"/' ~/.bashrc

# TODO disable git status on theme
#export SCM_GIT_SHOW_DETAILS=false
#export SCM_GIT_IGNORE_UNTRACKED=true

# copy custom aliases
cp ./zsh/git.plugin.zsh /bash_it/aliases/custom.aliases.bash
cat .aliases >> /bash_it/aliases/custom.aliases.bash


# refresh
reload
