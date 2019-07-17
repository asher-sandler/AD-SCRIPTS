$aaa=import-csv -Path .\notValidUsers.txt

$aaa


	$crlf = [char][int]13+[char][int]10
	
	$str = ""
	
	foreach($item in $aaa)
	{
	   $user = get-qaduser $('"'+$item.UserName+'"')
	   
        write-host $user.Name
	        
	        $str += "#" + $item.UserName+$crlf
			$str += '# get-qaduser "' + $item.UserName+'"'+$crlf
			$str += 'Set-AdUser "'+ $user.Name + '" -EmployeeNumber "'+$item.EmployeeNumber+'"'+$crlf

	}
	
	$str | out-file  -filepath "SetAttr.ps1" -Encoding utf8