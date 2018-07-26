connect-ucs <ucsname>

#check the paths from the vnics to the Blade
 get-ucsserver | Get-UcsFabricLocale | Get-UcsFabricPath | Get-UcsDcxVc | select dn,switchid,operstate,adminstate,vnic,linkstate | where { $_.vnic } | sort dn | ft
 
 #check the physical path of the blade to the iom
 get-UcsAdaptorExtEthIf | select peerdn,epdn,linkstate,operstate,switchId,side,slotid | sort epdn | ft
 
 #check the path from the iom to the FI
 Get-UcsEtherSwitchIntFIo | select dn,peerdn,type,switchid,slotid,model,ifrole,operstate | ft

 #check the path from the iom to the FI as a PortChannel
 Get-UcsEtherSwitchIntFIoPcEp | select dn,membership | ft

 #check the uplinks on your FI
Get-UcsUplinkPortChannelMember | select dn,type,IfRole,LicState,OperState |ft

#check your FC Portchannel Uplinks on your FI

 
 #check your FC Ports on your FI
 Get-UcsFiFcPort  | select epdn,maxspeed,LicState,isportchannelmember,operstate | ft



