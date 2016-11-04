
## pre-req: babun(w/ git) and chocolatey installed. this should be executed from babun (run as administrator)

######################################################
# Install apps using Chocolatey
######################################################
echo "Installing applications from Chocolatey"
choco install sublimetext3 -y
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
choco install virtualbox -y

#choco install Evernote -y
choco install velocity -y

## dev tools
choco install jdk8 -y
choco install vagrant -y
choco install nuget.commandline -y
choco install NugetPackageExplorer -y
choco install brackets -y
choco install nodejs -y
choco install phantomjs -y
#choco install webpi -y
#choco install python -y
choco install webstorm -y
#choco install visualstudio2015community -y
#choco install intellijidea-community -y
choco install sourcetree -y

#install apps from webpi

#choco install WindowsInstaller31 -source webpi
#choco install WindowsInstaller45 -source webpi

######################################################
# Install npm packages
######################################################
npm install -g yo gulp karma bower jshint nodemon generator-gulp-angular

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
