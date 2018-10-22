$ScriptPath = $MyInvocation.MyCommand.Name -replace '\.BUILD.ps1', '.ps1'

if ( $ScriptPath -eq $MyInvocation.MyCommand.Name ) {

    Write-Host "`nTo use: Rename this file to [scriptname].BUILD.PS1 and place in the directory with the script.`nOptionall include a [scriptname].ico file in the directory." -ForegroundColor Yellow
    return
}

$InputFile     = Get-Item -Path $ScriptPath -ErrorAction Stop
$OutputFile    = $InputFile.FullName.Replace('.ps1', '.exe')
$IconFile      = $InputFile.FullName.Replace('.ps1', '.ico')
$Description   = Get-Content -Raw -Path $InputFile.FullName.Replace('.ps1', '.txt') -ErrorAction SilentlyContinue

$IconSplat     = (@{}, @{ iconFile = $IconFile })[(Test-Path $IconFile)]

Remove-Item -Path $OutputFile -ErrorAction SilentlyContinue

$BuildSplat = @{
    inputFile    = $InputFile
    outputFile   = $OutputFile
    runtime40    = $true
    x86          = $true
    noConsole    = $true
    title        = $InputFile.BaseName
    description  = $Description
    copyright    = 'Shannon Brooks (c) ' + ( Get-Date -Format yyyy )
    version      = ( Get-Date -Format 'yyyy.MM.dd.HHmm' )
}

ps2exe.ps1 @BuildSplat @IconSplat

Remove-Item "$OutputFile.config"