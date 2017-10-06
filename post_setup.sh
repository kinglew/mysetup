#source ~/.bashrc
#shell needs to be reloaded before executing this

echo "Verifying git configs..."
if [[ $(uname) =~ ^CYGWIN ]];
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

######################################################
# Install/Update npm packages
######################################################
echo "Installing/Updating npm packages..."
npm update -g yo gulp karma protractor eslint nodemon yarn react-native-cli typings

######################################################
# Update zsh aliases
######################################################
#echo "Update zsh configs/aliases..."
#chmod +x update_zsh.sh
#./update_zsh.sh