
CC = clang

clox: main.o debug.o memory.o chunk.o value.o
	$(CC) -o clox.exe $^

value.o: src/value.h src/value.c src/memory.h
	$(CC) -c src/value.c

debug.o: src/debug.h src/debug.c src/value.h
	$(CC) -c src/debug.c

memory.o: src/memory.h src/memory.c
	$(CC) -c src/memory.c

main.o: src/main.c src/common.h
	$(CC) -c src/main.c

chunk.o: src/chunk.h src/chunk.h src/common.h src/value.h
	$(CC) -c src/chunk.c
