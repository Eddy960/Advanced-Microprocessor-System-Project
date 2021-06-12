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
First, we are pulling and implement the repository from [https://github.com/ARM-software/ML-KWS-for-MCU](https://github.com/ARM-software/ML-KWS-for-MCU) 






