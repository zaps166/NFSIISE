@ECHO OFF

SET /P ASK="Do you want to clean the config file (Y/n)? "
IF /I "%ASK%" NEQ "N" GOTO CLEAN
EXIT

:CLEAN

SET CONF="%AppData%\.nfs2se\nfs2se.conf"
IF EXIST %CONF% (
	DEL %CONF%
) ELSE (
	ECHO Please run the game for the first time!
	PAUSE
)
