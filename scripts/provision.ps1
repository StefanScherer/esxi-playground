iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y dotnet3.5
choco install -y vmwarevsphereclient -version 5.5.0.1993072
# choco install -y vmwarevsphereclient -version 6.0.0 -source c:\vagrant\scripts\vmwarevsphereclient.6.0.0.nupkg
