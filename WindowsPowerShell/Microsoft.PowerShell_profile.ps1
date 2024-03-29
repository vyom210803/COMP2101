$env:path += "$env:PATH;C:/Users/17059/Desktop"

write-output "Welcome! It is a planet $env:computername Overlord $env:username"
$now = get-date -format 'HH:MM tt on dddd'
write-output "CurrentTime is $now."
Get-CimInstance cim_processor | select -first 10

function welcome {
write-output "Welcome! It is a planet $env:computername Overlord $env:username"
$now = get-date -format 'HH:MM tt on dddd'
write-output "CurrentTime is $now."
}

function get-cpuinfo {
get-ciminstance cim_processor | format-list manufacturer, caption, version, currentclockspeed, maxclockspeed, numberofcores
}

function get-mydisks {
get-Disk | format-list disknumber, manufacturer, model, serialnumber, firmwareversion, size
}

new-item -path alias:np -value notepad