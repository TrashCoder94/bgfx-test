project "bimg"
	kind "StaticLib"
	staticruntime "on"
	language "C++"
	cppdialect "C++14"
	exceptionhandling "Off"
	rtti "Off"
	
	targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{IncludeDir.bimg}/bimg/*.h",
		"%{IncludeDir.bimg3rdPartyAstcEncoder}/*.h",
		"%{wks.location}/bgfx-test/ThirdParty/bimg/src/image.cpp",
		"%{wks.location}/bgfx-test/ThirdParty/bimg/src/image_gnf.cpp",
		"%{wks.location}/bgfx-test/ThirdParty/bimg/src/*.h",
		"%{wks.location}/bgfx-test/ThirdParty/bimg/3rdparty/astc-encoder/source/*.cpp"
	}
	includedirs
	{
		"%{IncludeDir.bx}",
		"%{IncludeDir.bimg}",
		"%{IncludeDir.bimg3rdPartyAstcEncoder}"
	}
	setBxCompat()