## pre-req: babun(w/ git) and chocolatey installed. this should be executed from babun (run as administrator)
command -v choco2 >/dev/null 2>&1 || { echo >&2 "ERROR: chocolatey not installed"; exit 1; }

######################################################
# Install/Upgrade apps using Chocolatey
######################################################

echo "Installing/Upgrading applications using Chocolatey"
choco upgrade winscp -y
choco upgrade GoogleChrome -y
choco upgrade vivaldi -y
choco upgrade dropbox -y
choco upgrade 7zip -y
choco upgrade paint.net -y
choco upgrade listary -y
choco upgrade ccleaner -y
choco upgrade conemu -y
choco upgrade switcheroo -y
choco upgrade procexp -y

## dev tools
choco upgrade boxstarter -y
choco upgrade vagrant -y
choco upgrade postman -y
choco upgrade fzf -y
choco upgrade peco -y

## dev frameworks
choco upgrade nodist -y
choco upgrade python -y
choco upgrade golang -y

## dev IDEs
choco upgrade visualstudiocode -y
choco upgrade intellijidea-ultimate -y

## do bash-it setup
./setup_gitbash.sh

## do configuration setup
./post_setup.sh

