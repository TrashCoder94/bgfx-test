project "ImGui"
	kind "StaticLib"
	language "C++"
	cppdialect "C++14"
	staticruntime "on"
	
	targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{wks.location}/ThirdParty/imgui/imconfig.h",
		"%{wks.location}/ThirdParty/imgui/imgui.h",
		"%{wks.location}/ThirdParty/imgui/imgui.cpp",
		"%{wks.location}/ThirdParty/imgui/imgui_draw.cpp",
		"%{wks.location}/ThirdParty/imgui/imgui_internal.h",
		"%{wks.location}/ThirdParty/imgui/imgui_widgets.cpp",
		"%{wks.location}/ThirdParty/imgui/imgui_tables.cpp",
		"%{wks.location}/ThirdParty/imgui/imstb_rectpack.h",
		"%{wks.location}/ThirdParty/imgui/imstb_textedit.h",
		"%{wks.location}/ThirdParty/imgui/imstb_truetype.h",
		"%{wks.location}/ThirdParty/imgui/imgui_demo.cpp",
		"%{wks.location}/ThirdParty/imgui/backends/imgui_impl_glfw.cpp",
		"%{wks.location}/ThirdParty/imgui/backends/imgui_impl_glfw.h",
		"%{wks.location}/ThirdParty/imgui/backends/imgui_impl_opengl3.cpp",
		"%{wks.location}/ThirdParty/imgui/backends/imgui_impl_opengl3.h"
	}

	includedirs
	{
		"%{IncludeDir.glfw}",
		"%{IncludeDir.imgui}"
	}

	filter "system:linux"
		pic "on"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"