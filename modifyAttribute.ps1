$users = Import-Csv .\usersExtAttr.csv  -Delimiter "`t" -Encoding Default


foreach($user in $users)
{

        $userName=$user.UserName
        
        

        $userName
        
        $ex10 = $user.ExtensionAttribute10.ToString()
        $ex11 = $user.ExtensionAttribute11.ToString()
        $ex12 = $user.ExtensionAttribute12.ToString()
        $ex13 = $user.ExtensionAttribute13.ToString()
        $ex14 = $user.ExtensionAttribute14.ToString()
        $ex15 = ""

       
	if ($ex10.length -gt 60)
	{
		$ex10=$ex10.Substring(0,59)
	}
	if ($ex11.length -gt 60)
	{
		$ex11=$ex11.Substring(0,59)
	}
	if ($ex12.length -gt 60)
	{
		$ex12=$ex12.Substring(0,59)
	}
	if ($ex13.length -gt 60)
	{
		$ex13=$ex13.Substring(0,59)
	}
	if ($ex14.length -gt 60)
	{
		$ex14=$ex14.Substring(0,59)
	}
	if ($ex15.length -gt 60)
	{
		$ex15=$ex15.Substring(0,59)
	}

	# userName	Fam	Im	Otch	Dolgn	Phone	Street	City	Region	Postal code	Fax
	$Fam   = $user.Fam   
	$Im	= $user.Im
	$otch	= $user.Otch
	$Street = $user.Street
	$City	= $user.City
	$PostalCode = $user.PostalCode
	$fax   = $user.Fax
        $Phone = $user.Phone
	$Dolgn = $user.Dolgn
        # $Address=$user.Address


        $Fam   # ok
	$Im    # ok
	$Otch
        $dn = $Fam + " " + $Im +" " + $Otch
        $dn   # ok

	$Dolgn   # ok
        $Phone # ok
	$Street # ok

	$City  # ok
	$Region
	$PostalCode # ok

	$Fax # ok


        $ex10
        $ex11
        $ex12
        $ex13
        $ex14
        $ex15

	$Department = $ex13
        

	




# SET-QADUSER $userName -Department $Department -objectAttributes @{ExtensionAttribute10=$ex10;ExtensionAttribute11=$ex11;ExtensionAttribute12=$ex12;ExtensionAttribute13=$ex13;ExtensionAttribute14=$ex14;;ExtensionAttribute15=$ex15}

# set-QADUSER $userName 
 SET-QADUSER $userName -City $City -Fax $Fax -PostalCode $PostalCode -PhoneNumber $Phone -LastName $Fam -FirstName $Im -DisplayName $dn -Title $Dolgn -Street $Street  -objectAttributes @{co="Russia"}
 # read-host 

}





