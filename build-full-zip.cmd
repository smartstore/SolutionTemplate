@echo off
cls
echo Building Smartstore with plugins & themes + Zip ...   											

call build.bat /t:DeployThemeZip

pause