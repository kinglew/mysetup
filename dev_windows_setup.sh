## pre-req: babun(w/ git) and chocolatey installed. this should be executed from babun (run as administrator)

######################################################
# Install apps using Chocolatey
######################################################
echo "Installing applications using Chocolatey"
choco install winscp -y
choco install GoogleChrome -y
choco install fiddler4 -y
choco install dropbox -y
choco install kdiff3 -y
choco install 7zip -y
choco install paint.net -y
choco install listary -y
choco install ccleaner -y
choco install keepass.install -y
choco install Evernote -y

## dev tools
choco install velocity -y
choco install boot2docker -y
choco install boxstarter -y
choco install vagrant -y
choco install sourcetree -y

## dev frameworks
choco install jdk8 -y
choco install nodejs -y
choco install phantomjs -y
choco install python -y
choco install webstorm -y
#choco install visualstudio2015community -y
choco install intellijidea-ultimate -y

######################################################
# Install npm packages
######################################################
npm install -g yo gulp karma protractor bower jshint nodemon generator-gulp-angular angular-cli react-native-cli typings

######################################################
# Generate public/private rsa key pair
######################################################
#TODO fix error on line 156
#Write-Host "Generating public/private rsa key pair"
#Set-Location $home
#$dirssh = "$home\.ssh"
#mkdir $dirssh
#$filersa = $dirssh + "\id_rsa"
#ssh-keygen -t rsa -f $filersa -q -C $userEmail
#Write-Host

chmod +x update_zsh.sh
./update_zsh.sh
