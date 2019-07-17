start-transcript c:\admindir\ps-scripts\add-cmp.log

$groups = @("SGG-29-GPO-DESKTOPS","SGG-29-GPO-INVENTORY-COMPUTERS","SGG-29-GPO-STD-COMPUTERS")
$szinsdgrp        = "SGG-29-RES-SZINSD-COMPUTERS"

$controlpu_01  = @()
$controlpu_02  = @()
$controlpu_03  = @()
$controlpu_04  = @()
$controlpu_05  = @()

$szinsd_comp  = @("D29SAG01")

$computers = $controlpu_01 +$controlpu_02 +$controlpu_03 +$controlpu_04+$controlpu_05 + $szinsd_comp

#write-host $computers

foreach ($comp in $computers){
              write-host $comp
              $oComp = get-QADComputer $comp
              
               $cn = $oComp.CanonicalName
              write-host $cn
               if ($cn.Length -gt 0){
		foreach($group in $groups){
                	                write-host $("Add-QADGroupMember $group $cn")
	 		Add-QADGroupMember $group $cn

		}
                }
                
}

foreach ($comp in $controlpu_01){
              $oComp = get-QADComputer $comp
               $cn = $oComp.CanonicalName
               if ($cn.Length -gt 0){
                          write-host $("Add-QADGroupMember SGG-29-RES-CONTROLPU1 $cn")

                          Add-QADGroupMember "SGG-29-RES-CONTROLPU-INSTALL" $cn
                          Add-QADGroupMember "SGG-29-RES-CONTROLPU1" $cn
              }

}

foreach ($comp in $controlpu_02){
	
              $oComp = get-QADComputer $comp
               $cn = $oComp.CanonicalName
               if ($cn.Length -gt 0){
                     write-host $("Add-QADGroupMember SGG-29-RES-CONTROLPU2 $cn")

                    Add-QADGroupMember "SGG-29-RES-CONTROLPU-INSTALL" $cn
                    Add-QADGroupMember "SGG-29-RES-CONTROLPU2" $cn
              }
}

foreach ($comp in $controlpu_03){
              $oComp = get-QADComputer $comp
               $cn = $oComp.CanonicalName
               if ($cn.Length -gt 0){
	
                     write-host $("Add-QADGroupMember SGG-29-RES-CONTROLPU3 $cn")
                    Add-QADGroupMember "SGG-29-RES-CONTROLPU-INSTALL" $cn
                    Add-QADGroupMember "SGG-29-RES-CONTROLPU3" $cn
               }
}

foreach ($comp in $controlpu_04){
              $oComp = get-QADComputer $comp
               $cn = $oComp.CanonicalName
               if ($cn.Length -gt 0){
	
                     write-host $("Add-QADGroupMember SGG-29-RES-CONTROLPU4 $cn")
                    Add-QADGroupMember "SGG-29-RES-CONTROLPU-INSTALL" $cn
                    Add-QADGroupMember "SGG-29-RES-CONTROLPU4" $cn
                }
}

foreach ($comp in $controlpu_05){
              $oComp = get-QADComputer $comp
               $cn = $oComp.CanonicalName
               if ($cn.Length -gt 0){
	
                     write-host $("Add-QADGroupMember SGG-29-RES-CONTROLPU5 $cn")
                    Add-QADGroupMember "SGG-29-RES-CONTROLPU-INSTALL" $cn
                    Add-QADGroupMember "SGG-29-RES-CONTROLPU5" $cn
              }
}

foreach ($comp in $szinsd_comp){
              $oComp = get-QADComputer $comp
               $cn = $oComp.CanonicalName
               if ($cn.Length -gt 0){
	
                     write-host $("Add-QADGroupMember $szinsdgrp $cn")
                    Add-QADGroupMember $szinsdgrp $cn
              }
}

stop-transcript

