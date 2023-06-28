######################
## PowerShell setup ##
######################

# Set execution policy to remote signed
Set-ExecutionPolicy RemoteSigned

# Set network category to private
Set-NetConnectionProfile -NetworkCategory Private

# PowerShell Symbolic Link
New-Item -Force -ItemType SymbolicLink "$HOME\Documents\" -Name "WindowsPowerShell" -Value "$HOME\dev\dotfiles-windows\WindowsPowerShell"

########################
## Install Chocolatey ##
########################

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

########################
## Install software ##
########################

choco install git -y
choco install vscode -y
choco install powertoys -y
choco install starship -y
choco install nodejs -y
choco install yarn -y
choco install pnpm -y

################################
## Install VS Code Extensions ##
################################
$installation_block = { 
    $extensions =
    'github.copilot',
    'rid9.datetime',
    'eamodio.gitlens',
    'ms-vscode.powershell',
    'pmndrs.pmndrs',
    'pkief.material-icon-theme',
    'ritwickdey.LiveServer',
    'yzhang.markdown-all-in-one',
    'sidneys1.gitconfig',
    'esbenp.prettier-vscode',
    'VisualStudioExptTeam.vscodeintellicode',
    'prisma.prisma',
    'bradlc.vscode-tailwindcss',
    'gruntfuggly.todo-tree'

    for ($i = 0; $i -lt $extensions.Count; $i++) {
        code --install-extension $extensions[$i]
    } 
}

# # Invoke new poweshell instance so code is in path
# Start-Process powershell -ArgumentList "-command $installation_block"

###########################
## Create symbolik links ##
###########################

# .gitconfig
New-Item -Force -ItemType SymbolicLink $HOME\ -Name .gitconfig -Value $HOME\dev\dotfiles-windows\git\.gitconfig

# Starship config
New-Item -Force -ItemType SymbolicLink $HOME\.config\ -Name starship.toml -Value $HOME\dev\dotfiles-windows\Starship\starship.toml

# Clone this repository bare
git clone --bare git@github.com:ndz-v/dotfiles-windows.git .git
