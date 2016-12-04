#source ~/.bashrc
#shell needs to be reloaded before executing this

echo "Verifying git configs..."
if [[ $(uname) =~ ^CYGWIN ]];
then
  git config --global credential.helper store ;
else
  git config --global credential.helper cache ;
fi

######################################################
# Install/Update npm packages
######################################################
echo "Installing/Updating npm packages..."
npm update -g yo gulp karma protractor jshint nodemon generator-gulp-angular angular-cli react-native-cli typings

######################################################
# Update zsh aliases
######################################################
echo "Update zsh configs/aliases..."
chmod +x update_zsh.sh
./update_zsh.sh
