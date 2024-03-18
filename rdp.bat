#precisa ser admin local para funcionar

net user speaker S3cur!ty /add
net localgroup "Administrators" "speaker" /add
net localgroup "Remote Desktop Users" "speaker" /add

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 1 /f

sc config "Termservice" start= auto
net start "Termservice"

netsh advfirewall set currentprofile state on

netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

#xfreerdp /u:speaker /v:192.168.216.121 /cert-ignore /p:"S3cur!ty"

