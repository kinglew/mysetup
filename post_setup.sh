#source ~/.bashrc

if [[ $(uname) =~ ^CYGWIN ]];
then
  git config --global credential.helper store ;
else
  git config --global credential.helper cache ;
fi

######################################################
# Install npm packages
######################################################
npm install -g yo gulp karma protractor bower jshint nodemon generator-gulp-angular angular-cli react-native-cli typings

######################################################
# Update zsh aliases
######################################################
chmod +x update_zsh.sh
./update_zsh.sh
