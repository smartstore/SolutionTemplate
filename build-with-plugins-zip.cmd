@echo off
cls
echo Building Smartstore with plugins + Zip...   		

call build.bat /t:DeployWithPluginsZip

pause