#!/bin/sh

sudo apt install libgl-dev

echo "Generating Project with Premake!"
chmod +x ThirdParty/premake/Binaries/premake5
ThirdParty/premake/Binaries/premake5 --file=premake5.lua gmake2
make config=debug_x86_64
make config=release_x86_64