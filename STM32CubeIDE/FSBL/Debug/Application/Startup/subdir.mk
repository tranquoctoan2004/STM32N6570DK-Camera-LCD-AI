################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Application/Startup/startup_stm32n657x0hxq_fsbl.s 

OBJS += \
./Application/Startup/startup_stm32n657x0hxq_fsbl.o 

S_DEPS += \
./Application/Startup/startup_stm32n657x0hxq_fsbl.d 


# Each subdirectory must supply rules for building sources it contributes
Application/Startup/%.o: ../Application/Startup/%.s Application/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -c -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/X-CUBE-AI/App" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/X-CUBE-AI" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Npu/Devices/STM32N6XX" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Npu/ll_aton" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Inc" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Lib" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Application-2f-Startup

clean-Application-2f-Startup:
	-$(RM) ./Application/Startup/startup_stm32n657x0hxq_fsbl.d ./Application/Startup/startup_stm32n657x0hxq_fsbl.o

.PHONY: clean-Application-2f-Startup

