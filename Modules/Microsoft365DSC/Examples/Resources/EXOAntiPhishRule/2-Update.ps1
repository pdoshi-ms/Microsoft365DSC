<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param(
        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint
    )
    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        EXOAntiPhishRule 'ConfigureAntiPhishRule'
        {
            Identity                  = "Test Rule"
            Comments                  = "This is an updated comment." # Updated Property
            AntiPhishPolicy           = "Our Rule"
            Enabled                   = $True
            SentToMemberOf            = @("executives@$TenantId")
            Ensure                    = "Present"
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
        }
    }
}
