project "ImPlot"
	kind "StaticLib"
	language "C++"
	staticruntime "on"

  targetdir("bin/%{prj.name}/" .. outputdir )
  objdir("bin-int/%{prj.name}/" .. outputdir )

  IncludeDir["ImPlot"] = os.realpath(".")
  
	files
	{        
		"./**.h",
		"./**.cpp",
	}

    ToInclude = {}
    for k,i in pairs(IncludeDir) do 
        ToInclude[#ToInclude + 1] = i
    end

    includedirs
    {
        ToInclude
    }

    links
    {
        "ImGui",
    }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:MemoryProfile"
	  	runtime "Release"
	  	optimize "on"

	filter "configurations:Development"
		runtime "Release"
		optimize "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
