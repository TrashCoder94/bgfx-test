project "glfw"
	kind "StaticLib"
	staticruntime "on"
	language "C"
	
	targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{IncludeDir.glfw}/GLFW/*.h",
		"%{wks.location}/ThirdParty/glfw/src/context.c",
		"%{wks.location}/ThirdParty/glfw/src/egl_context.*",
		"%{wks.location}/ThirdParty/glfw/src/init.c",
		"%{wks.location}/ThirdParty/glfw/src/input.c",
		"%{wks.location}/ThirdParty/glfw/src/internal.h",
		"%{wks.location}/ThirdParty/glfw/src/monitor.c",
		"%{wks.location}/ThirdParty/glfw/src/null*.*",
		"%{wks.location}/ThirdParty/glfw/src/osmesa_context.*",
		"%{wks.location}/ThirdParty/glfw/src/platform.c",
		"%{wks.location}/ThirdParty/glfw/src/vulkan.c",
		"%{wks.location}/ThirdParty/glfw/src/window.c"
	}
	includedirs { "%{IncludeDir.glfw}" }
	filter "system:windows"
		defines "_GLFW_WIN32"
		files
		{
			"%{wks.location}/ThirdParty/glfw/src/win32_*.*",
			"%{wks.location}/ThirdParty/glfw/src/wgl_context.*"
		}
	filter "system:linux"
		defines "_GLFW_X11"
		files
		{
			"%{wks.location}/ThirdParty/glfw/src/glx_context.*",
			"%{wks.location}/ThirdParty/glfw/src/linux*.*",
			"%{wks.location}/ThirdParty/glfw/src/posix*.*",
			"%{wks.location}/ThirdParty/glfw/src/x11*.*",
			"%{wks.location}/ThirdParty/glfw/src/xkb*.*"
		}
	filter "system:macosx"
		defines "_GLFW_COCOA"
		files
		{
			"%{wks.location}/ThirdParty/glfw/src/cocoa_*.*",
			"%{wks.location}/ThirdParty/glfw/src/posix_thread.h",
			"%{wks.location}/ThirdParty/glfw/src/nsgl_context.h",
			"%{wks.location}/ThirdParty/glfw/src/egl_context.h",
			"%{wks.location}/ThirdParty/glfw/src/osmesa_context.h",
			
			"%{wks.location}/ThirdParty/glfw/src/posix_thread.c",
			"%{wks.location}/ThirdParty/glfw/src/nsgl_context.m",
			"%{wks.location}/ThirdParty/glfw/src/egl_context.c",
			"%{wks.location}/ThirdParty/glfw/src/nsgl_context.m",
			"%{wks.location}/ThirdParty/glfw/src/osmesa_context.c"   
		}
	filter "action:vs*"
		defines "_CRT_SECURE_NO_WARNINGS"