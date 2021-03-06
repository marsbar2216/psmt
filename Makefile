CFLAGS= -Wall -Wextra 


all: send receive tests

psmt.o: psmt.c psmt.h
	gcc $(CFLAGS) -c psmt.c

send: send.c psmt.o naive_poly.o
	gcc $(CFLAGS) -c send.c
	gcc $(CFLAGS) send.o psmt.o naive_poly.o -o send

receive: receive.c psmt.o naive_poly.o
	gcc $(CFLAGS) -c receive.c
	gcc $(CFLAGS) receive.o psmt.o naive_poly.o -o receive
tests: tests.c debug.o psmt.o naive_poly.o
	gcc $(CFLAGS) -c tests.c
	gcc $(CFLAGS) tests.o psmt.o naive_poly.o debug.o -o tests

debug.o: debug.c debug.h
	gcc $(CFLAGS) -c debug.c

naive_poly.o: naive_poly.c poly.h
	gcc $(CFLAGS) -c naive_poly.c

clean:
	rm *.o 
	rm send 
	rm receive
	rm pipes/*

