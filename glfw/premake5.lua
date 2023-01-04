project "glfw"
	kind "StaticLib"
	language "C"
	staticruntime "on"
	
	targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{IncludeDir.glfw}/GLFW/*.h",
		"%{wks.location}/bgfx-test/ThirdParty/glfw/src/context.c",
		"%{wks.location}/bgfx-test/ThirdParty/glfw/src/egl_context.*",
		"%{wks.location}/bgfx-test/ThirdParty/glfw/src/init.c",
		"%{wks.location}/bgfx-test/ThirdParty/glfw/src/input.c",
		"%{wks.location}/bgfx-test/ThirdParty/glfw/src/internal.h",
		"%{wks.location}/bgfx-test/ThirdParty/glfw/src/monitor.c",
		"%{wks.location}/bgfx-test/ThirdParty/glfw/src/null*.*",
		"%{wks.location}/bgfx-test/ThirdParty/glfw/src/osmesa_context.*",
		"%{wks.location}/bgfx-test/ThirdParty/glfw/src/platform.c",
		"%{wks.location}/bgfx-test/ThirdParty/glfw/src/vulkan.c",
		"%{wks.location}/bgfx-test/ThirdParty/glfw/src/window.c"
	}
	includedirs { "%{IncludeDir.glfw}" }
	filter "system:windows"
		defines "_GLFW_WIN32"
		files
		{
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/win32_*.*",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/wgl_context.*"
		}
	filter "system:linux"
		defines "_GLFW_X11"
		files
		{
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/glx_context.*",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/linux*.*",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/posix*.*",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/x11*.*",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/xkb*.*"
		}
	filter "system:macosx"
		defines "_GLFW_COCOA"
		files
		{
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/cocoa_*.*",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/posix_thread.h",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/nsgl_context.h",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/egl_context.h",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/osmesa_context.h",
			
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/posix_thread.c",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/nsgl_context.m",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/egl_context.c",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/nsgl_context.m",
			"%{wks.location}/bgfx-test/ThirdParty/glfw/src/osmesa_context.c"   
		}
	filter "action:vs*"
		defines "_CRT_SECURE_NO_WARNINGS"