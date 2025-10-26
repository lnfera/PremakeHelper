function GetConfigNames(table)
	local result = { }
	
	for	_, setting in pairs(table) do
		result[#result + 1] = setting.NAME
	end
	
	return result
end

function SetUpProject(setting)
	
	project (setting.NAME)
		location (DIRECTORIES.LOCAL)
		debugdir "%{DIRECTORIES.BIN}"
		targetdir ("%{DIRECTORIES.BIN}")
		targetname("%{prj.name}_%{cfg.buildcfg}")
		objdir ("%{DIRECTORIES.TEMP}/%{prj.name}/%{cfg.buildcfg}")

		-- LANGUAGE
		kind(setting.KIND)
		language(setting.LANGUAGE)
		cppdialect(DIALECT_CPP)
		-- LINKER
		links(setting.LINKER.LINKS)
		includedirs (setting.LINKER.INCLUDE_DIRS)
		files (setting.LINKER.FILES)
		dependson (setting.LINKER.DEPENDSON)

		if setting.PCH then
			pchheader (setting.PCH..PCH_H_EXTENSION)
            pchsource (setting.PCH..PCH_CPP_EXTENSION)
		end

		for _, config in pairs(setting.CONFIG_FILTER) do

			assert(config.FILTER_NAME, "Forgot to set filter name!")

			filter("configurations:" .. config.FILTER_NAME)
				if config.DEFINES then defines(config.DEFINES) end
				if config.SYMBOLS then symbols(config.SYMBOLS) end
				if config.OPTIMIZE then optimize(config.OPTIMIZE) end
				if config.KIND then kind(config.KIND) end
		end 
end

function GetPremakeLuaFiles()
	local folders = os.matchdirs(DIRECTORIES.SOURCE.."**")
	local premakeFiles = {}

	local itr = 0
	print("Folders found:")
	for _, folderName in ipairs(folders) do

		print(folderName)
		local files = os.matchfiles(folderName.."/premake**.lua")

		for i, file in ipairs(files) do
			table.insert(premakeFiles, file)
		end
	end 

	print("Premake helper files found:")
	for p, fileName in ipairs(premakeFiles) do
		print(fileName)
	end

	return premakeFiles	
end