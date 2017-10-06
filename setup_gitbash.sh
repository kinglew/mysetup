# install bash-it (for git-bash)
echo "Installing bash-it ..."
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --silent

reload

bash-it enable plugin fasd go autojump aws git extract

bash-it enable alias git curl

# git optimizations
git config --global core.preloadindex true
git config --global core.fscache true
git config --global gc.auto 256
