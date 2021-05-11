#ifndef clox_chunk_h
#define clox_chunk_h

#include "common.h"
#include "value.h"

typedef enum {
  OP_CONSTANT,
  OP_LONG_CONSTANT,
  OP_NIL,
  OP_TRUE,
  OP_FALSE,
  OP_POP,
  OP_GET_GLOBAL,
  OP_DEFINE_GLOBAL,
  OP_SET_GLOBAL,
  OP_EQUAL, // having an OpCode for NOT_EQUAL would be more performant
  OP_GREATER,
  OP_LESS,
  OP_ADD,
  OP_SUBTRACT,
  OP_MULTIPLY,
  OP_DIVIDE,
  OP_NOT,
  OP_NEGATE,
  OP_PRINT,
  OP_RETURN,
} OpCode;

typedef struct {
  int offset;
  int line;
} LineStart;

typedef struct {
  int capacity;
  int count;

  uint8_t *code;
  ValueArray constants;

  int lineCount;
  int lineCapacity;
  LineStart* lines;
} Chunk;

void initChunk(Chunk *chunk);
void freeChunk(Chunk *chunk);
void writeChunk(Chunk *chunk, uint8_t byte, int line);

void writeConstant(Chunk *chunk, Value value, int line);

int addConstant(Chunk *chunk, Value value);
int getLine(Chunk* chunk, int instruction);

#endif
