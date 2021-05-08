
CC = clang

clox: main.o debug.o memory.o chunk.o value.o vm.o compiler.o scanner.o
	$(CC) -o clox.exe $^

compiler.o: src/compiler.c src/compiler.h
	$(CC) -c src/compiler.c

scanner.o: src/scanner.c src/scanner.h
	$(CC) -c src/scanner.c

value.o: src/value.h src/value.c src/memory.h
	$(CC) -c src/value.c

vm.o: src/vm.c src/vm.h
	$(CC) -c src/vm.c

debug.o: src/debug.h src/debug.c src/value.h
	$(CC) -c src/debug.c

memory.o: src/memory.h src/memory.c
	$(CC) -c src/memory.c

main.o: src/main.c src/common.h
	$(CC) -c src/main.c

chunk.o: src/chunk.h src/chunk.h src/common.h src/value.h
	$(CC) -c src/chunk.c
