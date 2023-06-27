Invoke-Expression (&starship init powershell)

Set-Alias g git

function tconfig { code "C:\Users\Andreas\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" }
function sc { Set-Location "C:\Users\Andreas\Documents\SkanCode"}
function .. { Set-Location ".."}
function ... { Set-Location "~"}
function gs { git status }
function gcm { git commit -m $args }
function ofd { explorer.exe . }
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

}
function mdir { New-Item $args -Type Directory }
function touch { New-Item $args -Type File }
