include "premake_defines"
include "premake_helper_functions"

--=============================================================
-- PROJECT_SETTINGS : Defines all project-level Premake settings
--=============================================================
local PROJECT_SETTINGS = {
	-- Project Name
	NAME = "PROJECT_NAME",

	-- Build Settings
	KIND = KIND_CONSOLE,		-- ConsoleApp / StaticLib / SharedLib
	LANGUAGE = LANGUAGE_CPP,	-- C / C++
	PCH = nil,			 		-- Precompiled header (optional) (No file extension) Example: pch_math

	-- Linker Settings
	LINKER = {
		DEPENDSON = { }, 		-- Other projects to build first
		INCLUDE_DIRS = { "./" },		-- Header search paths relative from premake_*.lua file add "./" to add a path to itself
		LINKS = { },			-- Libraries to link.
		FILES = { 
			"**.h",
			"**.hpp",
			"**.cpp",
			"**.inl",
			"**.lua",
	 	}, 			-- File extensions and extra linker input files. Example: DIRECTORIES[SOURCE].."folder/**.hpp", DIRECTORIES[SOURCE].."folder/**.cpp"
	},
	
	-- Config Filters from SETTING_WORKSPACE.CONFIGURATIONS.*
	-- Example:
	-- CONFIG_FILTER = {
	-- FILTER_NAME = SETTING_WORKSPACE.CONFIGURATIONS.DEBUG.NAME, -- Not optional for filter to work
	-- SYMBOLS = ON / OFF, 
	-- OPTIMIZE = ON / OFF,
	-- KIND = KIND_CONSOLE / KIND_LIBRARY / KIND_WINDOWED
	--}
	CONFIG_FILTER = { 
	}
}

SetUpProject(PROJECT_SETTINGS)