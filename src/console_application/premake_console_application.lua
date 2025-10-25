include "../../premake_helper/premake_defines.lua"
include "../../premake_helper/premake_helper_functions.lua"

--=============================================================
-- PROJECT_SETTINGS : Defines all project-level Premake settings
--=============================================================
local PROJECT_SETTINGS = {
	-- Project Name
	NAME = "Application",

	-- Build Settings
	KIND = KIND_CONSOLE,		-- ConsoleApp / StaticLib / SharedLib
	LANGUAGE = LANGUAGE_CPP,	-- C / C++
	PCH = "pch_console_application",			 		-- Precompiled header (optional) (No file extension) Example: pch_math

	-- Linker Settings
	LINKER = {
		DEPENDSON = { "library_example" }, 		-- Other projects to build first
		INCLUDE_DIRS = { "../library_example" },	-- Header search paths relative from premake_*.lua file
		LINKS = { "library_example" },			-- Libraries to link.
		FILES = { 
			"**.h",
			"**.hpp",
			"**.cpp",
			"**.inl",
		}, 			-- File extensions and extra linker input files. Example: DIRECTORIES[SOURCE].."folder/**.hpp", DIRECTORIES[SOURCE].."folder/**.cpp"
	},
	
	-- Config Filters from SETTING_WORKSPACE.CONFIGURATIONS.*
	-- Example:
	-- SETTING_WORKSPACE.CONFIGURATIONS.DEBUG.NAME = {
	-- SYMBOLS = ON / OFF,
	-- OPTIMIZE = ON / OFF,
	-- KIND = KIND_CONSOLE / KIND_LIBRARY / KIND_WINDOWED
	--}
	CONFIG_FILTER = { }
}

SetUpProject(PROJECT_SETTINGS)