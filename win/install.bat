Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


choco install  vscode.install git php nodejs.install openjdk17 androidstudio obs-studio docker-desktop zoom vlc github-desktop virtualbox vagrant 7zip -y

git config --global user.name 'nourit'
git config --global user.email 'reply.nourit@gmail.com'

pause

@REM  .\win\exe\ChromeSetup.exe