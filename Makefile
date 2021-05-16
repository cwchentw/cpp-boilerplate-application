# Detect system OS.
ifeq ($(OS),Windows_NT)
	detected_OS := Windows
else
	detected_OS := $(shell sh -c 'uname -s 2>/dev/null || echo not')
endif

C_SRCS=$(shell find src -name *.c)
CXX_SRCS=$(shell find src -type f -name *.cc -o -name *.cpp -o -name *.cxx)

CXX_OBJS=$(CXX_SRCS:.cc=.o)
CXX_OBJS_1=$(CXX_OBJS:.cpp=.o)
CXX_OBJS_2=$(CXX_OBJS_1:.cxx=.o)

OBJS=$(C_SRCS:.c=.o)
OBJS+=$(CXX_OBJS_2)

# Use libstdc++ in CC
ifneq (,$(CXX_SRCS))
	LIBCXX=-lstdc++
endif

# Modify the executable name by yourself.
ifeq (,$(PROGRAM))
	PROGRAM=program
endif

ifeq ($(detected_OS),Windows)
	TARGET=$(PROGRAM).exe
else
	TARGET=$(PROGRAM)
endif

# Set the C standard.
ifeq (,$(C_STD))
	C_STD=c11
endif

# Set the C++ standard.
ifeq (,$(CXX_STD))
	CXX_STD=c++17
endif


.PHONY: all clean

all: dist/$(TARGET)

dist/$(TARGET): $(OBJS)
	$(CC) -o dist/$(TARGET) $(OBJS) $(LDFLAGS) $(LIBCXX)

%.o:%.c
	$(CC) -std=$(C_STD) -c $< -o $@ $(CFLAGS) -I include

%.o:%.cc
	$(CXX) -std=$(CXX_STD) -c $< -o $@ $(CXXFLAGS) -I include

%.o:%.cpp
	$(CXX) -std=$(CXX_STD) -c $< -o $@ $(CXXFLAGS) -I include

%.o:%.cxx
	$(CXX) -std=$(CXX_STD) -c $< -o $@ $(CXXFLAGS) -I include

clean:
	$(RM) dist/$(TARGET) $(OBJS)
