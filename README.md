# Zabbix-Windows-NTFS-MountPoints-Template

This repository contains a Zabbix Template to monitor NTFS mount points to folders and a Powershell script to get those mountpoints

## Installation

* Clone this repository
* Copy the script getWindowsNTFSMountPoints.ps1 to the path
```
C:\Program Files\Zabbix Agent\scripts
```
* Modify the file *'C:\Program Files\Zabbix Agent\zabbix_agentd.conf'* adding the following line
```
UserParameter=vfs.fs.customfolders.windowsmountpoints.discovery,powershell -File "C:\Program Files\Zabbix Agent\scripts\getNTFSMountPoints.ps1" "$1"
```
* Import the template to the Zabbix System
* Asign the Template to the needed hosts, Could take within an a hour to start to show data

## Description

* The powershell script gets the non letter mountpoints and generates a JSON output with that information
* The Zabbix template uses LLD to parse and run the script and parse the template using Discovery feature


