#include <stdio.h>
#include "platform.h"
#include "lw_usb/GenericMacros.h"
#include "lw_usb/GenericTypeDefs.h"
#include "lw_usb/MAX3421E.h"
#include "lw_usb/USB.h"
#include "lw_usb/usb_ch9.h"
#include "lw_usb/transfer.h"
#include "lw_usb/HID.h"

#include "xparameters.h"
#include <xgpio.h>

#include <xtmrctr.h>
#include "xintc.h"

extern HID_DEVICE hid_device;

static XGpio Gpio_hex;

XTmrCtr Usb_timer2;
static int Status;
uint8_t prev_lane_pressed[4] = {0};
uint8_t clicked[4] = {0};
uint8_t prevKeycode[4] = {0};

//static BYTE addr = 1; 				//hard-wired USB address
const char* const devclasses[] = { " Uninitialized", " HID Keyboard", " HID Mouse", " Mass storage" };

typedef struct{
    int lane;
    int y;

}Note;

Note chart[6] = {
        {0, 320},
        {3, 305},
        {2, 290},
        {1,240},
        {3,170},
        {3,-1470},
//        [3 ... 49] = {-1,0}
};

BYTE GetDriverandReport() {
	BYTE i;
//	BYTE rcode;
	BYTE device = 0xFF;
//	BYTE tmpbyte;

	DEV_RECORD* tpl_ptr;
	// xil_printf("Reached USB_STATE_RUNNING (0x40)\n");
	for (i = 1; i < USB_NUMDEVICES; i++) {
		tpl_ptr = GetDevtable(i);
		if (tpl_ptr->epinfo != NULL) {
			// xil_printf("Device: %d", i);
			// xil_printf("%s \n", devclasses[tpl_ptr->devclass]);
			device = tpl_ptr->devclass;
		}
	}
//	//Query rate and protocol
//	rcode = XferGetIdle(addr, 0, hid_device.interface, 0, &tmpbyte);
//	if (rcode) {   //error handling
//		// xil_printf("GetIdle Error. Error code: ");
//		// xil_printf("%x \n", rcode);
//	} else {
//		// xil_printf("Update rate: ");
//		// xil_printf("%x \n", tmpbyte);
//	}
//	// xil_printf("Protocol: ");
//	rcode = XferGetProto(addr, 0, hid_device.interface, &tmpbyte);
//	if (rcode) {   //error handling
//		// xil_printf("GetProto Error. Error code ");
//		// xil_printf("%x \n", rcode);
//	} else {
//		// xil_printf("%d \n", tmpbyte);
//	}
	return device;
}

void printHex (u32 data, unsigned channel)
{
	XGpio_DiscreteWrite (&Gpio_hex, channel, data);
}

void timer() {
	Status = XTmrCtr_Initialize(&Usb_timer2, XPAR_TIMER_USB_AXI_DEVICE_ID);
	XTmrCtr_Start(&Usb_timer2, 0);
}

void resetTimer() {
    XTmrCtr_Stop(&Usb_timer2, 0);
    XTmrCtr_Reset(&Usb_timer2, 0);
    XTmrCtr_Start(&Usb_timer2, 0);
}


int main() {
    init_platform();
    test_text();
    textHDMIColorClr();
    test_text();
    for(int x = 0; x < 200; x++){
    	for(int y = 0; y < 480; y++){
    		if((y > 447 && y < 451) || (x >= 0 && x < 2) || (x >= 198 && x < 200)){
    			drawPixel(x, y, 1);
    		}
    	}
    }

    // while(1){};
    XGpio_Initialize(&Gpio_hex, XPAR_GPIO_USB_KEYCODE_DEVICE_ID);
   	XGpio_SetDataDirection(&Gpio_hex, 1, 0x00000000); //configure hex display GPIO
   	XGpio_SetDataDirection(&Gpio_hex, 2, 0x00000000); //configure hex display GPIO

//   	BYTE rcode;
//	BOOT_MOUSE_REPORT buf;		//USB mouse report
	BOOT_KBD_REPORT kbdbuf;

	BYTE runningdebugflag = 0;//flag to dump out a bunch of information when we first get to USB_STATE_RUNNING
//	BYTE errorflag = 0; //flag once we get an error device so we don't keep dumping out state info
	BYTE device;

	// xil_printf("initializing MAX3421E...\n");
	MAX3421E_init();
	// xil_printf("initializing USB...\n");
	USB_init();

	int counter = 0;
	uint8_t score = 0;
	int totScore = 0;
	timer();
	uint8_t should_poll = 0;
	while(1) {

		MAX3421E_Task();
				USB_Task();

				if (GetUsbTaskState() == USB_STATE_RUNNING) {
					if (!runningdebugflag) {
						runningdebugflag = 1;
						device = GetDriverandReport();
					} else if (device == 1) {
		//				xil_printf("timer = %x\n", XTmrCtr_GetValue(&Usb_timer2, 0));
						kbdPoll(&kbdbuf);
						if(kbdbuf.keycode[0] == 0x28) {
							printHex (kbdbuf.keycode[0] + (kbdbuf.keycode[1]<<8) + (kbdbuf.keycode[2]<<16) + (kbdbuf.keycode[3]<<24), 1);
							break;
						}
		//				xil_printf("Keycodes: %x %x %x %x\n", kbdbuf.keycode[0], kbdbuf.keycode[1], kbdbuf.keycode[2], kbdbuf.keycode[3]);


						//Outputs the first 4 keycodes using the USB GPIO channel 1
		//				printHex (kbdbuf.keycode[0] + (kbdbuf.keycode[1]<<8) + (kbdbuf.keycode[2]<<16) + (kbdbuf.keycode[3]<<24), 1);
						//Modify to output the last 2 keycodes on channel 2.
					}
				}
		//
				else //not in USB running state
				{
					// xil_printf("USB task state: ");
					// xil_printf("%x\n", GetUsbTaskState());
					if (runningdebugflag) {	//previously running, reset USB hardware just to clear out any funky state, HS/FS etc
						runningdebugflag = 0;
						MAX3421E_init();
						USB_init();
					}
		//			errorflag = 0;
				}
			}
	while (1) {
		MAX3421E_Task();
		USB_Task();

		if (GetUsbTaskState() == USB_STATE_RUNNING) {
			if (!runningdebugflag) {
				runningdebugflag = 1;
				device = GetDriverandReport();
			} else if (device == 1) {
//				xil_printf("timer = %x\n", XTmrCtr_GetValue(&Usb_timer2, 0));
				if(should_poll == 0) {
				                    kbdPoll(&kbdbuf);
				                    should_poll=1;
				                } else {
				                    should_poll+=1;
				                    should_poll = should_poll%3;
				                }
//				xil_printf("Keycodes: %x %x %x %x\n", kbdbuf.keycode[0], kbdbuf.keycode[1], kbdbuf.keycode[2], kbdbuf.keycode[3]);
				if (XTmrCtr_GetValue(&Usb_timer2, 0) >= 0x300000){
					clickedFunc(kbdbuf.keycode, prev_lane_pressed, clicked);
//					xil_printf("timer = %x\n", XTmrCtr_GetValue(&Usb_timer2, 0));
					counter += 5;
//					xil_printf("counter = %d\n", counter);
					resetTimer();
					for(int i=0; i<6; i++) {
						int drawY = chart[i].y + counter;
						int ybot = drawY + 30;
						if(chart[i].lane != -1 && ybot > -10 && ybot < 519) {
							drawNote(chart[i].lane, drawY);
							if(clicked[chart[i].lane] == 1) {
								if(ybot > 390){
									score = scoreCalc(ybot, 449, chart[i].lane);
									totScore += score;
									xil_printf("Score: %d\n", totScore);
									removeNote(chart[i].lane, drawY);
									clicked[chart[i].lane] = 0;
									chart[i].lane = -1;
								}
							}
						}
					}
//					xil_printf("%x\n",score);
					lightKeys(kbdbuf.keycode, score);
					for(int i=0; i<4; i++) {
						if(prevKeycode[i] != 0 && kbdbuf.keycode[i] == 0){
							score = 0;
						}
						prevKeycode[i] = kbdbuf.keycode[i];
					}
				}

				//Outputs the first 4 keycodes using the USB GPIO channel 1
//				printHex (kbdbuf.keycode[0] + (kbdbuf.keycode[1]<<8) + (kbdbuf.keycode[2]<<16) + (kbdbuf.keycode[3]<<24), 1);
				//Modify to output the last 2 keycodes on channel 2.
			}
		}
//		else if (GetUsbTaskState() == USB_STATE_ERROR) {
//			if (!errorflag) {
//				errorflag = 1;
//				// xil_printf("USB Error State\n");
//				//print out string descriptor here
//			}
//		}
		else //not in USB running state
		{
			// xil_printf("USB task state: ");
			// xil_printf("%x\n", GetUsbTaskState());
			if (runningdebugflag) {	//previously running, reset USB hardware just to clear out any funky state, HS/FS etc
				runningdebugflag = 0;
				MAX3421E_init();
				USB_init();
			}
//			errorflag = 0;
		}
	}
    cleanup_platform();
	return 0;
}
