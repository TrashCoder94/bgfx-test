#!/bin/sh

echo "Running Debug HelloWorld executable!"
chmod +x Binaries/Debug-linux-x86_64/HelloWorld/HelloWorld
Binaries/Debug-linux-x86_64/HelloWorld/HelloWorld
if [ $? -ne 0 ] 
then
echo "Running debug executable failed, exiting out..."
exit 1
fi

echo "Running Release HelloWorld executable!"
chmod +x Binaries/Release-linux-x86_64/HelloWorld/HelloWorld
Binaries/Release-linux-x86_64/HelloWorld/HelloWorld
if [ $? -ne 0 ] 
then
echo "Running release executable failed, exiting out..."
exit 1
fi
