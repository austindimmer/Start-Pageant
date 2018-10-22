<#
.SYNOPSIS
    Runs pageant and automatically loads private keys

.DESCRIPTION
    Runs pageant and automatically loads private keys from the path specified
    in the 'keystore' option. The 'keystore' option defaults to the users
    Documents\pki folder.

.PARAMETER keystore
    The location of the keystore to load into pageant at runtime.

.NOTES
    Author: Shannon Brooks <brooks@rescar.com>
    Requires: PuTTY (pageant) in path, Powershell 3.0+

#>

[CmdletBinding()]
Param(

    [ValidateScript({Test-Path $_ -PathType Container})]
    [string]
    $keystore = "$([environment]::GetFolderPath('mydocuments'))\pki"

)

$keystore = [System.IO.Path]::GetFullPath($keystore)

$keys = Get-ChildItem -Path $keystore -Filter *.ppk

$puttygen_arguments = ''

$keys | ForEach-Object {

    $puttygen_arguments += " ""$($_.FullName)"""

}

Start-Process pageant.exe -ArgumentList $puttygen_arguments