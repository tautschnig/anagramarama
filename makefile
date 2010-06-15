CC=gcc
LD=gcc
CFLAGS=-g -Wall `sdl-config --cflags`
CFLAG_OPTS=-funroll-loops -fomit-frame-pointer
LDFLAGS=`sdl-config --libs` -lSDL_mixer

C_FILES=src/dlb.c src/linked.c src/sprite.c src/ag.c
OBJ_FILES=src/dlb.o src/linked.o src/sprite.o src/ag.o
TEST_OBJS=$(OBJ_FILES:src/ag.o=src/ag_test.o)
OUT_FILE=ag

all:ag

ag: $(OBJ_FILES)
	$(LD) $(LDFLAGS) -o $@ $^

ag_test: $(TEST_OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

src/dlb.o: src/dlb.c
	$(CC) $(CFLAGS) -c -o $@ $^

src/linked.o: src/linked.c
	$(CC) $(CFLAGS) -c -o $@ $^

src/sprite.o: src/sprite.c
	$(CC) $(CFLAGS) -c -o $@ $^

src/ag.o: src/ag.c
	$(CC) $(CFLAGS) -c -o $@ $^

clean:
	rm -f src/*.o
