/*
  ClockTHREE Test6 Text
  scroll some text

  Justin Shaw Dec 9, 2010
  
  Licenced under Creative Commons Attribution.
  Attribution 3.0
 */

#include "ClockTHREE.h"
#include "SPI.h"
#include <avr/pgmspace.h>

ClockTHREE c3 = ClockTHREE();
uint32_t *display = (uint32_t*)calloc(N_COL, sizeof(uint32_t));
const uint8_t N_CHAR = 128;
prog_char my_font8x8[N_CHAR * 8] PROGMEM  = {
0b00000000, //  
0b00000000, //  
0b00000000, //  
0b00000000, //  
0b00000000, //  
0b00000000, //  
0b00000000, //  
0b00000000, //  

0b01111100, // 
0b10000010, // 
0b10101010, // 
0b11000010, // 
0b10101010, // 
0b10000010, // 
0b01111100, // 
0b00000000, // 

0b01111100, // 
0b11111110, // 
0b11010110, // 
0b10111010, // 
0b11010110, // 
0b11111110, // 
0b01111100, // 
0b00000000, // 

0b00011100, // 
0b00111110, // 
0b01111100, // 
0b11111000, // 
0b01111100, // 
0b00111110, // 
0b00011100, // 
0b00000000, // 

0b00010000, // 
0b00111000, // 
0b01111100, // 
0b11111110, // 
0b01111100, // 
0b00111000, // 
0b00010000, // 
0b00000000, // 

0b00010000, // 
0b00111000, // 
0b10010100, // 
0b11111110, // 
0b10010100, // 
0b00111000, // 
0b00010000, // 
0b00000000, // 

0b00010000, // 
0b00111000, // 
0b10111100, // 
0b11111110, // 
0b10111100, // 
0b00111000, // 
0b00010000, // 
0b00000000, // 

0b00000000, // 
0b00111000, // 
0b01111100, // 
0b01111100, // 
0b01111100, // 
0b00111000, // 
0b00000000, // 
0b00000000, // 

0b11111111, //
0b11000111, //
0b10000011, //
0b10010011, //
0b10000011, //
0b11000111, //
0b11111111, //
0b00000000, //

0b00000000, //
0b00111000, //
0b01000100, //
0b01000100, //
0b01000100, //
0b00111000, //
0b00000000, //
0b00000000, //

0b11111111, //
0b11000111, //
0b10111011, //
0b10111011, //
0b10111011, //
0b11000111, //
0b11111111, //
0b00000000, //

0b01100000, //
0b10010000, //
0b10010000, //
0b01110010, //
0b00001010, //
0b00000110, //
0b00011110, //
0b00000000, //

0b00000000, //
0b01100100, //
0b10010100, //
0b10011110, //
0b10010100, //
0b01100100, //
0b00000000, //
0b00000000, //

0b11000000, //
0b11100000, //
0b01111110, //
0b00000010, //
0b00000100, //
0b00000000, //
0b00000000, //
0b00000000, //

0b11000000, // 
0b11100000, // 
0b01111100, // 
0b00000110, // 
0b01100010, // 
0b01110010, // 
0b00111110, // 
0b00000000, // 

0b00010000, // 
0b01010100, // 
0b00111000, // 
0b11101110, // 
0b00111000, // 
0b01010100, // 
0b00010000, // 
0b00000000, // 

0b11111110, // 
0b11111110, // 
0b01111100, // 
0b01111100, // 
0b00111000, // 
0b00111000, // 
0b00010000, // 
0b00000000, // 

0b00010000, // 
0b00111000, // 
0b00111000, // 
0b01111100, // 
0b01111100, // 
0b11111110, // 
0b11111110, // 
0b00000000, // 

0b00000000, // 
0b00101000, // 
0b01000100, // 
0b11111110, // 
0b01010100, // 
0b00101000, // 
0b00000000, // 
0b00000000, // 

0b11011110, // 
0b11011110, // 
0b00000000, // 
0b00000000, // 
0b11011110, // 
0b11011110, // 
0b00000000, // 
0b00000000, // 

0b00001100, // 
0b00011110, // 
0b00010010, // 
0b00010010, // 
0b11111110, // 
0b00000010, // 
0b11111110, // 
0b00000000, // 

0b01001000, // 
0b10010100, // 
0b10100100, // 
0b01001010, // 
0b01010010, // 
0b00100100, // 
0b00000000, // 
0b00000000, // 

0b11100000, // 
0b11100000, // 
0b11100000, // 
0b11100000, // 
0b11100000, // 
0b11100000, // 
0b11100000, // 
0b00000000, // 

0b00000000, // 
0b10101000, // 
0b11000100, // 
0b11111110, // 
0b11000100, // 
0b10101000, // 
0b00000000, // 
0b00000000, // 

0b00010000, // 
0b00011000, // 
0b11111100, // 
0b11111110, // 
0b11111100, // 
0b00011000, // 
0b00011000, // 
0b00000000, // 

0b00010000, // 
0b00110000, // 
0b01111110, // 
0b11111110, // 
0b01111110, // 
0b00110000, // 
0b00010000, // 
0b00000000, // 

0b00111000, // 
0b00111000, // 
0b00111000, // 
0b11111110, // 
0b01111100, // 
0b00111000, // 
0b00010000, // 
0b00000000, // 

0b00011000, // 
0b00111000, // 
0b01111100, // 
0b11111110, // 
0b00111000, // 
0b00111000, // 
0b00111000, // 
0b00000000, // 

0b11111000, // 
0b11111000, // 
0b11111000, // 
0b11000000, // 
0b11000000, // 
0b11000000, // 
0b11000000, // 
0b00000000, // 

0b00010000, // 
0b00111000, // 
0b01010100, // 
0b00010000, // 
0b01010100, // 
0b00111000, // 
0b00010000, // 
0b00000000, // 

0b11000000, // 
0b11110000, // 
0b11111100, // 
0b11111110, // 
0b11111100, // 
0b11110000, // 
0b11000000, // 
0b00000000, // 

0b00000110, // 
0b00011110, // 
0b01111110, // 
0b11111110, // 
0b01111110, // 
0b00011110, // 
0b00000110, // 
0b00000000, // 

0b00000000, //
0b00000000, //
0b00000000, //
0b00000000, //
0b00000000, //
0b00000000, //
0b00000000, //
0b00000000, //

0b00000000, // !
0b00001100, // !
0b10111110, // !
0b10111110, // !
0b00001100, // !
0b00000000, // !
0b00000000, // !
0b00000000, // !

0b00000000, // "
0b00000110, // "
0b00001110, // "
0b00000000, // "
0b00001110, // "
0b00000110, // "
0b00000000, // "
0b00000000, // "

0b00101000, // #
0b11111110, // #
0b11111110, // #
0b00101000, // #
0b11111110, // #
0b11111110, // #
0b00101000, // #
0b00000000, // #

0b00000000, // $
0b01001000, // $
0b01010100, // $
0b11010110, // $
0b01010100, // $
0b00100100, // $
0b00000000, // $
0b00000000, // $

0b01000110, // %
0b01100110, // %
0b00110000, // %
0b00011000, // %
0b11001100, // %
0b11000100, // %
0b00000000, // %
0b00000000, // %

0b01100100, // &
0b11111110, // &
0b10001010, // &
0b10011010, // &
0b11101110, // &
0b11000100, // &
0b10100000, // &
0b00000000, // &

0b00000000, // '
0b00010000, // '
0b00011110, // '
0b00001110, // '
0b00000000, // '
0b00000000, // '
0b00000000, // '
0b00000000, // '

0b10000010, // (
0b11000110, // (
0b01111100, // (
0b00111000, // (
0b00000000, // (
0b00000000, // (
0b00000000, // (
0b00000000, // (

0b00000000, // )
0b00000000, // )
0b00111000, // )
0b01111100, // )
0b11000110, // )
0b10000010, // )
0b00000000, // )
0b00000000, // )

0b00010000, // *
0b01010100, // *
0b01111100, // *
0b00111000, // *
0b01111100, // *
0b01010100, // *
0b00010000, // *
0b00000000, // *

0b00000000, // +
0b00010000, // +
0b00010000, // +
0b01111100, // +
0b00010000, // +
0b00010000, // +
0b00000000, // +
0b00000000, // +

0b10000000, // ,
0b11110000, // ,
0b01110000, // ,
0b00000000, // ,
0b00000000, // ,
0b00000000, // ,
0b00000000, // ,
0b00000000, // ,

0b00000000, // -
0b00010000, // -
0b00010000, // -
0b00010000, // -
0b00010000, // -
0b00000000, // -
0b00000000, // -
0b00000000, // -

0b11000000, // .
0b11000000, // .
0b00000000, // .
0b00000000, // .
0b00000000, // .
0b00000000, // .
0b00000000, // .
0b00000000, // .

0b01000000, // /
0b01100000, // /
0b00110000, // /
0b00011000, // /
0b00001100, // /
0b00000100, // /
0b00000000, // /
0b00000000, // /

0b01111100, // 0
0b11111110, // 0
0b10010010, // 0
0b10001010, // 0
0b11111110, // 0
0b01111100, // 0
0b00000000, // 0
0b00000000, // 0

0b10000000, // 1
0b10001000, // 1
0b11111110, // 1
0b11111111, // 1
0b10000000, // 1
0b10000000, // 1
0b00000000, // 1
0b00000000, // 1

0b11000100, // 2
0b11100110, // 2
0b10100010, // 2
0b10010010, // 2
0b10011110, // 2
0b10001100, // 2
0b00000000, // 2
0b00000000, // 2

0b01000100, // 3
0b11000110, // 3
0b10010010, // 3
0b10010010, // 3
0b11111110, // 3
0b01101100, // 3
0b00000000, // 3
0b00000000, // 3

0b00110000, // 4
0b00101000, // 4
0b00100100, // 4
0b11111110, // 4
0b11111110, // 4
0b00100000, // 4
0b00000000, // 4
0b00000000, // 4

0b01001110, // 5
0b11001110, // 5
0b10001010, // 5
0b10001010, // 5
0b11111010, // 5
0b01110010, // 5
0b00000000, // 5
0b00000000, // 5

0b01111100, // 6
0b11111110, // 6
0b10010010, // 6
0b10010010, // 6
0b11110110, // 6
0b01100100, // 6
0b00000000, // 6
0b00000000, // 6

0b00000110, // 7
0b00000110, // 7
0b11100010, // 7
0b11111010, // 7
0b00011110, // 7
0b00000110, // 7
0b00000000, // 7
0b00000000, // 7

0b01101100, // 8
0b11111110, // 8
0b10010010, // 8
0b10010010, // 8
0b11111110, // 8
0b01101100, // 8
0b00000000, // 8
0b00000000, // 8

0b01001100, // 9
0b11011110, // 9
0b10010010, // 9
0b10010010, // 9
0b11111110, // 9
0b01111100, // 9
0b00000000, // 9
0b00000000, // 9

0b00000000, // :
0b00000000, // :
0b01101100, // :
0b01101100, // :
0b00000000, // :
0b00000000, // :
0b00000000, // :
0b00000000, // :

0b00000000, // ;
0b10000000, // ;
0b11101100, // ;
0b01101100, // ;
0b00000000, // ;
0b00000000, // ;
0b00000000, // ;
0b00000000, // ;

0b00000000, // <
0b00010000, // <
0b00111000, // <
0b01101100, // <
0b11000110, // <
0b10000010, // <
0b00000000, // <
0b00000000, // <

0b00000000, // =
0b00101000, // =
0b00101000, // =
0b00101000, // =
0b00101000, // =
0b00000000, // =
0b00000000, // =
0b00000000, // =

0b10000010, // >
0b11000110, // >
0b01101100, // >
0b00111000, // >
0b00010000, // >
0b00000000, // >
0b00000000, // >
0b00000000, // >

0b00000100, // ?
0b00000110, // ?
0b10110010, // ?
0b10110010, // ?
0b00011110, // ?
0b00001100, // ?
0b00000000, // ?
0b00000000, // ?

0b00111100, // @
0b01000010, // @
0b01011010, // @
0b01011010, // @
0b01001100, // @
0b00100000, // @
0b00000000, // @
0b00000000, // @

0b11111100, // A
0b11111110, // A
0b00010010, // A
0b00010010, // A
0b11111110, // A
0b11111100, // A
0b00000000, // A
0b00000000, // A

0b11111110, // B
0b11111110, // B
0b10010010, // B
0b10010010, // B
0b11111110, // B
0b01101100, // B
0b00000000, // B
0b00000000, // B

0b01111100, // C
0b11111110, // C
0b10000010, // C
0b10000010, // C
0b11000110, // C
0b01000100, // C
0b00000000, // C
0b00000000, // C

0b11111110, // D
0b11111110, // D
0b10000010, // D
0b10000010, // D
0b11111110, // D
0b01111100, // D
0b00000000, // D
0b00000000, // D

0b11111110, // E
0b11111110, // E
0b10010010, // E
0b10010010, // E
0b10010010, // E
0b10000010, // E
0b00000000, // E
0b00000000, // E

0b11111110, // F
0b11111110, // F
0b00010010, // F
0b00010010, // F
0b00010010, // F
0b00000010, // F
0b00000000, // F
0b00000000, // F

0b01111100, // G
0b11111110, // G
0b10000010, // G
0b10100010, // G
0b11100110, // G
0b01100100, // G
0b00000000, // G
0b00000000, // G

0b11111110, // H
0b11111110, // H
0b00010000, // H
0b00010000, // H
0b11111110, // H
0b11111110, // H
0b00000000, // H
0b00000000, // H

0b00000000, // I
0b10000010, // I
0b11111110, // I
0b11111110, // I
0b10000010, // I
0b00000000, // I
0b00000000, // I
0b00000000, // I

0b01100000, // J
0b11100000, // J
0b10000010, // J
0b11111110, // J
0b01111110, // J
0b00000010, // J
0b00000000, // J
0b00000000, // J

0b11111110, // K
0b11111110, // K
0b00111000, // K
0b01101100, // K
0b11000110, // K
0b10000010, // K
0b00000000, // K
0b00000000, // K

0b11111110, // L
0b11111110, // L
0b10000000, // L
0b10000000, // L
0b10000000, // L
0b10000000, // L
0b00000000, // L
0b00000000, // L

0b11111110, // M
0b11111110, // M
0b00001100, // M
0b00011000, // M
0b00001100, // M
0b11111110, // M
0b11111110, // M
0b00000000, // M

0b11111110, // N
0b11111110, // N
0b00001100, // N
0b00011000, // N
0b00110000, // N
0b11111110, // N
0b11111110, // N
0b00000000, // N

0b01111100, // O
0b11111110, // O
0b10000010, // O
0b10000010, // O
0b11111110, // O
0b01111100, // O
0b00000000, // O
0b00000000, // O

0b11111110, // P
0b11111110, // P
0b00100010, // P
0b00100010, // P
0b00111110, // P
0b00011100, // P
0b00000000, // P
0b00000000, // P

0b00111100, // Q
0b01111110, // Q
0b01000010, // Q
0b01100010, // Q
0b11111110, // Q
0b10111100, // Q
0b00000000, // Q
0b00000000, // Q

0b11111110, // R
0b11111110, // R
0b00110010, // R
0b01110010, // R
0b11011110, // R
0b11001100, // R
0b00000000, // R
0b00000000, // R

0b01001100, // S
0b11011110, // S
0b10010010, // S
0b10010010, // S
0b11110110, // S
0b01100100, // S
0b00000000, // S
0b00000000, // S

0b00000110, // T
0b00000010, // T
0b11111110, // T
0b11111110, // T
0b00000010, // T
0b00000110, // T
0b00000000, // T
0b00000000, // T

0b01111110, // U
0b11111110, // U
0b10000000, // U
0b10000000, // U
0b11111110, // U
0b11111110, // U
0b00000000, // U
0b00000000, // U

0b00111110, // V
0b01111110, // V
0b11000000, // V
0b11000000, // V
0b01111110, // V
0b00111110, // V
0b00000000, // V
0b00000000, // V

0b11111110, // W
0b11111110, // W
0b01100000, // W
0b00110000, // W
0b01100000, // W
0b11111110, // W
0b11111110, // W
0b00000000, // W

0b11000110, // X
0b11101110, // X
0b00111000, // X
0b00010000, // X
0b00111000, // X
0b11111110, // X
0b11000110, // X
0b00000000, // X

0b00001110, // Y
0b00011110, // Y
0b11110000, // Y
0b11110000, // Y
0b00011110, // Y
0b00001110, // Y
0b00000000, // Y
0b00000000, // Y

0b11000010, // Z
0b11100010, // Z
0b10110010, // Z
0b10011010, // Z
0b10001110, // Z
0b10000110, // Z
0b00000000, // Z
0b00000000, // Z

0b00000000, // [
0b00000000, // [
0b11111110, // [
0b11111110, // [
0b10000010, // [
0b10000010, // [
0b00000000, // [
0b00000000, // [

0b00000100, // \
0b00001100, // \
0b00011000, // \
0b00110000, // \
0b01100000, // \
0b11000000, // \
0b00000000, // \
0b00000000, // \

0b10000010, // ]
0b10000010, // ]
0b11111110, // ]
0b11111110, // ]
0b00000000, // ]
0b00000000, // ]
0b00000000, // ]
0b00000000, // ]

0b00010000, // ^
0b00001000, // ^
0b00000100, // ^
0b00000010, // ^
0b00000100, // ^
0b00001000, // ^
0b00110000, // ^
0b00000000, // ^

0b10000000, // _
0b10000000, // _
0b10000000, // _
0b10000000, // _
0b10000000, // _
0b10000000, // _
0b10000000, // _
0b00000000, // _

0b00000000, // `
0b00000000, // `
0b00000000, // `
0b00000110, // `
0b00001110, // `
0b00001000, // `
0b00000000, // `
0b00000000, // `

0b01000000, // a
0b11101000, // a
0b10101000, // a
0b10101000, // a
0b11111000, // a
0b11110000, // a
0b00000000, // a
0b00000000, // a

0b11111110, // b
0b11111110, // b
0b10010000, // b
0b10010000, // b
0b11110000, // b
0b01100000, // b
0b00000000, // b
0b00000000, // b

0b01110000, // c
0b11111000, // c
0b10001000, // c
0b10001000, // c
0b11011000, // c
0b01010000, // c
0b00000000, // c
0b00000000, // c

0b01100000, // d
0b11110000, // d
0b10010000, // d
0b10010000, // d
0b11111110, // d
0b11111110, // d
0b00000000, // d
0b00000000, // d

0b01110000, // e
0b11111000, // e
0b10101000, // e
0b10101000, // e
0b10111000, // e
0b00110000, // e
0b00000000, // e
0b00000000, // e

0b00100000, // f
0b11111100, // f
0b11111110, // f
0b00100010, // f
0b00100110, // f
0b00000100, // f
0b00000000, // f
0b00000000, // f

0b00011000, // g
0b10111100, // g
0b10100100, // g
0b10100100, // g
0b11111100, // g
0b01111100, // g
0b00000000, // g
0b00000000, // g

0b11111110, // h
0b11111110, // h
0b00010000, // h
0b00010000, // h
0b11110000, // h
0b11100000, // h
0b00000000, // h
0b00000000, // h

0b00000000, // i
0b10000000, // i
0b11110100, // i
0b11110100, // i
0b10000000, // i
0b00000000, // i
0b00000000, // i
0b00000000, // i

0b01100000, // j
0b11100000, // j
0b10000000, // j
0b11111010, // j
0b01111010, // j
0b00000000, // j
0b00000000, // j
0b00000000, // j

0b11111110, // k
0b11111110, // k
0b00100000, // k
0b01110000, // k
0b11011000, // k
0b10001000, // k
0b00000000, // k
0b00000000, // k

0b00000000, // l
0b00000000, // l
0b11111110, // l
0b11111110, // l
0b00000000, // l
0b00000000, // l
0b00000000, // l
0b00000000, // l

0b11111000, // m
0b11111000, // m
0b00110000, // m
0b11100000, // m
0b00110000, // m
0b11111000, // m
0b11111000, // m
0b00000000, // m

0b11111000, // n
0b11111000, // n
0b00011000, // n
0b00011000, // n
0b11111000, // n
0b11110000, // n
0b00000000, // n
0b00000000, // n

0b01110000, // o
0b11111000, // o
0b10001000, // o
0b10001000, // o
0b11111000, // o
0b01110000, // o
0b00000000, // o
0b00000000, // o

0b11111100, // p
0b11111100, // p
0b00100100, // p
0b00100100, // p
0b00111100, // p
0b00011000, // p
0b00000000, // p
0b00000000, // p

0b00011000, // q
0b00111100, // q
0b00100100, // q
0b11111100, // q
0b11111100, // q
0b10000000, // q
0b11000000, // q
0b00000000, // q

0b11111000, // r
0b11111000, // r
0b00001000, // r
0b00001000, // r
0b00111000, // r
0b00110000, // r
0b00000000, // r
0b00000000, // r

0b10010000, // s
0b10101000, // s
0b10101000, // s
0b10101000, // s
0b10101000, // s
0b01001000, // s
0b00000000, // s
0b00000000, // s

0b00010000, // t
0b10010000, // t
0b11111100, // t
0b11111100, // t
0b10010000, // t
0b00010000, // t
0b00000000, // t
0b00000000, // t

0b01111000, // u
0b11111000, // u
0b10000000, // u
0b10000000, // u
0b11111000, // u
0b11111000, // u
0b00000000, // u
0b00000000, // u

0b00110000, // v
0b01110000, // v
0b11000000, // v
0b11000000, // v
0b01110000, // v
0b00110000, // v
0b00000000, // v
0b00000000, // v

0b01111000, // w
0b11111000, // w
0b10000000, // w
0b11110000, // w
0b10000000, // w
0b11111000, // w
0b01111000, // w
0b00000000, // w

0b10001000, // x
0b11011000, // x
0b01110000, // x
0b01110000, // x
0b11011000, // x
0b10001000, // x
0b00000000, // x
0b00000000, // x

0b00011000, // y
0b10111000, // y
0b10100000, // y
0b10100000, // y
0b11111000, // y
0b01111000, // y
0b00000000, // y
0b00000000, // y

0b00000000, // z
0b11001000, // z
0b11101000, // z
0b10111000, // z
0b10011000, // z
0b00000000, // z
0b00000000, // z
0b00000000, // z

0b00000000, // {
0b00010000, // {
0b01111100, // {
0b11101110, // {
0b10000110, // {
0b10000010, // {
0b00000000, // {
0b00000000, // {

0b00000000, // |
0b00000000, // |
0b11101110, // |
0b11101110, // |
0b00000000, // |
0b00000000, // |
0b00000000, // |
0b00000000, // |

0b10000010, // }
0b10000010, // }
0b11101110, // }
0b01111100, // }
0b00010000, // }
0b00000000, // }
0b00000000, // }
0b00000000, // }

0b00010000, // ~
0b00011000, // ~
0b00001000, // ~
0b00011000, // ~
0b00010000, // ~
0b00001000, // ~
0b00000000, // ~
0b00000000, // ~

0b11110000, // 
0b10011000, // 
0b10001100, // 
0b10000110, // 
0b10001100, // 
0b10011000, // 
0b11110000, // 
0b00000000, // 
};

void setup(){
  c3.init();
  c3.setdisplay(display);
}

uint32_t count = 0;
uint8_t color_i = 0;
const int hold = 300;
int myx = 0;
void loop(){
  uint8_t c;
  if(count % hold == 0){
    // display = font8x8 + count / hold;
    myx++;
    for(int i = 0; i < 16; i++){
      display[i] = 0;
      c = pgm_read_byte(my_font8x8 + (myx + i) % (8*N_CHAR));
      for(int k = 0; k < 8; k++){
	if(c & (1 << k)){
	  display[i] |= (uint32_t)0b110 << (3 * k + 0);
	}
      }
    }
  }
  count++;
  c3.refresh();
}
