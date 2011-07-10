/*
  I2SD.cpp -- I2C <--> SD interface.

  Justin Shaw
  The hardware and software for I2SD have been enabled by the 
  open souce Adafruit data logging shield.  
  Thanks to the Adafruit Team for making them
  available (http://www.ladyada.net/make/logshield/)
  
  LIBRARY VERSION: 0.01, DATED 7/5/2011

Licenced under Creative Commons Attribution.
Attribution 3.0 Unported
This license is acceptable for Free Cultural Works.
You are free:

    * to Share — to copy, distribute and transmit the work
    * to Remix — to adapt the work
    *

Under the following conditions:

    *

      Attribution — You must attribute the work in the manner specified by 
the author or licensor (but not in any way that suggests that they endorse
you or your use of the work).

      Attribute this work:
      Information
      What does "Attribute this work" mean?
      The page you came from contained embedded licensing metadata, including
how the creator wishes to be attributed for re-use. You can use the HTML here 
to cite the work. Doing so will also include metadata on your page so that 
others can find the original work as well.

With the understanding that:
    * Waiver — Any of the above conditions can be waived if you get permission 
      from the copyright holder.
    * Public Domain — Where the work or any of its elements is in the public 
      domain under applicable law, that status is in no way affected by the 
      license.
    * Other Rights — In no way are any of the following rights affected by the
      license:
          o Your fair dealing or fair use rights, or other applicable copyright
	    exceptions and limitations;
          o The author's moral rights;
          o Rights other persons may have either in the work itself or in how 
            the work is used, such as publicity or privacy rights.
    * Notice — For any reuse or distribution, you must make clear to others 
     the license terms of this work. The best way to do this is with a link 
     to this web page.
*/
#include "I2SD.h"
#include "SD.h"

I2SD* i2sd_p;

I2SD::I2SD(){
}
void I2SD::init(){
  pinMode(I2SD_TX_LED_PIN, OUTPUT);
  pinMode(I2SD_RX_LED_PIN, OUTPUT);
  pinMode(I2SD_SLAVE_SELECT, OUTPUT);
  i2sd_p = this;
  Wire.begin(I2SD_SLAVE_ID);
  Wire.onReceive(I2SD_onReceive);
  Wire.onRequest(I2SD_onRequest);
  if(!SD.begin(I2SD_SLAVE_SELECT)){
    err_out(INIT_FAILED);
  }
  /*
  file = SD.open("test.txt", FILE_WRITE);
  if(!file){
    err_out(OPEN_FILE_FAILED);
  }
  */
  file_mode = FILE_READ;
  file = SD.open("TEST.TXT", file_mode);
  if(!file){
    err_out(OPEN_FILE_FAILED);
  }
}
void I2SD::err_out(uint8_t err_no){
  digitalWrite(I2SD_TX_LED_PIN, HIGH); 
  digitalWrite(I2SD_RX_LED_PIN, LOW); 
  while(true){
    delay(1000);
    for(int i=0; i < err_no; i++){
      digitalWrite(I2SD_RX_LED_PIN, HIGH); 
      delay(200);
      digitalWrite(I2SD_RX_LED_PIN, LOW); 
      delay(200);
    }
  }
}
void I2SD::setTX_LED(boolean state){
  digitalWrite(I2SD_TX_LED_PIN, state);
}
void I2SD::setRX_LED(boolean state){
  digitalWrite(I2SD_RX_LED_PIN, state);
}
void I2SD_onRequest(){
  uint8_t buffer[I2C_BUFFER_LEN];
  if(i2sd_p->file_mode == FILE_READ){
    i2sd_p->setTX_LED(HIGH);
    for(uint8_t i = 0; i < I2C_BUFFER_LEN; i++){
      buffer[i] = i2sd_p->file.read();
    }
    Wire.send(buffer, I2C_BUFFER_LEN);
    i2sd_p->setTX_LED(LOW);
    Serial.print((char*)buffer);
  }
}
void I2SD_onReceive(int n_byte){

  i2sd_p->setRX_LED(HIGH);

  uint8_t msg_type = Wire.receive();
  // Serial.print("MSG_TYPE: ");
  // Serial.print(msg_type, DEC);
  if(msg_type == I2SD_SEEK_MSG){
    // grab address
    Address_t Address;
    uint8_t i;
    for(i = 0; 
	i < sizeof(i2sd_p->cursor) && Wire.available(); 
	i++){
      Address.char4[i] = Wire.receive();
    }
    if(i == 4){
      i2sd_p->file.seek(Address.dat32);
      // Serial.print("SEEK: ");
      // Serial.println(Address.dat32);
    }
  }
  else if(msg_type == I2SD_READ_MSG and i2sd_p->file_mode != FILE_READ){
    i2sd_p->file.close();
    i2sd_p->file_mode = FILE_READ;
    i2sd_p->file = SD.open("TEST.TXT", i2sd_p->file_mode);
    if(!i2sd_p->file){
      i2sd_p->err_out(OPEN_FILE_FAILED);
    }
  }
  else if(msg_type == I2SD_WRITE_MSG){
    if(i2sd_p->file_mode != FILE_WRITE){
      i2sd_p->file.close();
      i2sd_p->file_mode = FILE_WRITE;
      i2sd_p->file = SD.open("TEST.TXT", i2sd_p->file_mode);
      if(!i2sd_p->file){
	i2sd_p->err_out(OPEN_FILE_FAILED);
      }
    }
    while(Wire.available()){
      i2sd_p->file.write(Wire.receive());
    }
  }
  i2sd_p->setRX_LED(LOW);
}

