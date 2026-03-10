################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.c \
C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.c 

OBJS += \
./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.o \
./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.o 

C_DEPS += \
./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.d \
./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.o: C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.c Drivers/BSP/STM32N6570-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DSTM32N657xx -DLL_ATON_DUMP_DEBUG_API -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_BARE_METAL -DLL_ATON_RT_MODE=LL_ATON_RT_ASYNC -DLL_ATON_SW_FALLBACK -DLL_ATON_EB_DBG_INFO -DLL_ATON_DBG_BUFFER_INFO_EXCLUDED=1 -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -c -I../../../FSBL/Inc -I../../../../../../../../Drivers/BSP/STM32N6570-DK -I../../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/BSP/Components/imx335 -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/rk050hr18 -I../../../../../../../../Middlewares/ST/STM32_ISP_Library/evision/Inc -I../../../../../../../../Middlewares/ST/STM32_ISP_Library/isp/Inc -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/X-CUBE-AI/App" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/X-CUBE-AI" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Npu/Devices/STM32N6XX" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Npu/ll_aton" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Inc" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Lib" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.o: C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.c Drivers/BSP/STM32N6570-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DSTM32N657xx -DLL_ATON_DUMP_DEBUG_API -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_BARE_METAL -DLL_ATON_RT_MODE=LL_ATON_RT_ASYNC -DLL_ATON_SW_FALLBACK -DLL_ATON_EB_DBG_INFO -DLL_ATON_DBG_BUFFER_INFO_EXCLUDED=1 -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -c -I../../../FSBL/Inc -I../../../../../../../../Drivers/BSP/STM32N6570-DK -I../../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/BSP/Components/imx335 -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/rk050hr18 -I../../../../../../../../Middlewares/ST/STM32_ISP_Library/evision/Inc -I../../../../../../../../Middlewares/ST/STM32_ISP_Library/isp/Inc -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/X-CUBE-AI/App" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/X-CUBE-AI" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Npu/Devices/STM32N6XX" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Npu/ll_aton" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Inc" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Lib" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-STM32N6570-2d-DK

clean-Drivers-2f-BSP-2f-STM32N6570-2d-DK:
	-$(RM) ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.cyclo ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.d ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.o ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery.su ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.cyclo ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.d ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.o ./Drivers/BSP/STM32N6570-DK/stm32n6570_discovery_bus.su

.PHONY: clean-Drivers-2f-BSP-2f-STM32N6570-2d-DK

