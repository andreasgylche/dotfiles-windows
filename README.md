# dotfiles-windows

## installation

Copy this command into your elevated PowerShell instance and run it to download this repo and start the installation:

```ps1
Set-ExecutionPolicy RemoteSigned; `
New-Item -Path "$HOME\dev" -Type Directory; `
Invoke-WebRequest "https://github.com//andreasgylche/dotfiles-windows/archive/refs/heads/main.zip" `
-OutFile "$HOME\Downloads\dotfiles-windows.zip"; `
Get-ChildItem "$HOME\Downloads\" -Filter *.zip | Expand-Archive -DestinationPath "$HOME\dev" -Force; `
Rename-Item -NewName "dotfiles-windows" -Path "$HOME\dev\dotfiles-windows-main"; `
. "$HOME\dev\dotfiles-windows\Bootstrap.ps1"
```

## Explanation of the upper command

1. `Set-ExecutionPolicy RemoteSigned`

   Allows execution of PowerShell scripts. Is needed for further execution and installation.

2. `New-Item -Path "$HOME\dev" -Type Directory`

   Create a dev directory in the home directory for our dotfiles to be stored. The directory name can be changed, but all occurances of the directory name have to be changed in this project.

3. `Invoke-WebRequest "https://github.com/nidzov/dotfiles-windows/archive/master.zip" -OutFile "$HOME\Downloads\dotfiles-windows.zip"`

   Download the repository as a zip into the Downloads directory.

4. `Get-ChildItem "$HOME\Downloads\" -Filter *.zip | Expand-Archive -DestinationPath "$HOME\dev" -Force`

   Unzip to the dev directory.

5. `Rename-Item -NewName "dotfiles-windows" -Path "$HOME\dev\dotfiles-windows-main"`

   Rename the unzipped folder so branch name is not in the name.

6. `& "$HOME\dev\dotfiles-windows\Bootstrap.ps1"`

   Start the installation.
