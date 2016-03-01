@ECHO OFF
SET CONF="%AppData%\.nfs2se\nfs2se.conf"
IF EXIST %CONF% (
	START notepad %CONF%
) ELSE (
	ECHO Please run the game for the first time!
	PAUSE
)
