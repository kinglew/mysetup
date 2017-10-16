# install bash-it (for git-bash)
if ! [ -x "$(command -v bash-it)" ]; then
    echo "Installing bash-it ..."
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it

    ln -s ~/.bash_it /bash_it

    /bash_it/install.sh --silent

    reload
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
cat ./zsh.aliases >> /bash_it/aliases/custom.aliases.bash
