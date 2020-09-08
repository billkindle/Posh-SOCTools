<#
    TO DO:
    - Turn this into an advanced function / add help
    - Add test for checking if EnableModuleLogging property is present
    - Add some validation tests?
#>
function Enable-PSModuleLogging {
    $basePath = 'HKLM:\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging'

    if(-not (Test-Path $basePath)) {

        $null = New-Item $basePath -Force

    }

    # Add some code here to allow adding individual keys / values if only wanting to log certain modules or all modules.

    Set-ItemProperty $basePath -Name "EnableModuleLogging" -Value "1"

}

# REMOVE THIS EVENTUALLY
<#
    TO DO:
    - Turn this into an advanced function / add help
    - Add test for checking if properties are present
    - Add some validation tests?
    - May need to consider renaming this function something different, or combine it
    with Enable-PSModuleLogging function
#>

Function Enable-AllModuleLogging {

    $basePath = 'HKLM:\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames'

    if (-not (Test-Path $basePath)) {
        
        $null = New-Item $basePath -Force
    
    }

    # Need to fix this up to create the key fisrt, then assign value (use New-ItemProperty -PropertyType)
    Set-ItemProperty $basePath -Name "*" -Value "*"

}