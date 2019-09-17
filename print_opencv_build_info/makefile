CC = g++
CFLAGS = -std=c++11 -ggdb
LFLAGS = -lopencv_core
LINK_TARGET = print_cv_info

all:
	$(CC) $(CFLAGS) -o $(LINK_TARGET) main.cpp $(LFLAGS)

run:
	./$(LINK_TARGET)

clean:
	@rm -f $(LINK_TARGET)
