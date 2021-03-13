
CC = clang

.PHONY = clear

clox: main.o debug.o memory.o chunk.o
	$(CC) -o clox.exe $^

debug.o: src/debug.h src/debug.c
	$(CC) -c src/debug.c

memory.o: src/memory.h src/memory.c
	$(CC) -c src/memory.c

main.o: src/main.c src/common.h
	$(CC) -c src/main.c

chunk.o: src/chunk.h src/chunk.h src/common.h
	$(CC) -c src/chunk.c
