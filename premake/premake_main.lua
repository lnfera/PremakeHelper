include "premake_defines"
include "premake_helper_functions"

-- [ INIT WORKSPACE ]
print("Generating workspace...")
workspace (SETTING_WORKSPACE.NAME)
	location(DIRECTORIES.ROOT)
	architecture(ARCHITECTURE)
	startproject(SETTING_WORKSPACE.STARTUP_PROJECT)

	defines(SETTING_WORKSPACE.DEFINES_GLOBAL)

	configurations (GetConfigNames(SETTING_WORKSPACE.CONFIGURATIONS))
	
	for	_, setting in pairs(SETTING_WORKSPACE.CONFIGURATIONS) do
		filter("configurations:"..setting.NAME)
		defines (setting.DEFINES)
		symbols (setting.SYMBOLS)
		optimize (setting.OPTIMIZE)
	end

	for	systemName, setting in ipairs(SETTING_WORKSPACE.SYSTEMS) do
		filter("system:"..systemName)
			staticruntime (setting.STATICRUNTIME)
			systemversion (setting.SYSTEMVERSION)
			warnings (setting.WARNINGS)
			flags (setting.FLAGS)
			defines (setting.DEFINES)
	end

print("Done generating workspace...")

-- @TODO: make recursive
include "project_defines/premake_foo"
