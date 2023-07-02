Invoke-Expression (&starship init powershell)

# git aliases
function gss { git status -s } # git status short version
function gsl { git status --long } # git status long version
function gaa { git add . } # git add all
function gap { git add -p } # git add patch
function gcm { git commit -m $args } # git commit + message
function gpl { git pull } # git pull
function gps { git push } # git push
function gcl { git clone $args } # git clone + url
function gco { git checkout $args } # git checkout + branch
function glg { git lg } # git log graph (lg from .gitconfig)
function gurl {
  $repoUrl = git config --get remote.origin.url
  if(!$repoUrl) {
      Write-Output " No git URL found"
      break
  }

  # Start-Process chrome $repoUrl
  # Update (See Below) - by removing the browser,
  # Windows will use the default browser on your computer. Win! 

  Start-Process $repoUrl 

} # open git url

# other aliases
function config { code $home\dev\dotfiles-windows } # open dotfiles
function dev { Set-Location $home\dev } # go to dev folder
function .. { Set-Location ".."} # go up one folder
function ... { Set-Location "~"} # go to home folder
function ofd { explorer.exe . } # open current folder in explorer
function mdir { New-Item $args -Type Directory } # make directory
function touch { New-Item $args -Type File } # make file

