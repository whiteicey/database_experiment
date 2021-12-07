.PHONY: all clean

TARGET	:= main
SRCS	:= exception.cc connector.cc result.cc main.cc
OBJS	:= $(patsubst %.cc,%.o,$(SRCS))

CXXFLAGS	:= -Wall -Wextra -std=c++2a -I/usr/local/opt/mysql-client/include

all: $(TARGET)
$(TARGET): $(OBJS)
	g++ $^ -o $@ -L/usr/lib64/mysql -lmysqlclient -L/usr/local/opt/mysql-client/lib 
# /usr/lib64/mysql/libmysqlclient.so

%.o		: %.cc
	g++ -c $^ -o $@ $(CXXFLAGS)

clean:
	rm *.o main

