project "bx"
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
		"%{IncludeDir.bx}/bx/*.h",
		"%{IncludeDir.bx}/bx/inline/*.inl",
		"%{wks.location}/ThirdParty/bx/src/*.cpp"
	}
	excludes
	{
		"%{wks.location}/ThirdParty/bx/src/amalgamated.cpp",
		"%{wks.location}/ThirdParty/bx/src/crtnone.cpp"
	}
	includedirs
	{
		"%{IncludeDir.bx}",
		"%{IncludeDir.bx3rdParty}"
	}
	filter "configurations:Release"
		defines "BX_CONFIG_DEBUG=0"
	filter "configurations:Debug"
		defines "BX_CONFIG_DEBUG=1"
	filter "action:vs*"
		defines "_CRT_SECURE_NO_WARNINGS"
	setBxCompat()