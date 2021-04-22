# .SUFFIXES: .C .o
CXX := g++
# CXX := clang++
# CXXFLAGS := -O2 -g -Wall -Werror
CXXFLAGS := -g -Wall
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

clean:
	rm -f $(OBJFILES) $(TARGET)
