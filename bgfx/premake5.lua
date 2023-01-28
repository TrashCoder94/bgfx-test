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
		"%{wks.location}/ThirdParty/bgfx/src/*.cpp",
		"%{wks.location}/ThirdParty/bgfx/src/*.h"
	}
	excludes
	{
		"%{wks.location}/ThirdParty/bgfx/src/amalgamated.cpp"
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
			"%{wks.location}/ThirdParty/bgfx/src/glcontext_glx.cpp",
			"%{wks.location}/ThirdParty/bgfx/src/glcontext_egl.cpp"
		}
	filter "system:macosx"
		files
		{
			"%{wks.location}/ThirdParty/bgfx/src/*.mm"
		}
		excludes
		{
			"%{wks.location}/ThirdParty/bgfx/src/amalgamated.mm"
		}
		links { "QuartzCore.framework", "Metal.framework", "Cocoa.framework", "IOKit.framework", "CoreVideo.framework", "CoreGraphics.framework" }
	setBxCompat()