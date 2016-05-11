

Configuration Package {
<#
.Notes 
    Package configuration uses a DSC resouce that functions as a chocoaltey installer, with compliance aspects.
    DSC resource uses Uninstall Keys, Services, and Path tests to determine if an app is present, along with Choco log for determining if previously installed. 
    The set of this potentially needs to be scheduled. Set could potentially create a scheduled task for a specific time. 
    This would remove the configuration of the packages out of DSC - and potentially could run under a separete user (Altearnativley you could run the config under it, but that would involve duplicating the scheduled tasks system. 

    
#>
    Param(
        $PackageName,
        $Version,
        $OtherParams,
        $Schedule
    )


    # Commented out as it does not exist yet.
    #  ChocoPackage $PackageName+$Version {
    #  
    #      PackageName = $PackageName
    #      Version = $Version
    #      OtherParams = $OtherParams
    #      <#
    #          More Params
    #      #>
    #  
    #  
    #  }


    File $PackageName {
        DestinationPath = $PackageName
    }

}


function New-SystemPackage {

<#
.Notes
    Function is a wrapper for the configuration. Will eventually take pipeline input and trap / logging functionality.
  - Potentially, when a nodes configuration is build with packages, a check-in to an external system is needed to check for scheduling aspects. 
 |  When can this be applied? can it be done out of hours, or at user specified windows. 
  - > This might be better higher up, at Get-SystemPackages    
     



#>

    param(
        $PackageName,
        $Version,
        $OtherParams,
        $Schedule

    )


    Package -PackageName $PackageName -Version $Version -OtherParams $OtherParams



}



function Get-SystemPackages {
<#
.Notes
    This function is used to build the nodes pacakges, obtaining package manifests from PackageManager DB, using the MachineDB category, or potentially Systems Compliance Context.
    
    using the New-SystemPackage functions 



#>

    [cmdletbinding()]
    param(
        
        [String]$ComputerName,
        [String]$MachineDBCategory,
        [String]$Site
    )


    Begin {
    
        # This step would potentially load information from PackageManager DB.
        # PackageManager DB would dictate what Choco Package, and search criteria the compliance check needs.
        # Using MachineDB, we can create batches of packages to categories. 


    }

    Process {


        # In practice, this enumeration would be over a package manifest. With the PSItem being the individual package details, obtained from a package store.
        # Potentially converted from a JSON object, recieved by an interface from the store.
        1..10 | % { 

            # Look at using pipeline input for new-systempackage cmdlet
            New-SystemPackage -PackageName "C:\temp$_"

            # Desired
            # $Package = $_
            # # Log($Package)
            # $Package |  New-SystemPackage
        }


    }

    End {




      
    }





}


Configuration FinalConfig {


    Get-SystemPackages
}

## FinalConfig has 10 instance of Package.
FinalConfig