

Configuration Package {

    Param(
        $PackageName,
        $Version,
        $OtherParams
    )

    #  GrChocoPackage $PackageName+$Version {
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

    param(
        $PackageName,
        $Version,
        $OtherParams

    )


    Package -PackageName $PackageName -Version $Version -OtherParams $OtherParams



}



function Get-SystemPackages {


    [cmdletbinding()]
    param(
        
        [String]$ComputerName,
        [String]$MachineDBCategory,
        [String]$Site
    )


    Begin {
    
        


    }

    Process {

        1..10 | % { 


            New-SystemPackage -PackageName "C:\temp$_"
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