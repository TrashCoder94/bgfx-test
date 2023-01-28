@echo off
pushd %~dp0\..\..\

echo "Running Debug HelloWorld executable!"
call Binaries\Debug-windows-x86_64\HelloWorld\HelloWorld.exe
if %errorlevel% neq 0 exit /b %errorlevel%

popd