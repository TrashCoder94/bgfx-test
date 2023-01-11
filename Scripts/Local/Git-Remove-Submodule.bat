@echo off
pushd %~dp0\..\..\

set /P folderName=What is the folder name of the submodule you want to remove from the ThirdParty folder?

echo Removing %repo% from ThirdParty/%folderName%/
git rm ThirdParty/%folderName%/

popd
PAUSE