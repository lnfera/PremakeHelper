-- [ Project Kind ]
KIND_LIBRARY = "StaticLib"
KIND_CONSOLE = "ConsoleApp"
KIND_WINDOWED = "WindowedApp"

ON = "on"
OFF = "off"

-- [ LANGUAGE DEFINES ]
LANGUAGE_CPP = "C++"
LANGUAGE_CS = "C#"

-- [ DIALECT DEFINES ]
DIALECT_CPP = "C++20"

-- [ ARCHITECTURE ]
ARCHITECTURE = "x64"

-- [ FILEPATHS ]
DIRECTORIES 				= {}
DIRECTORIES["ROOT"] 		= os.realpath("../")
DIRECTORIES["BIN"] 			= DIRECTORIES.ROOT.."bin/"
DIRECTORIES["TEMP"] 		= DIRECTORIES.ROOT.."temp/"
DIRECTORIES["LOCAL"] 		= DIRECTORIES.ROOT.."local/"
DIRECTORIES["SOURCE"] 		= DIRECTORIES.ROOT.."src/"

-- [ WORKSPACE CONFIG ]
SETTING_WORKSPACE = {
	NAME = "Workspace",
	STARTUP_PROJECT = "EXAMPLE",

	CONFIGURATIONS = {
		DEBUG = {
			NAME = "Debug",
			DEFINES = {"_DEBUG"},
			SYMBOLS = "on",
			OPTIMIZE = "off"
		},
		RELEASE = {
			NAME = "Release",
			DEFINES = {"_RELEASE"},
			SYMBOLS = "off",
			OPTIMIZE = "off"
		},
	},

	DEFINES_GLOBAL = { },

	SYSTEMS = {
		WINDOWS = {
			STATICRUNTIME = "off",
			SYSTEMVERSION =  "latest",
			WARNINGS = "extra",
			FLAGS = { "MultiProcessorCompile" },
			DEFINES = {}
		}
	}
}

PCH_H_EXTENSION = ".hpp"
PCH_CPP_EXTENSION = ".cpp"