# Toggle AirPort Device On/Off
#
# This script will either turn on or off 
# your AirPort card based on its current state.

# Fetch the name of your AirPort Device
set airPortDevice to do shell script "/usr/sbin/networksetup -listallhardwareports | awk '{if($3==\"Wi-Fi\"){getline;print}}' | awk '{print $2}'"

# Fetch the current state of the AirPort device
set airPortPower to do shell script ("networksetup -getairportpower " & airPortDevice & " | awk '{print $4}'")

if airPortPower is equal to "on" then
	toggleWifi("off", airPortDevice)
	set apStatus to false
else
	toggleWifi("on", airPortDevice)
	set apStatus to true
end if

on toggleWifi(value, device)
	do shell script ("/usr/sbin/networksetup -setairportpower " & device & " " & value)
end toggleWifi
