#This script take remote desktop of PC whose hostname is passed.
#To run this script open powershell and navigate to script location folderand type following way::
#.\TakeRemote.ps1 "Hostname" "Password" "UserName"
param([String]$HostName,[String]$Password,[string]$User)
cmdkey /generic:TERMSRV/$HostName /user:$User /pass:$Password
mstsc /v:$HostName
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
