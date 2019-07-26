#Script to get the mountpoints of NTFS disks assigned to folders


function get-mountpoints-info {
# Get mountpoints from WMI object
# Filter for snapshots and volumes assigned to a letter
$mountpoints = Get-WmiObject win32_volume -Filter "DriveType='3'" | Where DriveLetter -EQ $null | Where Name -NotLike "*\\?\*"

#Format output as JSON to be used by Zabbix Agent
convertto-json @{"data"= $mountpoints | Select @{N='{#DISKNAME}'; E={$_.Name}},@{N='{#DISKTYPE}'; E={$_.FileSystem}}  } -Compress  | % { [System.Text.RegularExpressions.Regex]::Unescape($_) }

}


get-mountpoints-info