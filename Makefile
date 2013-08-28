#Compiler options
CC = g++
CFLAGS = -Wall -g -c -std=c++0x
LFLAGS = -lsfml-graphics -lsfml-audio -lsfml-window -lsfml-system

#File options
OBJS_DIR = objs
BIN = Epic-Quest

#Source and object files
SRC = $(wildcard *.cpp)

_OBJS = $(SRC:%cpp=%o)
OBJS = $(patsubst %,$(OBJS_DIR)/%,$(_OBJS))

all: $(OBJS_DIR) $(BIN) 

$(OBJS_DIR):
	mkdir $(OBJS_DIR)

$(OBJS_DIR)/%.o: %.cpp
	$(CC) $(CFLAGS) $< -o $@

$(BIN): $(OBJS)
	$(CC) -o $(BIN) $(LFLAGS) $(OBJS)

clean:
	rm $(OBJS) $(BIN)

run:
	rm $(OBJS_DIR)/*.o
