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
			pchheader (setting.PCH..".hpp")
            pchsource (setting.PCH..".cpp")
		end


		for name, config in pairs(setting.CONFIG_FILTER) do
			filter("configurations:" .. configName)
				if setting.DEFINES then defines(setting.DEFINES) end
				if setting.SYMBOLS then symbols(setting.SYMBOLS) end
				if setting.OPTIMIZE then optimize(setting.OPTIMIZE) end
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