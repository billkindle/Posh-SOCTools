function Enable-PSTranscriptionLogging {

<#
    TO DO:
    - Turn this into an advanced function / add help
    - Add test for checking if properties are present
    - Add some validation tests?
    - Requires Administrative rights - add a check for that. 
#>

    [CmdletBinding()]
    param (
        [string[]]$Path
    ) # End param
    
    begin {
        
        # Registry path
        $basePath = 'HKLM:\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\PowerShell\Transcriptions'

        # Create the key if it does not exist
        if(-not (Test-Path $basePath)) {
            $null = New-Item $basePath -Force

            # Enable the correct properties, be sure to change the output directory path before running function!
            New-ItemProperty $basePath -Name "EnableInvocationHeader" -PropertyType Dword
            New-ItemProperty $basePath -Name "EnableTranscripting" -PropertyType Dword
            New-ItemProperty $basePath -Name "OutputDirectory" -PropertyType String

        }

    } # End begin
    
    process {

        Set-ItemProperty $basePath -Name "EnableInvocationHeader" -Value "1"
        Set-ItemProperty $basePath -Name "EnableTranscripting" -Value "1"
        # This needs to be setup as a variable, maybe test / create path too?
        Set-ItemProperty $basePath -Name "OutputDirectory" -Value "$Path"
        
    } # End process
    
    end {
        
    } # End end

} # End fucntion