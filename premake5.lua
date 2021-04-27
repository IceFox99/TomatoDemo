workspace "TomatoDemo"
	location ("Build/" .. _ACTION)
	architecture "x86_64"
	
	startproject "TomatoDemo"

	configurations
	{
		"Debug",
		"Profile",
		"Release"
	}

	flags
	{
		"MultiProcessorCompile"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

group "Dependencies"
	include "Tomato/Tomato"
	include "Tomato/Tomato/vendor/GLFW"
	include "Tomato/Tomato/vendor/Glad"
	include "Tomato/Tomato/vendor/imgui"	

group ""
	include "TomatoDemo"
