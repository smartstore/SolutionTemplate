@setlocal enableextensions
@cd /d "%~dp0"

@echo off

set linkedplugins=SmartStore.HelloWorld, SmartStore.HelloWorld2

set linksrc=%CD%\SmartStoreNET\src\Plugins
set linktarget=%CD%\src\Plugins

FOR %%A IN (%linkedplugins%) DO (
	mklink /j "%linksrc%\%%A-sym" "%linktarget%\%%A"
) 

pause

mklink /j "%CD%\SmartStoreNET\src\Presentation\SmartStore.Web\Themes\CMS" "%CD%\src\Themes\CMS"

pause

mklink "%CD%\SmartStoreNET\src\SmartStoreNET.Dev-sym.sln" "%CD%\src\SmartStoreNET.Dev.sln"
mklink "%CD%\SmartStoreNET\SmartStoreNET.Dev-sym.proj" "%CD%\SmartStoreNET.Dev.proj"

pause


