@echo off
pushd %~dp0\..\

echo "Generating Project with Premake"
call ThirdParty\premake\Binaries\premake5.exe vs2022
if %errorlevel% neq 0 exit /b %errorlevel%

echo "Building Debug Configuration"
msbuild BGFXTest.sln /t:Rebuild /p:Configuration=Debug
if %errorlevel% neq 0 exit /b %errorlevel%

echo "Building Release Configuration"
msbuild BGFXTest.sln /t:Rebuild /p:Configuration=Release
if %errorlevel% neq 0 exit /b %errorlevel%

popd