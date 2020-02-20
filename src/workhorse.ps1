function Get-PrefferedBand {
    Get-NetAdapterAdvancedProperty | Where-Object -Property RegistryKeyword -EQ "RoamingPreferredBandType" | Select-Object -Property RegistryValue
}

if ((Get-PrefferedBand).length -ge 0) {

    echo "Something went wrong here - Please contact your administrator"
} 
else {
    Set-NetAdapterAdvancedProperty -RegistryKeyword "RoamingPreferredBandType" -RegistryValue "2"
    echo "Everything done - exiting"
}
