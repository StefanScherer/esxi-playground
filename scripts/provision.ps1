schtasks /End /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE

iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -dv -y dotnet3.5
# choco install -y vmwarevsphereclient -version 5.5.0.1993072
choco install -dv -y vmwarevsphereclient -version 6.0.0 -source c:\vagrant\chocolatey

choco install -dv -y vagrant

# plugin from github.com/frankus0512/vagrant-esxi branch newfeatures
$env:Path = $env:Path + ";C:\HashiCorp\Vagrant\bin"
vagrant plugin install c:\vagrant\plugins\vagrant-esxi-0.1.1.gem

# Download vagrant SSH key to login to ESXi server
If (! (Test-Path "C:\Users\vagrant\.ssh")) {
  New-Item -Path "C:\Users\vagrant\.ssh" -ItemType Directory
}
(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub', 'C:\Users\vagrant\.ssh\id_rsa.pub')
(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant', 'C:\Users\vagrant\.ssh\id_rsa')
