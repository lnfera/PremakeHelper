include "../../../premake_helper/premake_defines.lua"
include "../../../premake_helper/premake_helper_functions.lua"

--=============================================================
-- PROJECT_SETTINGS : Defines all project-level Premake settings
--=============================================================
local PROJECT_SETTINGS = {
	-- Project Name
	NAME = "Application",

	LINKER = {
		-- Name of other projects to build first
		DEPENDSON = { 
			"library_example"
		},
		-- Header search paths relative from premake_*.lua file add "./" to add a path to itself
		INCLUDE_DIRS = { 
			"./",
			"../library_example/"
		},
		-- Libraries to link.
		LINKS = { 
			"library_example"
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
		{
			FILTER_NAME = SETTING_WORKSPACE.CONFIGURATIONS.DEBUG.NAME,
			KIND = KIND_CONSOLE,
			OPTIMIZE = OFF,
			SYMBOLS = ON,
		},
		{
			FILTER_NAME = SETTING_WORKSPACE.CONFIGURATIONS.RELEASE.NAME,
			KIND = KIND_LIBRARY
		}
	}
}

SetUpProject(PROJECT_SETTINGS)