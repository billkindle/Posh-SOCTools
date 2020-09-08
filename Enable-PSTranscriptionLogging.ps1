<#
    TO DO:
    - Turn this into an advanced function / add help
    - Add test for checking if properties are present
    - Add some validation tests?

#>
function Enable-PSTranscriptionLogging {
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

     Set-ItemProperty $basePath -Name "EnableInvocationHeader" -Value "1"
     Set-ItemProperty $basePath -Name "EnableTranscripting" -Value "1"
     # This needs to be setup as a variable
     Set-ItemProperty $basePath -Name "OutputDirectory" -Value "[YOUR PATH]"

}