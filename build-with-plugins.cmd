@echo off
cls
echo Building Smartstore with plugins ...   		

call build.bat /t:DeployWithPlugins

pause