<<<<<<< HEAD

=======
>>>>>>> a9b22fbcc62c6de38e815457e989a4c92fdd824c
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

## dev tools
choco install velocity -y
choco install boxstarter -y
choco install vagrant -y

## dev frameworks
choco install jdk8 -y
#choco install nodejs -y #use nodist/nvm instead
choco install nodist -y
choco install phantomjs -y
choco install python -y
choco install nuget.commandline -y
choco install NugetPackageExplorer -y

## dev IDEs
choco install atom -y
choco install webstorm -y
#choco install visualstudio2015community -y
choco install intellijidea-ultimate -y
