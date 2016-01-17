function Add-Path() {
    [Cmdletbinding()]
    param([parameter(Mandatory=$True,ValueFromPipeline=$True,Position=0)][String[]]$AddedFolder)
    # Get the current search path from the environment keys in the registry.
    $OldPath=(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
    # See if a new folder has been supplied.
    if (!$AddedFolder) {
        Return 'No Folder Supplied. $ENV:PATH Unchanged'
    }
    # See if the new folder exists on the file system.
    if (!(TEST-PATH $AddedFolder))
    { Return 'Folder Does not Exist, Cannot be added to $ENV:PATH' }cd
    # See if the new Folder is already in the path.
    if ($ENV:PATH | Select-String -SimpleMatch $AddedFolder)
    { Return 'Folder already within $ENV:PATH' }
    # Set the New Path
    $NewPath=$OldPath+’;’+$AddedFolder
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $newPath
    # Show our results back to the world
    Return $NewPath
}

######################################################
# Install apps using Chocolatey
######################################################
Write-Host "Installing Chocolatey"
iex ((new-object net.webclient).DownloadString('http://bit.ly/psChocInstall'))
Write-Host

Write-Host "Installing applications from Chocolatey"
cinst sublimetext3 -y
cinst winscp -y
cinst GoogleChrome -y
cinst fiddler4 -y
cinst dropbox -y
cinst kdiff3 -y
cinst 7zip -y
cinst paint.net -y
cinst listary
cinst ccleaner
cinst keepass.install -y
cinst virtualbox -y

cinst Evernote -y
cinst velocity -y

Write-Host

######################################################
# Set environment variables
######################################################
Write-Host "Setting home variable"
[Environment]::SetEnvironmentVariable("HOME", $HOME, "User")
[Environment]::SetEnvironmentVariable("CHROME_BIN", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe", "User")
[Environment]::SetEnvironmentVariable("PHANTOMJS_BIN", "C:\tools\PhanomJS\phantomjs.exe", "User")
Write-Host

######################################################
# Download custom .bashrc file
######################################################
#TODO configure babun instead
#Write-Host "Creating .bashrc file for use with Git Bash"
#$filePath = $HOME + "\.bashrc"
#New-Item $filePath -type file -value ((new-object net.webclient).DownloadString('http://bit.ly/winbashrc'))
#Write-Host

######################################################
# Install Windows installer through WebPI
######################################################
Write-Host "Installing apps from WebPI"
cinst WindowsInstaller31 -source webpi
cinst WindowsInstaller45 -source webpi
Write-Host

######################################################
# DEVELOPMENT ONLY TOOLS
######################################################
Write-Host
do {
    $createSiteData = Read-Host "Do you want to install pure development tools? (Y/N)"
} while ($createSiteData -ne "Y" -and $createSiteData -ne "N")
if ($createSiteData -eq "Y") {
    cinst git -y
    cinst jdk8 -y
    cinst vagrant -y
    cinst NugetPackageExplorer -y
    cinst brackets -y
    cinst nodejs -y
    cinst phantomjs -y
    cinst webpi -y
    cinst python -y
    cinst babun -y
    cinst webstorm -y
    cinst visualstudio2015community -y
    cinst intellijidea-community -y
    cinst sourcetree -y
}
Write-Host

######################################################
# GAME CLIENTS
######################################################
Write-Host
do {
    $createSiteData = Read-Host "Do you want to install game clients? (Y/N)"
} while ($createSiteData -ne "Y" -and $createSiteData -ne "N")
if ($createSiteData -eq "Y") {
    cinst battle.net
    cinst steam
    cinst goggalaxy
}
Write-Host

######################################################
# Add Git to the path
######################################################
Write-Host "Adding Git\bin to the path"
Add-Path "C:\Program Files\Git\bin"
Write-Host

######################################################
# Configure Git globals
######################################################
Write-Host "Configuring Git globals"
$userName = Read-Host 'King Lew'
$userEmail = Read-Host 'king.lew@outlook.com'

& 'C:\Program Files\Git\bin\git' config --global user.email $userEmail
& 'C:\Program Files\Git\bin\git' config --global user.name $userName

#TODO
#$gitConfig = $home + "\.gitconfig"
#Add-Content $gitConfig ((new-object net.webclient).DownloadString('http://bit.ly/mygitconfig'))

#$gitexcludes = $home + "\.gitexcludes"
#Add-Content $gitexcludes ((new-object net.webclient).DownloadString('http://bit.ly/gitexcludes'))
Write-Host

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

######################################################
# Install npm packages
######################################################
Write-Host "Install NPM packages"
npm install -g yo gulp karma bower jshint nodemon generator-gulp-angular
Write-Host

######################################################
# Generate public/private rsa key pair
######################################################
Write-Host "Generating public/private rsa key pair"
Set-Location $home
$dirssh = "$home\.ssh"
mkdir $dirssh
$filersa = $dirssh + "\id_rsa"
ssh-keygen -t rsa -f $filersa -q -C $userEmail
Write-Host
