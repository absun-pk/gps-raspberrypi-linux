CC		:=	gcc
CFLAGS	:=	-Wall -Wextra -pendantic -std=c99 -g -fdata-sections -ffunction-sections
LIBS	:=	-L/usr/local/lib/ -lm 
INC		:=	-Iinc

RM     := rm -f

.PHONY: all clean

# making gps lib
gps: gps.o serial.o nmea.o
	ar rcs libgps.a gps.o serial.o nmea.o

gps.o: gps.h gps.c
	gcc gps.h gps.c -c $<

serial.o: serial.h serial.c
	gcc serial.h serial.c -c $<

nmea.o: nmea.h nmea.c
	gcc nmea.h nmea.c -c $<

clean:
	$(RM) *.o *.g?? 