################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/Device/ST/STM32F4xx/Source/ReshapeFunctions/arm_reshape_s8.c 

C_DEPS += \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/ReshapeFunctions/arm_reshape_s8.d 

OBJS += \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/ReshapeFunctions/arm_reshape_s8.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/Device/ST/STM32F4xx/Source/ReshapeFunctions/arm_reshape_s8.o: ../Drivers/CMSIS/Device/ST/STM32F4xx/Source/ReshapeFunctions/arm_reshape_s8.c Drivers/CMSIS/Device/ST/STM32F4xx/Source/ReshapeFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -IC:/Users/User/STM32Cube/Repository/STM32Cube_FW_F4_V1.26.1/Drivers/STM32F4xx_HAL_Driver/Inc -IC:/Users/User/STM32Cube/Repository/STM32Cube_FW_F4_V1.26.1/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -IC:/Users/User/STM32Cube/Repository/STM32Cube_FW_F4_V1.26.1/Drivers/CMSIS/Device/ST/STM32F4xx/Include -IC:/Users/User/STM32Cube/Repository/STM32Cube_FW_F4_V1.26.1/Drivers/CMSIS/Include -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Core/Inc" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Core/Src" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Include" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source/ActivationFunctions" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source/BasicMathFunctions" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source/ConcatenationFunctions" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source/ConvolutionFunctions" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source/FullyConnectedFunctions" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source/NNSupportFunctions" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source/PoolingFunctions" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source/ReshapeFunctions" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source/SoftmaxFunctions" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source/SVDFunctions" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Device/ST/STM32F4xx/Source/TransformFunctions" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Include/dsp" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Include/dsp/arr_desc" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Include/dsp/opt_arg" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/WheelChair_KSML/Drivers/CMSIS/Include/dsp/util" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/CMSIS/Device/ST/STM32F4xx/Source/ReshapeFunctions/arm_reshape_s8.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

