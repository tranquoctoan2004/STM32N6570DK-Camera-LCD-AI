################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Drivers/BSP/Components/imx335/imx335.c \
C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Drivers/BSP/Components/imx335/imx335_reg.c 

OBJS += \
./Drivers/BSP/Components/IMX335/imx335.o \
./Drivers/BSP/Components/IMX335/imx335_reg.o 

C_DEPS += \
./Drivers/BSP/Components/IMX335/imx335.d \
./Drivers/BSP/Components/IMX335/imx335_reg.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/IMX335/imx335.o: C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Drivers/BSP/Components/imx335/imx335.c Drivers/BSP/Components/IMX335/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DSTM32N657xx -DLL_ATON_DUMP_DEBUG_API -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_BARE_METAL -DLL_ATON_RT_MODE=LL_ATON_RT_ASYNC -DLL_ATON_SW_FALLBACK -DLL_ATON_EB_DBG_INFO -DLL_ATON_DBG_BUFFER_INFO_EXCLUDED=1 -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -c -I../../../FSBL/Inc -I../../../../../../../../Drivers/BSP/STM32N6570-DK -I../../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/BSP/Components/imx335 -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/rk050hr18 -I../../../../../../../../Middlewares/ST/STM32_ISP_Library/evision/Inc -I../../../../../../../../Middlewares/ST/STM32_ISP_Library/isp/Inc -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/X-CUBE-AI/App" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/X-CUBE-AI" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Npu/Devices/STM32N6XX" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Npu/ll_aton" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Inc" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Lib" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/Components/IMX335/imx335_reg.o: C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Drivers/BSP/Components/imx335/imx335_reg.c Drivers/BSP/Components/IMX335/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DSTM32N657xx -DLL_ATON_DUMP_DEBUG_API -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_BARE_METAL -DLL_ATON_RT_MODE=LL_ATON_RT_ASYNC -DLL_ATON_SW_FALLBACK -DLL_ATON_EB_DBG_INFO -DLL_ATON_DBG_BUFFER_INFO_EXCLUDED=1 -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -c -I../../../FSBL/Inc -I../../../../../../../../Drivers/BSP/STM32N6570-DK -I../../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../../../Drivers/CMSIS/Include -I../../../../../../../../Drivers/BSP/Components/imx335 -I../../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../../Drivers/BSP/Components/rk050hr18 -I../../../../../../../../Middlewares/ST/STM32_ISP_Library/evision/Inc -I../../../../../../../../Middlewares/ST/STM32_ISP_Library/isp/Inc -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/X-CUBE-AI/App" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/X-CUBE-AI" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Npu/Devices/STM32N6XX" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Npu/ll_aton" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Inc" -I"C:/Users/toantran/Documents/Project_STM32_N6570/STM32CubeN6-main/Projects/STM32N6570-DK/Applications/DCMIPP/DCMIPP_ContinuousMode/STM32CubeIDE/FSBL/Middlewares/ST/AI/Lib" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-IMX335

clean-Drivers-2f-BSP-2f-Components-2f-IMX335:
	-$(RM) ./Drivers/BSP/Components/IMX335/imx335.cyclo ./Drivers/BSP/Components/IMX335/imx335.d ./Drivers/BSP/Components/IMX335/imx335.o ./Drivers/BSP/Components/IMX335/imx335.su ./Drivers/BSP/Components/IMX335/imx335_reg.cyclo ./Drivers/BSP/Components/IMX335/imx335_reg.d ./Drivers/BSP/Components/IMX335/imx335_reg.o ./Drivers/BSP/Components/IMX335/imx335_reg.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-IMX335

