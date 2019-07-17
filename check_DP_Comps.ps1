$comps = get-content dpcomps.txt

foreach ($item in $comps)
{
   # write-host $item

    $system = get-qadcomputer $item
    if ([string]::isnullorempty($system))
    {
	$item
    }
}