# Advanced-Microprocessor-System-Project
## Group 4: Arm Based Implementation of Speech Controlled Wheelchair
### Introduction

Nowadays, the increasing number of disabled and elderly people, leading to more invention in medical support devices. Especially the evolution of wheelchairs from the conventional mechanical wheelchair to nowadays electric wheelchair. However, some users were unable to freely control the wheelchair due to lack of arms or energy or having involuntary action.

  Thus, this project is carried out to develop an user friendly speech controlled wheelchair to elderly and disabled groups. We implement Keyword Spotting (KWS) into the wheelchair. Hence, users can control the wheelchair’s movement by voice out simple commands. Any forces not even needed for the wheelchair operation.

In this project, Nucleo-F446RE board (ARM) is selected as the alternative for us to develop the system as it has low power consumption and high reliability. Besides, it provides an affordable and flexible alternative for us to build up our prototype with low cost. This project is built by refer to [Hello Edge: Keyword Spotting on Microcontrollers](https://arxiv.org/pdf/1711.07128.pdf) and repository from
[https://github.com/ARM-software/ML-KWS-for-MCU](https://github.com/ARM-software/ML-KWS-for-MCU). As the result of the deployment, our prototype can be controlled to move in 4 situations which are “Go”, “Stop”, “Left” and “Right”.

### Prerequisites
#### Hardware
1 x Nucleo F446RE Board

2 x Micro 360 Degree Continuous Rotation Servo (FS90R)

2 x Wheel

1 x INMP441 MEMS Omnidirectional Microphones

1 x 4 Channel Relay

#### Software
STM32CubeMX IDE

Audacity

### Hardware Set Up
Diagram below shows the connections of the components. 

![Block Diagram of the prototype](https://github.com/Eddy960/Advanced-Microprocessor-System-Project/blob/main/M5_KWS_Wheelchair/Pic/Block%20Diagram.PNG)

Diagram below shows the pin out diagram in STM32:

![IOC (Pin Out Diagram](https://github.com/Eddy960/Advanced-Microprocessor-System-Project/blob/main/M5_KWS_Wheelchair/Pic/KWSP%20Wheelchair%20IOC.PNG)




### Work Flows 

To develop the system, we have divided the integration process into 5 parts.

#### Part I: Configuration of USART

Reference:

[Synchronous/Asynchronous Receiver/Transmitter (USART) Mean?](https://www.techopedia.com/definition/9850/universal-synchronousasynchronous-receivertransmitter-usart)

[STM32 Nucleo-64 boards User Manual](https://www.st.com/resource/en/user_manual/dm00105823-stm32-nucleo64-boards-mb1136-stmicroelectronics.pdf)

[STM32 USART / UART Tutorial](https://deepbluembedded.com/stm32-usart-uart-tutorial/)

[STM32 Nucleo - Keil 5 IDE with CubeMX: Tutorial 5 - UART Serial Communication](https://www.youtube.com/watch?v=d6MZHdgCQx0)

[PuTTY Tutorial for Serial COM (step-by-step guide)](https://www.youtube.com/watch?v=dO-BMOzNKcI)


Universal Synchronous/Asynchronous Receiver/Transmitter (USART) which also known as serial communications interface (SCI) provides serial data communication from the serial port. The main difference of USART with UART is it provides the option of synchronous mode. In STM32 microcontroller, USART2 interface are available on PA2 and PA3. In this project, we are using the USART and PuTTy to monitoring the result of the KWS spotiing. In Part I, we only discuss on the set up of the USART and PuTTy.

1. In STM32CubeMx, set up the configuration for USART2 as shown in the figure below. Then generate the project and save.


![IOC (Configuration of USART in STM32CubeMx](https://github.com/Eddy960/Advanced-Microprocessor-System-Project/blob/main/M5_KWS_Wheelchair/Pic/Mode%20%26%20Configuration-20210612T014717Z-001/USART%20configurations.PNG)


2. Then, in STM32Cube IDE, open main.c, adding the coding below to the user code region:
```c
GIVE ME CODING
```

```c++
  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */
```

Then?

3. After that, configure PuTTy as below:
/////PIC REQUIRED

#### Part II: Configuration of DMA

References: 

[Using Direct Memory Access (DMA) in STM32 projects](https://embedds.com/using-direct-memory-access-dma-in-stm23-projects/#:~:text=As%20its%20name%20says%20%E2%80%93%20DMA,controllers%20with%2012%20independent%20channels)

[Getting Started with STM32 - Working with ADC and DMA](https://www.digikey.com/en/maker/projects/getting-started-with-stm32-working-with-adc-and-dma/f5009db3a3ed4370acaf545a3370c30c)

DMA (Direct Memory Access) speed up the data transfer as the data is transfer between memory locations without the need for a CPU.

1. Configure DMA as below:


First, we are pulling and implement the repository from [https://github.com/ARM-software/ML-KWS-for-MCU](https://github.com/ARM-software/ML-KWS-for-MCU) 

#### Part III: Integration of I2S Omnidirectional Microphone


#### Part IV: Integration of Servo Motor

FS90R is a 360 degree continuous rotation servo from FEETECH. Since its default rest point is 1.5 ms, it could be configured to rotate counterclockwise by setting the pulse width above the reset point, otherwise it will result in clockwise.  

In this project, we are using two FS90R to demonstrate the wheelchair’s movements which are go, stop, left and right by configuring the two FS90R simultaneously. Table below shows the configuration of the FS90Rs corresponding to each scenario.

First, before coding the servo motor, we need to do some configuration on STM32. In this project, TIM2 was used. Since TIM2 is connected to APB1 bus, thus, the maximum frequency for the timer clock is 90MHz. However, the maximum value we could obtain is only 65535 due to the prescalar register which is only 16 bit. Then, divide the clock using prescalar and ARR register in order to obatin 900 kHz (45MHz/50Hz = 900 kHz).Thus, to get 50 Hz, prescalar should set to 900 whereas ARR set to 1000. Since the ARR, it will be act as 1000% pulse width and it would easier for us to modified setting the "active duration" by just modified with x% to CRR1 register.

After setting up the STM32, let's us insight to the coding used to control the movement of servo motors based on the 4 situation we set.

//Coding below shows the two servo motors are coded simultaneosly in order make it move based on the situation that we set. For example, both servo motors will rotating clockwise at the same time when "GO" command is detected. Besides, when "Left" command is detected, the servo motor on the left will be stop while the right side servo motor will rotate in clockwise. This configuration will allow the prototype turns left.//


#### Part V: Integration of 4 Channel Relay




#### Discussion of Overall Algorithm

In this section, only shows the snipshot of important algorithm. For the overall developed algorith, could be refer to: [CDOINGFILELINK]().

1. In the main.cpp, below libraries are included:

```c++
#include "main.h"
#include "kws_ds_cnn.h"
#include "stdio.h"
#include <string.h>
```

2. Then, we have set up the subroutine according to the situation "GO", "STOP", "LEFT", "RIGHT"

```c++
int GO_command(){
	for (i =0; i<125; i++){
		 htim2.Instance->CCR1 = i;  // duty cycle is .5 ms
	}
	for (j =125; j>0; j--){
		 htim5.Instance->CCR2 = j;  // duty cycle is .5 ms
	}
	 //htim2.Instance->CCR1 = 25;  // duty cycle is .5 ms
	 //htim2.Instance->CCR2 = 25;  // duty cycle is .5 ms
	 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,GPIO_PIN_SET);		//Pin PA10 = Go
	 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_10,GPIO_PIN_RESET);		//Pin PA10 = Go
	 HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3,GPIO_PIN_SET);		//Pin PA10 = Go
	 HAL_GPIO_WritePin(GPIOB, GPIO_PIN_5,GPIO_PIN_SET);		//Pin PA10 = Go

	 //HAL_Delay(2000);
}

int STOP_command(){
	 htim2.Instance->CCR1 = 0;  // duty cycle is .5 ms
	 htim5.Instance->CCR2 = 0;  // duty cycle is .5 ms
	 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,GPIO_PIN_RESET);			//Pin PA8 = Stop
	 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_10,GPIO_PIN_SET);		//Pin PA10 = Go
	 HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3,GPIO_PIN_SET);		//Pin PB3 = Left
	 HAL_GPIO_WritePin(GPIOB, GPIO_PIN_5,GPIO_PIN_SET);		//Pin PB5 = right
	 //HAL_Delay(2000);
}

int LEFT_command(){
	 htim2.Instance->CCR1 = 0;  // duty cycle is .5 ms
	//for (j =5; j>0; j--){
	//	 htim5.Instance->CCR2 = j;  // duty cycle is .5 ms
	//}
	 htim5.Instance->CCR2 = 25;  // duty cycle is .5 ms
	 HAL_Delay(750);
	 htim2.Instance->CCR1 = 0;  // duty cycle is .5 ms
	 htim5.Instance->CCR2 = 0;  // duty cycle is .5 ms
	 HAL_Delay(500);
	 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,GPIO_PIN_SET);		//Pin PA8 = Stop
	 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_10,GPIO_PIN_SET);		//Pin PA10 = Go
	 HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3,GPIO_PIN_RESET);			//Pin PB3 = Left
	 HAL_GPIO_WritePin(GPIOB, GPIO_PIN_5,GPIO_PIN_SET);		//Pin PB5 = right
	 //HAL_Delay(2000);
}

int RIGHT_command(){
	for (i =120; i<121; i++){
		 htim2.Instance->CCR1 = i;  // duty cycle is .5 ms
	}
	 htim5.Instance->CCR2 = 0;  // duty cycle is .5 ms
	 HAL_Delay(750);
	 htim2.Instance->CCR1 = 0;  // duty cycle is .5 ms
	 htim5.Instance->CCR2 = 0;  // duty cycle is .5 ms
	 HAL_Delay(500);
	 //htim2.Instance->CCR1 = 0;  // duty cycle is .5 ms
	 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,GPIO_PIN_SET);		//Pin PA8 = Stop
	 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_10,GPIO_PIN_SET);		//Pin PA10 = Go
	 HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3,GPIO_PIN_SET);		//Pin PB3 = Left
	 HAL_GPIO_WritePin(GPIOB, GPIO_PIN_5,GPIO_PIN_RESET);			//Pin PB5 = right
	 //HAL_Delay(2000);
}

int OTHER_command(){
	 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8,GPIO_PIN_RESET);		//Pin PA8 = Stop
	 HAL_GPIO_WritePin(GPIOA, GPIO_PIN_10,GPIO_PIN_RESET);		//Pin PA10 = Go
	 HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3,GPIO_PIN_RESET);		//Pin PB3 = Left
	 HAL_GPIO_WritePin(GPIOB, GPIO_PIN_5,GPIO_PIN_RESET);			//Pin PB5 = right
	 //HAL_Delay(2000);
}
```

3. In the main function, we using while loop to keep looping the system. Part of algorithm below shows the audio input is received and stored into a buffer. The received audio input is 16 bit and it will go through the process of speech extraction feature and class in order to identify the word.

```c++
	  for (int k=0; k<16000; k+=2){
		  volatile HAL_StatusTypeDef result = HAL_I2S_Receive(&hi2s2, data_in, 2, 100);
		  if (result != HAL_OK){
			  strcpy((char*)buf, "Error Rx\r\n");
		  } else {
			  audio_buffer[k] = (int16_t)data_in[0];
			  audio_buffer[k+1] = (int16_t)data_in[1];
		  }

	  char output_class[12][8] = {"Silence", "Unknown", "yes", "no", "up", "down", "left", "right", "on", "off", "stop", "go"};
	  KWS_DS_CNN kws(audio_buffer);

	  kws.extract_features();
	  kws.classify();

	  int max_ind = kws.get_top_class(kws.output);

	  char buffer [70];
	  int buffer_output = 0;
```

4. Algorithm below shows when the identified word is matched to the stored recognised word, the corresponding subroutine will be executed and hence the wheelchair will be moved in desired direction.

```c++
		  if (max_ind == 6 ){	//left
			  LEFT_command();
			  //keep_command = "";
		  }
		  else if (max_ind == 7){	//right
			  RIGHT_command();
			  keep_command = 0;
		  }
		  else if (max_ind == 11){	//go
			  GO_command();
			  keep_command = 1;
		  }
		  else if (max_ind == 10){	//stop

			  STOP_command();
			  keep_command = 0;
		  }
		  else if (max_ind == 0 || 1 || 2 || 3 || 4 || 5 || 8 || 9){	//Silence
			  if (keep_command == 1){
				  GO_command();
			  }
			  else{
				  STOP_command();
			  }
		  }
  }
```


