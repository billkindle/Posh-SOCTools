<#
    TO DO:
    - Turn this into an advanced function / add help
    - Add test for checking if properties are present
    - Add some validation tests?

#>
function Enable-PSScriptBlockLogging {
    # Registry key
    $basePath = 'HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging'

    # Create the key if it does not exist
    if(-not (Test-Path $basePath)) {

        $null = New-Item $basePath -Force

    }
    
    # Enable script block logging
    Set-ItemProperty $basePath -Name EnableScriptBlockLogging -Value "1"

}