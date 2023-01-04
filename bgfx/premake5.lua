project "bgfx"
	kind "StaticLib"
	staticruntime "on"
	language "C++"
	cppdialect "C++14"
	exceptionhandling "Off"
	rtti "Off"
	defines "__STDC_FORMAT_MACROS"
	
	targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{IncludeDir.bgfx}/bgfx/**.h",
		"%{wks.location}/bgfx-test/ThirdParty/bgfx/src/*.cpp",
		"%{wks.location}/bgfx-test/ThirdParty/bgfx/src/*.h"
	}
	excludes
	{
		"%{wks.location}/bgfx-test/ThirdParty/bgfx/src/amalgamated.cpp"
	}
	includedirs
	{
		"%{IncludeDir.bx}",
		"%{IncludeDir.bimg}",
		"%{IncludeDir.bgfx}",
		"%{IncludeDir.bgfx3rdParty}",
		"%{IncludeDir.bgfx3rdPartydxsdk}",
		"%{IncludeDir.bgfx3rdPartyKhronos}"
	}
	filter "action:vs*"
		defines "_CRT_SECURE_NO_WARNINGS"
		excludes
		{
			"%{wks.location}/bgfx-test/ThirdParty/bgfx/src/glcontext_glx.cpp",
			"%{wks.location}/bgfx-test/ThirdParty/bgfx/src/glcontext_egl.cpp"
		}
	filter "system:macosx"
		files
		{
			"%{wks.location}/bgfx-test/ThirdParty/bgfx/src/*.mm"
		}
	setBxCompat()