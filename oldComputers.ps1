Add-PSSnapin Quest.ActiveRoles.ADManagement
$c29= get-qadcomputer * -SizeLimit 0 


$allKaluga = @()



foreach ($comp in $c29)
{
     $klgComp = "" | Select ComputerName, ModificationDate, AccountIsDisabled
     
     if ($comp.DN.ToString().Contains("Kaluga"))
     {
        
        $klgComp.ComputerName = $comp.Name
        $klgComp.ModificationDate = $comp.ModificationDate
        $klgComp.AccountIsDisabled = $comp.AccountIsDisabled
        $allKaluga += $klgComp
     }

     
}


$newContainer = "organization/ou/Computers/Disabled"

foreach($kaluga in $allKaluga)
{

    if ($kaluga.AccountIsDisabled)
    {
            $comp = Get-QADComputer $kaluga.ComputerName

            $oldContainer = $comp.ParentContainer.ToString()

            if ($oldContainer -ne $newContainer)  # компьютер уже перемещен
            {
                
                $comp
                Read-Host
                Set-QADComputer $comp -Location $oldContainer
                Move-QADObject -Identity $comp -NewParentContainer $newContainer
                
            }
    }

}

$newContainer = "organization/ou/Computers/InActiveTooLong"

$nowdate = get-date
$daysodl = 100

$olddate = $nowdate.AddDays($daysodl*-1)

foreach($kaluga in $allKaluga)
{

    if (!$kaluga.AccountIsDisabled)
    {

        if ($kaluga.ModificationDate -lt $olddate)
        {
            $comp = Get-QADComputer $kaluga.ComputerName

            $oldContainer = $comp.ParentContainer.ToString()

            if ($oldContainer -ne $newContainer)  # компьютер уже перемещен
            {
                
                $comp
                Read-Host
                Set-QADComputer $comp -Location $oldContainer
                Move-QADObject -Identity $comp -NewParentContainer $newContainer
                
            }
        }
        else
        {
             
             $kaluga.ComputerName,$($daysodl-$($kaluga.ModificationDate-$olddate).Days)
        }
    }

}

