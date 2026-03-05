OPT = -Og -march=x86-64-v3

CSTD = -std=gnu23
CXXSTD = -std=gnu++23
CFLAGS += -g
CFLAGS += -I./include
CFLAGS += -Wall -Werror -Wfatal-errors -Wno-error=unused-variable -Wno-error=unused-but-set-variable
CFLAGS += $(shell pkg-config --cflags glfw3)

LDFLAGS += -lm
LDFLAGS += $(shell pkg-config --libs glfw3)

all:

%.o: %.c
	$(CC) $(ARCH) $(CSTD) $(CFLAGS) $(OPT) -c $< -o $@

%.o: %.cpp
	$(CXX) $(ARCH) $(CXXSTD) $(CFLAGS) $(OPT) -c $< -o $@

main: src/gl.o src/main.o src/opengl.o
	$(CC) $(ARCH) $(LDFLAGS) $(OPT) -g $^ -o $@

clean:
	find . -type f ! -name "*.*" -delete

.SUFFIXES:
.INTERMEDIATE:
.SECONDARY:
.PHONY: all clean phony

%: RCS/%,v
%: RCS/%
%: %,v
%: s.%
%: SCCS/s.%
