include "./ThirdParty/premake/premake_customization/solution_items.lua"

-- Visual Studio Solution
workspace "BGFXTest"
	architecture "x86_64"
	
	configurations
	{
		"Debug",
		"Release",
		"Distribution"
	}

	if os.is64bit() and not os.istarget("windows") then
		platforms "x86_64"
	else
		platforms { "x86", "x86_64" }
	end

	solution_items
	{
		".editorconfig"
	}

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
		defines "FD_DISTRIBUTION"
		runtime "Release"
		optimize "on"
		
	filter "platforms:x86"
		architecture "x86"
	filter "platforms:x86_64"
		architecture "x86_64"
	filter "system:macosx"
		xcodebuildsettings {
			["MACOSX_DEPLOYMENT_TARGET"] = "10.9",
			["ALWAYS_SEARCH_USER_PATHS"] = "YES", -- This is the minimum version of macos we'll be able to run on
		};

-- Folder to put Binaries and Intermediate files into
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories
IncludeDir = {}
IncludeDir["bgfx"] = "%{wks.location}/bgfx-test/ThirdParty/bgfx/include"
IncludeDir["bimg"] = "%{wks.location}/bgfx-test/ThirdParty/bimg/include"
IncludeDir["bx"] = "%{wks.location}/bgfx-test/ThirdParty/bx/include"
IncludeDir["bxCompatMSVC"] = "%{wks.location}/bgfx-test/ThirdParty/bx/include/compat/msvc"
IncludeDir["bxCompatMingW"] = "%{wks.location}/bgfx-test/ThirdParty/bx/include/compat/mingw"
IncludeDir["bxCompatOSX"] = "%{wks.location}/bgfx-test/ThirdParty/bx/include/compat/osx"
IncludeDir["glfw"] = "%{wks.location}/bgfx-test/ThirdParty/glfw/include"

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
group ""

group "Example"
	include "HelloWorld"
group ""