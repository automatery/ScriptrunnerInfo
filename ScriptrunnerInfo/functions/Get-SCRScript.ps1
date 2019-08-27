function Get-SCRScript {
    <#
    .SYNOPSIS
    Short description
    
    .DESCRIPTION
    Long description
    
    .PARAMETER URL
    Parameter description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidatePattern( "^(http|https)://" )]
        $URL
    )
    if(-not (Test-SCRUri $URL)){Write-Error "Website $URL is not availabel" -ErrorAction Stop}

    $Data = Invoke-WebRequest -Uri "$($URL):8091/Scriptrunner/ScriptItem" -UseBasicParsing -UseDefaultCredentials | Select-Object -ExpandProperty Content
    $Result =  $Data | ConvertFrom-Json | Select-Object -ExpandProperty Value

    $Result
}