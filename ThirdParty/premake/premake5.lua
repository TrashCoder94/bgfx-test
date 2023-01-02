project "Premake"
	kind "Utility"
	
	targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{wks.location}/**premake5.lua"
	}
	
	postbuildmessage "Regenerating project files with Premake5!"
	postbuildcommands
	{	
		"%{prj.location}Binaries/premake5 %{_ACTION} --file=\"%{wks.location}premake5.lua\""
	}