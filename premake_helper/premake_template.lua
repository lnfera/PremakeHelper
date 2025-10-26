-- Make sure that these are relative paths to the helper folder 
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
		-- Name of other projects to build first
		DEPENDSON = { 
			
		},
		-- Header search paths relative from premake_*.lua file add "./" to add a path to itself
		INCLUDE_DIRS = { 
			"./" 
		},
		-- Libraries to link.
		LINKS = { 
		},
		-- File extensions and extra linker input files.
		-- Example: DIRECTORIES[SOURCE].."folder/**.hpp", "folder/**.cpp", "**.cpp"
		FILES = { 
			"**.h",
			"**.hpp",
			"**.cpp",
			"**.inl",
			"**.lua",
	 	}, 			
	},
	
	-- Config Filters from SETTING_WORKSPACE.CONFIGURATIONS.*
	-- Example:
	-- CONFIG_FILTER = {
	--	{
	-- 		FILTER_NAME = SETTING_WORKSPACE.CONFIGURATIONS.DEBUG.NAME, -- Not optional for filter to work
	-- 		SYMBOLS = ON / OFF, 
	-- 		OPTIMIZE = ON / OFF,
	-- 		KIND = KIND_CONSOLE / KIND_LIBRARY / KIND_WINDOWED
	--	},
	--}
	CONFIG_FILTER = { 
	}
}

SetUpProject(PROJECT_SETTINGS)