# Step1 ==============
# Install choco package manager
# https://chocolatey.org/install
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Set choco env
echo '
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}' >> $PROFILE

# Step2 ==============
# Reopen your powerShell as administrator
# If you can't fine 

# Install windows terminal
choco install microsoft-windows-terminal -y

# Install starship prompt
# https://starship.rs/
choco install starship -y

# Enable startship
echo '
Invoke-Expression (&starship init powershell)' >> $PROFILE

# Apply startship configuration
mkdir -p ~/.starship
cp starship.toml ~/.starship/config.toml
echo '$ENV:STARSHIP_CONFIG = "$HOME\.starship\config.toml"' >> $PROFILE
