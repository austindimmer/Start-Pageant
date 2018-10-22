# Start-Pageant
Powershell script to automatically start PuTTY Pageant on startup.

## Using

1. Copy the Start-Pageant.exe into your startup folder
2. Create a "PKI" folder in your "My Documents"
3. Place your private keys in your PKI folder

To specify another location for your private keys you can use the -keystore command line switch.

## Building

The build script relies on the [PS2EXE-GUI](https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-GUI-Convert-e7cb69d5) script by Markus Scholtes. If you have ps2exe.ps1 in your path you can build by right clicking the "Start-Pageant.BUILD.ps1" and running with Powershell.
