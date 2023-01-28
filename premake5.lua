include "./ThirdParty/premake/premake_customization/solution_items.lua"

-- Visual Studio Solution
workspace "BGFXTest"
	architecture "x86_64"
	startproject "HelloWorld"
	
	configurations
	{
		"Debug",
		"Release",
		"Distribution"
	}

	if os.is64bit() and not os.host() == "windows" then
		platforms "x86_64"
	else
		platforms { "x86", "x86_64" }
	end

	if not os.host() == "macosx" then
		solution_items { ".editorconfig" }
	end

	flags
	{
		"MultiProcessorCompile"
	}
	
	linkoptions 
	{ 
		"-IGNORE:4006"
	}
	
	filter "configurations:Debug"
		defines
		{
			"FD_DEBUG",
			"BX_CONFIG_DEBUG=1"
		}
		runtime "Debug"
		symbols "on"
	filter "configurations:Release"
		defines
		{
			"FD_RELEASE",
			"BX_CONFIG_DEBUG=0"
		}
		runtime "Release"
		optimize "on"
	filter "configurations:Distribution"
		defines
		{
			"FD_DISTRIBUTION",
			"BX_CONFIG_DEBUG=0"
		}
		runtime "Release"
		optimize "on"
		
	filter "platforms:x86"
		architecture "x86"
	filter "platforms:x86_64"
		architecture "x86_64"
	filter "system:windows"
		toolset "v143"
		buildoptions { "/Zc:__cplusplus" }
	filter "system:macosx"
		xcodebuildsettings {
			["MACOSX_DEPLOYMENT_TARGET"] = "10.9",
			["ALWAYS_SEARCH_USER_PATHS"] = "YES", -- This is the minimum version of macos we'll be able to run on
		};

-- Folder to put Binaries and Intermediate files into
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories
IncludeDir = {}
IncludeDir["bgfx"] = "%{wks.location}/ThirdParty/bgfx/include"
IncludeDir["bgfx3rdParty"] = "%{wks.location}/ThirdParty/bgfx/3rdparty"
IncludeDir["bgfx3rdPartydxsdk"] = "%{wks.location}/ThirdParty/bgfx/3rdparty/dxsdk/include"
IncludeDir["bgfx3rdPartyKhronos"] = "%{wks.location}/ThirdParty/bgfx/3rdparty/khronos"
IncludeDir["bimg"] = "%{wks.location}/ThirdParty/bimg/include"
IncludeDir["bimg3rdPartyAstcCodec"] = "%{wks.location}/ThirdParty/bimg/3rdparty/astc-codec"
IncludeDir["bimg3rdPartyAstcCodecInclude"] = "%{wks.location}/ThirdParty/bimg/3rdparty/astc-codec/include"
IncludeDir["bx"] = "%{wks.location}/ThirdParty/bx/include"
IncludeDir["bx3rdParty"] = "%{wks.location}/ThirdParty/bx/3rdparty"
IncludeDir["bxCompatMSVC"] = "%{wks.location}/ThirdParty/bx/include/compat/msvc"
IncludeDir["bxCompatMingW"] = "%{wks.location}/ThirdParty/bx/include/compat/mingw"
IncludeDir["bxCompatOSX"] = "%{wks.location}/ThirdParty/bx/include/compat/osx"
IncludeDir["glfw"] = "%{wks.location}/ThirdParty/glfw/include"
IncludeDir["imgui"] = "%{wks.location}/ThirdParty/imgui"

function setBxCompat()
	filter "action:vs*"
		includedirs { "%{IncludeDir.bxCompatMSVC}" }
	filter { "system:windows", "action:gmake" }
		includedirs { "%{IncludeDir.bxCompatMingW}" }
	filter { "system:macosx" }
		includedirs { "%{IncludeDir.bxCompatOSX}" }
		buildoptions { "-x objective-c++" }
end

-- Other premakes to use
group "Dependencies"
	include "ThirdParty/premake"
	include "bgfx"
	include "bimg"
	include "bx"
	include "glfw"
	include "imgui"
group ""

group "Example"
	include "HelloWorld"
group ""