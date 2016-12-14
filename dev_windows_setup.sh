## pre-req: babun(w/ git) and chocolatey installed. this should be executed from babun (run as administrator)
command -v choco2 >/dev/null 2>&1 || { echo >&2 "ERROR: chocolatey not installed"; exit 1; }

######################################################
# Install/Upgrade apps using Chocolatey
######################################################

echo "Installing/Upgrading applications using Chocolatey"
choco upgrade winscp -y
choco upgrade GoogleChrome -y
choco upgrade fiddler4 -y
choco upgrade dropbox -y
choco upgrade kdiff3 -y
choco upgrade 7zip -y
choco upgrade paint.net -y
choco upgrade listary -y
choco upgrade ccleaner -y
choco upgrade keepass.upgrade -y
choco upgrade conemu -y
choco upgrade switcheroo -y

## dev tools
choco upgrade velocity -y
choco upgrade boxstarter -y
choco upgrade vagrant -y

## dev frameworks
choco upgrade jdk8 -y
#choco upgrade nodejs -y #use nodist/nvm instead
choco upgrade nodist -y
choco upgrade phantomjs -y
choco upgrade python -y
choco upgrade nuget.commandline -y
choco upgrade NugetPackageExplorer -y
choco upgrade golang -y

## dev IDEs
choco upgrade visualstudiocode -y
#choco upgrade webstorm -y
#choco upgrade visualstudio2015community -y
choco upgrade intellijidea-ultimate -y
