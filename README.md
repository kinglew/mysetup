# mysetup
my development environment setup scripts, dotfiles, etc...

Current setup for windows using git bash shell and bash-it.

# windows setup

## pre-requisites
- install windows git which comes with git bash

## steps
1. install chocolatey
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
2. run git bash as administrator
3. execute ./dev_windows_setup.sh
4. restart shell, then execute ./setup_gitbash.sh
5. restart shell to have all bash-it plugins loading properly

# known issues

1. because of path issues with spaces, it is recommended to create symlinks from root folder. /bash_it for example points to ~/.bash_it, issue is that username in windows can contain spaces and this will crash bash_it !!
