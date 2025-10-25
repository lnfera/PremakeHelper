include "premake_defines"
include "premake_helper_funtions"

--=============================================================
-- SETTING_PROJECT : Defines all project-level Premake settings
--=============================================================
local SETTING_PROJECT
	-- Project Name
	NAME = "PROJECT_NAME",

	-- Build Settings
	KIND = KIND_CONSOLE,		-- ConsoleApp / StaticLib / SharedLib
	LANGUAGE = LANGUAGE_CPP,	-- C / C++
	PCH = nil,			 		-- Precompiled header (optional) (No file extension) Example: pch_math

	-- Linker Settings
	LINKER = {
		DEPENDSON = {  }, 		-- Other projects to build first
		INCLUDE_DIRS = { },		-- Header search paths
		LINKS = { },			-- Libraries to link.
		FILES = { }, 			-- File extensions and extra linker input files. Example: DIRECTORIES[SOURCE].."folder/**.hpp", DIRECTORIES[SOURCE].."folder/**.cpp"
	},

	-- Config Filters from SETTING_WORKSPACE.CONFIGURATIONS.*
	-- Example:
	-- SETTING_WORKSPACE.CONFIGURATIONS.DEBUG.NAME = {
	-- SYMBOLS = ON / OFF,
	-- OPTIMIZE = ON / OFF,
	-- KIND = KIND_CONSOLE / KIND_LIBRARY / KIND_WINDOWED
	--}
	CONFIG_FILTER = {
		SETTING_WORKSPACE.CONFIGURATIONS.DEBUG.NAME = {
		},
		SETTING_WORKSPACE.CONFIGURATIONS.RELEASE.NAME = {
		},
	}


SetUpProject(CONFIG_PROJECT)