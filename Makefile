# Compiler settings
CXX := g++
CXX_FLAGS := -Wall -Wextra -std=c++17 

# Directories
BIN := bin
SRC := src
INCLUDE := C:\SFML\SFML_VSC\SFML-2.6.0/include
LIB := C:\SFML\SFML_VSC\SFML-2.6.0/lib

# STATICALLY COMPILATION FLAGS
SFML_FLAGS:= SFML_STATIC  

# SFML static libraries (STATICALLY COMPILATION)
SFML_STATIC_LIBRARIES := -L$(LIB) -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lopengl32 -lfreetype -lwinmm -lgdi32 -mwindows

# Source files
SRCS := $(wildcard $(SRC)/*.cpp)

# Object files
OBJS := $(patsubst $(SRC)/%.cpp,$(BIN)/%.o,$(SRCS))

# Executable name
EXECUTABLE := app.exe

all: compile link run

run:
	cmd /c "$(BIN)\$(EXECUTABLE)"

compile:
	
	$(CXX) $(CXX_FLAGS) -I$(INCLUDE) -c $(SRC)/Main.cpp -o $(BIN)/Main.o -D$(SFML_FLAGS)
	$(CXX) $(CXX_FLAGS) -I$(INCLUDE) -c $(SRC)/Engine.cpp -o $(BIN)/Engine.o -D$(SFML_FLAGS)
	$(CXX) $(CXX_FLAGS) -I$(INCLUDE) -c $(SRC)/Update.cpp -o $(BIN)/Update.o -D$(SFML_FLAGS)
	$(CXX) $(CXX_FLAGS) -I$(INCLUDE) -c $(SRC)/Input.cpp -o $(BIN)/Input.o -D$(SFML_FLAGS)
	$(CXX) $(CXX_FLAGS) -I$(INCLUDE) -c $(SRC)/Draw.cpp -o $(BIN)/Draw.o -D$(SFML_FLAGS)
	$(CXX) $(CXX_FLAGS) -I$(INCLUDE) -c $(SRC)/TextureHolder.cpp -o $(BIN)/TextureHolder.o -D$(SFML_FLAGS)

link: $(OBJS)
	$(CXX) $(CXX_FLAGS) -o $(BIN)/$(EXECUTABLE) $^ $(SFML_STATIC_LIBRARIES)

clean:
	del /Q $(BIN)\*.*