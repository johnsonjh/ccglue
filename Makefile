# .SUFFIXES: .C .o
CXX := g++
STRIP := strip
# CXX := clang++
CXXFLAGS := -g -Wall
# CXXFLAGS := -O2 -g -Wall -Werror
INCLUDES := -I include
# CC       = gcc
# CFLAGS   = -Wall
# LDFLAGS  = 
TARGET   = ccglue

# OJBFILEES = OBJECTS
SOURCEDIR = ./src
SRCFILE = $(wildcard $(SOURCEDIR)/*.cpp)

all: $(TARGET)

$(TARGET): $(SRCFILE)
	$(CXX) $(INCLUDES) $(CXXFLAGS)  -o $(TARGET) $(SRCFILE)
	$(STRIP) --strip-unneeded $(TARGET)

clean:
	rm -f $(TARGET)
