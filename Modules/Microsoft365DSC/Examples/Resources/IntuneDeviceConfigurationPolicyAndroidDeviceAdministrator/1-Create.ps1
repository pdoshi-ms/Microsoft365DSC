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
        IntuneDeviceConfigurationPolicyAndroidDeviceAdministrator 'myAndroidDeviceAdmin'
        {
            DisplayName                              = 'Android device admin'
            AppsBlockClipboardSharing                = $True
            AppsBlockCopyPaste                       = $True
            AppsBlockYouTube                         = $False
            Assignments                              = @(
                MSFT_DeviceManagementConfigurationPolicyAssignments {
                    deviceAndAppManagementAssignmentFilterType = 'none'
                    dataType                                   = '#microsoft.graph.allDevicesAssignmentTarget'
                }
            )
            BluetoothBlocked                         = $True
            CameraBlocked                            = $True
            CellularBlockDataRoaming                 = $False
            CellularBlockMessaging                   = $False
            CellularBlockVoiceRoaming                = $False
            CellularBlockWiFiTethering               = $False
            CompliantAppListType                     = 'appsInListCompliant'
            CompliantAppsList                        = @(
                MSFT_MicrosoftGraphAppListitem {
                    name        = 'customApp'
                    publisher   = 'google2'
                    appStoreUrl = 'https://appUrl.com'
                    appId       = 'com.custom.google.com'
                }
            )
            DateAndTimeBlockChanges                  = $True
            DeviceSharingAllowed                     = $False
            DiagnosticDataBlockSubmission            = $False
            FactoryResetBlocked                      = $False
            GoogleAccountBlockAutoSync               = $False
            GooglePlayStoreBlocked                   = $False
            KioskModeBlockSleepButton                = $False
            KioskModeBlockVolumeButtons              = $True
            LocationServicesBlocked                  = $False
            NfcBlocked                               = $False
            PasswordBlockFingerprintUnlock           = $False
            PasswordBlockTrustAgents                 = $False
            PasswordRequired                         = $True
            PasswordRequiredType                     = 'numeric'
            PowerOffBlocked                          = $False
            RequiredPasswordComplexity               = 'low'
            ScreenCaptureBlocked                     = $False
            SecurityRequireVerifyApps                = $False
            StorageBlockGoogleBackup                 = $False
            StorageBlockRemovableStorage             = $False
            StorageRequireDeviceEncryption           = $False
            StorageRequireRemovableStorageEncryption = $True
            VoiceAssistantBlocked                    = $False
            VoiceDialingBlocked                      = $False
            WebBrowserBlockAutofill                  = $False
            WebBrowserBlocked                        = $False
            WebBrowserBlockJavaScript                = $False
            WebBrowserBlockPopups                    = $False
            WebBrowserCookieSettings                 = 'allowAlways'
            WiFiBlocked                              = $False
            Ensure                                   = 'Present'
            ApplicationId         = $ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $CertificateThumbprint;
        }
    }
}
