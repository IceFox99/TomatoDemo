#pragma once

#include "GameObject.h"
#include "Level.h"
#include "ViewPort.h"

#include "Tomato/Core/Layer.h"
#include "Tomato/Events/KeyEvent.h"
#include "Tomato/Renderer/Texture.h"

#include <glm/glm.hpp>

class TomatoDemoLayer : public Tomato::Layer
{
public:
	TomatoDemoLayer();
	virtual ~TomatoDemoLayer() = default;

	virtual void OnAttach() override;
	virtual void OnDetach() override;

	virtual void OnUpdate(Tomato::Timestep ts) override;

#ifdef _DEBUG
	virtual void OnImGuiRender() override;
#endif

	void OnEvent(Tomato::Event& e) override;

private:
	bool OnKeyPressed(Tomato::KeyPressedEvent& e);

	void LoadLevel(int level);

private:
	Tomato::Timestep m_FixedTimestep;
	ViewPort m_ViewPort;
	std::array<Tomato::Ref<Tomato::Texture2D>, (size_t)Tile::NumTiles> m_Tiles;
	glm::vec2 m_TileSize;
	Level m_Level;
	float m_AccumulatedTs;  // would be better as Tomato::Timestep, but that doesnt support operator +=
	int m_CurrentLevel;
	int m_EndLevel;
	bool m_PlayerIsAlive;   // if false, then pressing spacebar restarts.  Otherwise, pressing spacebar pauses
	bool m_GamePaused;
	bool m_WonLevel;
};
