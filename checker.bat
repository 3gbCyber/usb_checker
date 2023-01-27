@echo off
setlocal


for /F "skip=1 tokens=1-10" %%A IN ('wmic logicaldisk get description^, deviceid')DO (
		
	if "%%A %%B" == "Removable Disk" (
		%%C
		
		FOR /r %%x IN (*.exe, *.dll, *.bat) DO (
			For /f %%h in ('certutil -hashfile "%%x" MD5 ^| findstr /V ":"') do (
			echo %%x, %%h
			)
		)
		
	)
		
)
