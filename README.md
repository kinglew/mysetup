# mysetup
my development environment setup scripts, configs, settings, style/formatters, ...

# windows setup

## pre-requisites
- set HOME environment variable to %USERPROFILE%
- make sure 'cmd' is always run as administrator

## steps
1. install chocolatey  
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
2. install babun via chocolatey:  
choco install babun -y
3.  set babun to run as administrator (find binary file, properties, run as administrator)  
4.  execute ./dev_windows_setup.sh  

# known issues

## visual studio code + babun git
- create symlink for "c:\cygdrive"
mklink /j "c:\cygdrive" C:\Users\{user}\.babun\cygwin\home
- if your workspace is not in your home, them remap it (example below assumes that workspace is in d: drive)
mklink /j "C:\Users\{user}\.babun\cygwin\home\d" "D:"
