CC = gcc
CFLAGS = -Wall -Werror -std=c11
SRC_DIR = src
BUILD_DIR = build

SRCS = $(SRC_DIR)/strutil.c $(SRC_DIR)/main.c
TARGET = $(BUILD_DIR)/strutil_demo

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRCS)
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -rf $(BUILD_DIR)
