#include "Engine.h"
#include "iostream"

int main()
{
	// Declare an instance of Engine
	Engine engine;

	// Start the engine
	engine.run();
	std::cout << "Hi engine" << std::endl;


	// Quit in the usual way when the engine is stopped
	return 0;
}