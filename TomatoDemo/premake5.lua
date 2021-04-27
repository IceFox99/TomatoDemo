project "TomatoDemo"
	location "."
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp"
	}

	defines
	{
		"_SILENCE_CXX17_RESULT_OF_DEPRECATION_WARNING"
	}

	includedirs
	{
		"src",
		"../Tomato/Tomato/src",
		"../Tomato/Tomato/vendor/GLFW/include",
		"../Tomato/Tomato/vendor/glm",
		"../Tomato/Tomato/vendor/imgui",
		"../Tomato/Tomato/vendor/spdlog/include"
	}
	
	links {
		"Tomato"
	}

	filter "system:windows"
		systemversion "latest"
		
	filter "configurations:Debug"
		defines "TM_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Profile"
		defines
		{
			"TM_PROFILE",
			"TRACY_ENABLE"
		}
		runtime "Release"
		optimize "on"

	filter "configurations:Release"
		defines "TM_RELEASE"
		runtime "Release"
		optimize "on"
