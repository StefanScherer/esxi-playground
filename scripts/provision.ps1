iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y dotnet3.5
# choco install -y vmwarevsphereclient -version 5.5.0.1993072
cmd /C choco install -y vmwarevsphereclient -version 6.0.0 -source c:\vagrant\chocolatey\vmwarevsphereclient.6.0.0.nupkg -force

choco install -y vagrant
# plugin from github.com/frankus0512/vagrant-esxi branch newfeatures
vagrant plugin install c:\vagrant\plugins\vagrant-esxi-0.1.1.gem
