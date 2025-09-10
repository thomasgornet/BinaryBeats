# BinaryBeats

Binary Beats is an FPGA based rhythm game featuring a title screen, audio, notes, accuracy indicator, score, highscore, and reset system.

<img width="1042" height="1778" alt="image" src="https://github.com/user-attachments/assets/0a59c9a2-4510-4a2a-b0df-ace91586a352" />


### How to play

To play the game, press enter on the title screen to begin the game, and again at any point during the game to restart. Use keys "d, f, j, and k" to hit notes in lanes "1, 2, 3, and 4" respectively when the bottom the note reaches the horizontal line at the bottom of the screen. If the notes are seem to be out of time with the audio, press "+" to delay the notes, "-" to speed up the notes, and "0" to reset the offset. The current score and all time high score are displayed at the top right of the screen.

# Hardware Features

### Audio:

The audio functions by reading a raw data-formatted WAV file stored on an SD card. The SD card is read into DDR3 memory, where it is addressed by an address calculator module. The data from the RAM is then sent to a PWM module to set the audio out. The address calculator functions by incrementing an address at a frequency of 44.1 KHz which is the sampling frequency. The PWM module works by using a counter, outputting a 1 when the counter is less then the ram data, and a 0 when the counter is greater than the ram data.

### Display:

Display data is stored in three different ways but are all outputted through a VGA to HDMI module. This module increments pixel by pixel across the screen, taking in the color of the pixel and outputting as an HDMI signal.

##### BRAM:

A frame buffer is implemented using a 32 bit wide, 12000 bit deep BRAM to store the pixels for a 200x480 screen centered in the middle of a 640x480 screen. Pixel data is stored in 4 bit increments which is then read by a palette module to output the color of each pixel to VGA to HDMI. By default the frame buffer is filled with a transparent color so that it does not cover the title screen. The frame buffer supports the AXI protocol, allowing for the microblaze soft core processor to write pixel data to the BRAM.

##### ROM

The title screen and background is implemented using a ROM that is preloaded with a COE file. The COE file was made by a PNG to COE script, paletizing the image. This data is read by a color picker module, outputting the palette color of each pixel to the VGA to HDMI.

##### GPIO

Display data for the score is determined based on GPIO outputs from the software. The scores are sent through a GPIO and interpreted through a font rom to output the score and high score to VGA to HDMI.


# Software Features

##### Keyboard IO

The FPGA uses the MAX3421E chip to communicate the USB Keyboard inputs to microblaze via the SPI protocol. To get the current keyboard input we call a kbdpoll function that polls the keyboard information from the MAX3421E chip and outputs a keycode array that stores up to 6 keycodes. For they rhythm game we use the "d,f,j,k" keys for hit detection on lanes "1,2,3,4" respectively. When a keycode is pressed corresponding to the lane we define this as a note "hit".Other keycodes like "enter, +, -, 0" are used to start/restart the game and control visual offset. 



##### Notes and Drawing

Before the game starts, the frame for the game consisting of a border and a hit line, indicating where the bottom of a note should be tapped, is drawn to the screen by calling axi_writes on each pixel. The notes are stored in a struct containing a lane and a starting -y position. In order to draw the notes to the screen, we call an axi_write on each pixel to form the shape of the note at the current position. To determine the current position of a note, a timer interrupt is used to increment a counter that calculates the current y position by adding the counter to the notes starting y position. Once the note is tapped, axi_writes are used to remove the note from the screen, and the y value of the note is stored for accuracy calculation.

##### Accuracy and Scoring

The accuracy of the notes is determined by the absolute value of the difference between the current y position at the time of a hit and the y position of the hit line. Based on this accuracy value, a total score value is incremented by either 100, 50, 20, or 0, depending on the size of the difference. To show the score received at each hit, the lightKeys function is called to color in the hit line in the corresponding lane with colors corresponding to the score. The colors are green, yellow, orange, and red, representing the scores 100, 50, 20, and 0, respectively. The total score value as well as an all-time high score is output through a GPIO.

