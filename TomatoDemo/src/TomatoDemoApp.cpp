#include "TomatoDemoLayer.h"
#include "Random.h"

#include "Tomato/Core/Application.h"
#include "Tomato/Core/EntryPoint.h"

class TomatoDemoApp : public Tomato::Application
{
public:
	TomatoDemoApp()
	{
		Random::Init();
		PushLayer(new TomatoDemoLayer());
	}

};

Tomato::Application* Tomato::CreateApplication()
{
	return new TomatoDemoApp();
}
