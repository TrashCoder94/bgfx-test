@echo off
pushd %~dp0\..\..\

echo "Generating Project with Premake"
call ThirdParty\premake\Binaries\premake5.exe vs2022
devenv BGFXTest.sln /rebuild Debug /project Premake
if %errorlevel% neq 0 exit /b %errorlevel%

echo "Building Debug Configuration"
devenv BGFXTest.sln /rebuild Debug
if %errorlevel% neq 0 exit /b %errorlevel%

echo "Building Release Configuration"
devenv BGFXTest.sln /rebuild Release
if %errorlevel% neq 0 exit /b %errorlevel%

popd