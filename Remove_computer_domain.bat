@echo off
start /B /W wmic.exe /interactive:off ComputerSystem Where "Name='%computername%'" Call UnJoinDomainOrWorkgroup FUnjoinOptions=0
start /B /W wmic.exe /interactive:off ComputerSystem Where "Name='%computername%'" Call JoinDomainOrWorkgroup name="WORKGROUP"
start /B /W wmic.exe /interactive:off ComputerSystem Where "Name='%computername%'" Call Rename name="standaloneComputer"
shutdown.exe /r /t 0 /f
