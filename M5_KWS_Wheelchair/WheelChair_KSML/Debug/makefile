################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Drivers/STM32F4xx_HAL_Driver/subdir.mk
-include Drivers/CMSIS/Include/dsp/subdir.mk
-include Drivers/CMSIS/Device/ST/STM32F4xx/Source/TransformFunctions/subdir.mk
-include Drivers/CMSIS/Device/ST/STM32F4xx/Source/SVDFunctions/subdir.mk
-include Drivers/CMSIS/Device/ST/STM32F4xx/Source/ReshapeFunctions/subdir.mk
-include Drivers/CMSIS/Device/ST/STM32F4xx/Source/PoolingFunctions/subdir.mk
-include Drivers/CMSIS/Device/ST/STM32F4xx/Source/NNSupportFunctions/subdir.mk
-include Drivers/CMSIS/Device/ST/STM32F4xx/Source/FullyConnectedFunctions/subdir.mk
-include Drivers/CMSIS/Device/ST/STM32F4xx/Source/ConvolutionFunctions/subdir.mk
-include Drivers/CMSIS/Device/ST/STM32F4xx/Source/ConcatenationFunctions/subdir.mk
-include Drivers/CMSIS/Device/ST/STM32F4xx/Source/BasicMathFunctions/subdir.mk
-include Drivers/CMSIS/Device/ST/STM32F4xx/Source/ActivationFunctions/subdir.mk
-include Drivers/CMSIS/Device/ST/STM32F4xx/Source/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := WheelChair_KSML
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX := 
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME).$(BUILD_ARTIFACT_EXTENSION)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
WheelChair_KSML.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
WheelChair_KSML.list \

OBJCOPY_BIN += \
WheelChair_KSML.bin \


# All Target
all: main-build

# Main-build Target
main-build: WheelChair_KSML.elf secondary-outputs

# Tool invocations
WheelChair_KSML.elf: $(OBJS) $(USER_OBJS) C:\Users\User\STM32CubeIDE\workspace_1.6.0\WheelChair_KSML\STM32F446RETX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-g++ -o "WheelChair_KSML.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"C:\Users\User\STM32CubeIDE\workspace_1.6.0\WheelChair_KSML\STM32F446RETX_FLASH.ld" --specs=nosys.specs -Wl,-Map="WheelChair_KSML.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -lstdc++ -lsupc++ -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

WheelChair_KSML.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "WheelChair_KSML.list"
	@echo 'Finished building: $@'
	@echo ' '

WheelChair_KSML.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "WheelChair_KSML.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents fail-specified-linker-script-missing warn-no-linker-script-specified
.SECONDARY:

-include ../makefile.targets
