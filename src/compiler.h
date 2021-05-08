#ifndef clox_compiler_H
#define clox_compiler_H

#include "vm.h"

bool compile(const char *source, Chunk *chunk);

#endif
