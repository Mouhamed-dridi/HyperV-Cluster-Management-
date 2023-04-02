# Get all info 
Get-Cluster | Format-List *


# Get IP Name Domain 
Get-Cluster | Select-Object Name, @{Name="IPAddress"; Expression={(Get-ClusterNetwork | Where-Object {$_.Role -eq "Cluster"}).Address}}, Domain, @{Name="NodeCount"; Expression={(Get-ClusterNode).Count}}


# Get Name 
(Get-Cluster).Name


# Number Node into Cluster 
(Get-ClusterNode).Count

# get network interface of server remotly 
Get-NetAdapter -CimSession <computername>


# get Interface Teaming NIC of cluster
Get-ClusterNode | ForEach-Object {Get-NetLbfoTeam -CimSession $_.Name}
