$compsDP = get-content dpcomps.txt
$compsSRV = get-content srvlist.txt

foreach ($srv in $compsSRV)
{
   # write-host $item
    $found = $false
    foreach($item in $compsDP)
    {
        if ($srv.ToUpper() -eq $item.ToUpper())
        {
              $found = $true
              break
        }
 
    }
    if ($found -eq $false)
    {
         write-host $srv

    }
}