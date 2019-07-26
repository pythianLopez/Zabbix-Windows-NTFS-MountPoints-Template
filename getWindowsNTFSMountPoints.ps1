#Script to get the mountpoints of NTFS disks assigned to folders


function get-mountpoints-info {
$mountpoints = Get-WmiObject win32_volume -Filter "DriveType='3'"
convertto-json @{"data"= $mountpoints | Select Name, FileSystem | where DriveLetter -eq $null | where Name -notlike "*\\?\*" }

}



get-mountpoints-info