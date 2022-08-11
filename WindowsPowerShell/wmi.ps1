write-output "Computer System"
Get-CimInstance win32_computersystem | select-object description | FT

write-output "Operating System"
Get-CimInstance win32_operatingsystem | select-object name, version | FT

write-output "Process"
Get-CimInstance win32_processor | select-object currentclockspeed, numberofcores, L2cachesize, L3cachesize | FT

Get-CimInstance win32_physicalmemory | fl *
$diskdrives = get-ciminstance win32_diskdrive

foreach ($disk in $diskdrives) {
	$partitions = $disk|get-cimassociatedinstance -resultclassname win32_diskpartition
	foreach ($partition in $partitions) {
		$logicaldisks = $partition | get-cimassociatedinstance -resultclassname win32_logicaldisk
		foreach ($logicaldisk in $logicaldisks) {
			new-object -typename psobject -property @{Vandor=$disk.pnpdeviceid
								  Model=$disk.model
								  Size=$partition.size
								  "Size(GB)"=$logicaldisk.size / 1gb -as [int]
								  SpaceUsage=$logicaldisk.freespace
								  "SpaceUsage(GB)"=$logicaldisk.freespace / 1gb -as [int]
								  }
			}
		}	
	}

write-output "NetworkAdapter"
Get-CimInstance Win32_NetworkAdapterConfiguration | select-object description, ipenabled, index, ipaddress, subnetmask, dnsdomain, dnsserver* | where { $_.ipenabled -eq $true } | format-table -wrap

write-output "Video Controller"
Get-CimInstance win32_videocontroller | select-object pnpdeviceid, description | fl
$videocontroller = Get-CimInstance win32_videocontroller
write-output "CurrentScreenResolution"= $videocontroller.currenthorizontalresolution"X"$videocontroller.currentverticalresolution
