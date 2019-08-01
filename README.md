# Zabbix-Windows-NTFS-MountPoints-Template

This repository contains a Zabbix Template to monitor NTFS mount points to folders and a Powershell script to get those mount points information.

The current Zabbix Agent does not support that functionality 

## Installation

### Host Installation

* Clone this repository
* Copy the script getWindowsNTFSMountPoints.ps1 to the path
```
C:\Program Files\Zabbix Agent\scripts
```
* Modify the file *'C:\Program Files\Zabbix Agent\zabbix_agentd.conf'* adding the following line
```
UserParameter=vfs.fs.customfolders.windowsmountpoints.discovery,powershell -File "C:\Program Files\Zabbix Agent\scripts\getNTFSMountPoints.ps1" "$1"
```
* Check for the seeting Timeout=30 on the configuration file.
* Save the changes
* Restart the Zabbix agent service

### Zabbix Server Installation

* Go to Configuration/Templates 
* Import the template file *OSWindowsNTFSMountPoints.xml* to the Zabbix System
![Import Template](images/importTemplate.png?raw=true "Title")

* Assign the Template to the needed hosts, Could take within an a hour to start to show data

## Description

* The PowerShell script gets the nonletter mount points and generates a JSON output with that information
* The Zabbix template uses LLD to parse and run the script and parse the template using Discovery feature


## Items Added

Graphs
This template creates a Graph for the discovered disks
![Graphs](images/graphTemplate.png?raw=true "Title")

Data
This template adds the same data than the original Windows Template 
![Data](images/data.png?raw=true "Title")
