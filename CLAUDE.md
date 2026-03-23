# Build Automation POC

This is a simple C library project used to demonstrate AI-assisted build fixing.

## Project structure
- `src/strutil.h` - Header for string utility functions
- `src/strutil.c` - Implementation of string utility functions
- `src/main.c` - Demo program
- `Makefile` - Build configuration

## Build
Run `make` to build. The binary is output to `build/strutil_demo`.

## Your role
You are fixing build failures for this C library. When invoked:
1. Read the build log provided to you
2. Identify the compiler error(s)
3. Edit the source files to fix the errors
4. Only fix what is broken — do not refactor or add features
