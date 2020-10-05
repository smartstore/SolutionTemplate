@setlocal enableextensions
@cd /d "%~dp0"

@echo off

set linkedplugins=%CD%\*

set linksrc=%CD%\..\SmartStoreNET\src\Presentation\SmartStore.Web\Plugins
set linktarget=%CD%

FOR /D %%G IN (%linkedplugins%) DO (
	mklink /j "%linksrc%\%%~nxG" "%linktarget%\%%~nxG"	
)

pause
 