# Compiler and flags
CC = gcc
CFLAGS = -Wall -g
LDFLAGS =

# Source and object files
SRC = server.c
OBJ = $(SRC:.c=.o)

# Executable name
TARGET = server
BIN_DIR = ./bin

# Default target: compile and link the program
all: $(BIN_DIR)/$(TARGET)

# Rule to create the target executable
$(BIN_DIR)/$(TARGET): $(OBJ)
	@mkdir -p $(BIN_DIR)  # Create the bin directory if it doesn't exist
	$(CC) $(OBJ) -o $(BIN_DIR)/$(TARGET) $(LDFLAGS)

# Rule to compile source files into object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up the build files
clean:
	rm -f $(OBJ) $(BIN_DIR)/$(TARGET)

# Rule to install the program (optional)
install: $(BIN_DIR)/$(TARGET)
	# Optionally, you can install to a system directory or just ensure the binary is in $(BIN_DIR)

# Phony targets
.PHONY: all clean install
