# .SUFFIXES: .C .o
# CXX := g++
CXX := clang++
STRIP := strip
CXXFLAGS := -std=c++11  -Wno-deprecated-declarations 
INCLUDES := -I include
# CC       = gcc
# CFLAGS   = -Wall
# LDFLAGS  = 
TARGET   = ccglue

ifndef MODE
	# $(warning MODE not defined)
	MODE = release
endif
$(info Compile Mode: $(MODE))

ifeq ($(MODE), release)
	CXXFLAGS += -O3 -Wl,--gc-sections
else
	CXXFLAGS += -g
endif


# OJBFILEES = OBJECTS
SOURCEDIR = ./src
SRCFILE = $(wildcard $(SOURCEDIR)/*.cpp)

all: $(TARGET)

$(TARGET): $(SRCFILE)
	$(CXX) $(INCLUDES) $(CXXFLAGS)  -o $(TARGET) $(SRCFILE)
ifeq ($(MODE), release)
	$(STRIP) --strip-unneeded $(TARGET)
endif

clean:
	rm -f $(TARGET)
