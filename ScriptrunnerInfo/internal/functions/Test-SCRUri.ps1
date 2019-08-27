function Test-SCRUri {
    <#
    .SYNOPSIS
    Short description
    
    .DESCRIPTION
    Long description
    
    .PARAMETER Uri
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
        $Uri
    )
    
    begin {
    }
    
    process {
        try {
            [net.httpWebRequest] $req = [net.webRequest]::create($Uri)
            $req.Method = "HEAD"
            [net.httpWebResponse] $res = $req.getResponse()
            if ($res.StatusCode -eq "200") {
                return $true
            } else {
                return $false
            }
        } catch {
            return $false
        }
    }
    
    end {
    }
}
