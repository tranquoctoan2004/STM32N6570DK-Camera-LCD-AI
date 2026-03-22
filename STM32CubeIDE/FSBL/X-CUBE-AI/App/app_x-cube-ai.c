/**
  ******************************************************************************
  * @file    app_x-cube-ai.c
  * @author  X-CUBE-AI C code generator
  * @brief   AI program body
  ******************************************************************************
  */

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
/* System headers */
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <inttypes.h>
#include <string.h>

#include "app_x-cube-ai.h"
#include "main.h"

/* USER CODE BEGIN includes */
#include "network.h"
#include "ll_aton_rt_user_api.h"
#include "stm32n6xx_hal_dma2d.h"
#include "stm32n6xx_hal_ltdc.h"
#include "stm32n6570_discovery_lcd.h"
/* USER CODE END includes */

/* Entry points --------------------------------------------------------------*/

LL_ATON_DECLARE_NAMED_NN_INSTANCE_AND_INTERFACE(Default)

/* USER CODE BEGIN PTD */
/* AI input size */
#define AI_WIDTH   224
#define AI_HEIGHT  224
#define AI_CH      3

/* ÉP BUỘC VÀO SECTION .axisram ĐỂ NPU ĐỌC ĐƯỢC */
__attribute__((section(".axisram"))) ALIGN_32BYTES(static uint8_t ai_input[AI_WIDTH * AI_HEIGHT * AI_CH]);
__attribute__((section(".axisram"))) ALIGN_32BYTES(static int8_t  ai_output[4096]);

/* function prototypes */
static void camera_to_ai(void);
static void display_result(uint8_t detected);
void set_clk_sleep_mode(void);
/* USER CODE END PTD */

void set_clk_sleep_mode(void)
{
  /* Leave clocks enabled in Low Power modes */
#if defined (CPU_IN_SECURE_STATE)
  __HAL_RCC_DBG_CLK_SLEEP_ENABLE();
#endif
  __HAL_RCC_XSPIPHYCOMP_CLK_SLEEP_ENABLE();

  // Low-power clock enable for memories
  __HAL_RCC_AXISRAM1_MEM_CLK_SLEEP_ENABLE();
  __HAL_RCC_AXISRAM2_MEM_CLK_SLEEP_ENABLE();
  __HAL_RCC_AXISRAM3_MEM_CLK_SLEEP_ENABLE();
  __HAL_RCC_AXISRAM4_MEM_CLK_SLEEP_ENABLE();
  __HAL_RCC_AXISRAM5_MEM_CLK_SLEEP_ENABLE();
  __HAL_RCC_AXISRAM6_MEM_CLK_SLEEP_ENABLE();
  __HAL_RCC_FLEXRAM_MEM_CLK_SLEEP_ENABLE();
  __HAL_RCC_CACHEAXIRAM_MEM_CLK_SLEEP_ENABLE();

#if defined (CPU_IN_SECURE_STATE)
  __HAL_RCC_RIFSC_CLK_SLEEP_ENABLE();
  __HAL_RCC_RISAF_CLK_SLEEP_ENABLE();
  __HAL_RCC_IAC_CLK_SLEEP_ENABLE();
#endif
  // LP clocks AHB5
  __HAL_RCC_XSPI1_CLK_SLEEP_ENABLE();
  __HAL_RCC_XSPI2_CLK_SLEEP_ENABLE();
  __HAL_RCC_CACHEAXI_CLK_SLEEP_ENABLE();
  __HAL_RCC_NPU_CLK_SLEEP_ENABLE();
  // LP clocks APB2
  __HAL_RCC_USART1_CLK_SLEEP_ENABLE();
}

void MX_X_CUBE_AI_Init(void)
{
    /* Bật Clock cho các phân vùng RAM AXI */
    __HAL_RCC_AXISRAM2_MEM_CLK_ENABLE();
    __HAL_RCC_AXISRAM3_MEM_CLK_ENABLE();
    __HAL_RCC_AXISRAM4_MEM_CLK_ENABLE();
    __HAL_RCC_AXISRAM5_MEM_CLK_ENABLE();
    __HAL_RCC_AXISRAM6_MEM_CLK_ENABLE();

    /* CẤP NGUỒN CHO RAM (Gỡ bỏ chế độ ShutDown) - Rất quan trọng */
    RAMCFG_SRAM2_AXI->CR &= ~RAMCFG_CR_SRAMSD;
    RAMCFG_SRAM3_AXI->CR &= ~RAMCFG_CR_SRAMSD;
    RAMCFG_SRAM4_AXI->CR &= ~RAMCFG_CR_SRAMSD;
    RAMCFG_SRAM5_AXI->CR &= ~RAMCFG_CR_SRAMSD;
    RAMCFG_SRAM6_AXI->CR &= ~RAMCFG_CR_SRAMSD;

    /* Thiết lập Clock khi NPU/CPU vào chế độ chờ */
    set_clk_sleep_mode();

    /* Khởi tạo phần cứng NPU (Clock & Reset) */
    __HAL_RCC_NPU_CLK_ENABLE();
    __HAL_RCC_NPU_FORCE_RESET();
    __HAL_RCC_NPU_RELEASE_RESET();

    // npu_cache_init(); /* Uncomment nếu trong project bạn có hàm này */

    /* USER CODE BEGIN 5 */
    printf("\n==== AI INIT (LL_ATON MODE) ====\n");

    /* NPU runtime init */
    LL_ATON_RT_RuntimeInit();

    /* network init */
    LL_ATON_RT_Init_Network(&NN_Instance_Default);

    /* bind input buffer */
    LL_ATON_Set_User_Input_Buffer(&NN_Instance_Default, 0, ai_input, sizeof(ai_input));

    /* bind output buffer */
    LL_ATON_Set_User_Output_Buffer(&NN_Instance_Default, 0, ai_output, sizeof(ai_output));

    printf("AI READY\n");
    /* USER CODE END 5 */
}

void MX_X_CUBE_AI_Process(void)
{
    /* USER CODE BEGIN 6 */
    LL_ATON_RT_RetValues_t ret;

    /* 1. camera frame -> AI input */
    camera_to_ai();

    /* 2. ÉP CPU GHI CACHE XUỐNG RAM trước khi NPU lấy data */
    SCB_CleanDCache_by_Addr((uint32_t *)ai_input, sizeof(ai_input));

    /* 3. run inference (SỬ DỤNG POLLING CHỦ ĐỘNG, BỎ QUA WFE) */
    do
    {
        ret = LL_ATON_RT_RunEpochBlock(&NN_Instance_Default);
        if(ret == LL_ATON_RT_WFE)
        {
            /* BẮT BUỘC phải dùng lệnh này để CPU vào trạng thái chờ ngắt phần cứng */
            //chang 20/03
        	__WFE();
        }
    } while(ret != LL_ATON_RT_DONE);
    /* reset network */
    LL_ATON_RT_Reset_Network(&NN_Instance_Default);

    /* 4. ÉP CPU XÓA CACHE CŨ để đọc output mới nhất từ RAM do NPU trả về */
    SCB_InvalidateDCache_by_Addr((uint32_t *)ai_output, sizeof(ai_output));

    /* 5. simple detection check */
    if (ret == LL_ATON_RT_DONE)
    {
        int max_val = -128;

        for(int i=0; i<4096; i++)
        {
            if(ai_output[i] > max_val)
            {
                max_val = ai_output[i];
            }
        }

        uint8_t detected = (max_val > 40);

        if(detected)
            printf("N detected\n");
        else
            printf("No N\n");

        display_result(detected);
    }
    else
    {
        printf("Inference Failed! Check NPU Memory.\n");
    }
    /* USER CODE END 6 */
}

/* USER CODE BEGIN 7 */

/* ======================================================= */
/* CAMERA → AI INPUT */
static void camera_to_ai(void)
{
    /* BUFFER_ADDRESS đã được lấy từ main.h (0x34200000) */
    uint16_t *cam = (uint16_t*)BUFFER_ADDRESS;
    int idx = 0;

    /* Xóa cache để CPU đọc đúng ảnh từ Camera (DCMIPP) ném vào RAM */
    SCB_InvalidateDCache_by_Addr((uint32_t *)cam, FRAME_BUFFER_SIZE);

    for(int y=0; y<AI_HEIGHT; y++)
    {
        for(int x=0; x<AI_WIDTH; x++)
        {
            int sx = x * FRAME_WIDTH / AI_WIDTH;
            int sy = y * FRAME_HEIGHT / AI_HEIGHT;

            uint16_t p = cam[sy * FRAME_WIDTH + sx];

            uint8_t r = ((p >> 11) & 0x1F) << 3;
            uint8_t g = ((p >> 5) & 0x3F) << 2;
            uint8_t b = (p & 0x1F) << 3;

            ai_input[idx++] = r;
            ai_input[idx++] = g;
            ai_input[idx++] = b;
        }
    }
}

/* ======================================================= */
/* LCD DISPLAY RESULT */
static void display_result(uint8_t detected)
{
    if(detected)
    {
        BSP_LCD_FillRect(0, 350, 200, 100, 80, LCD_COLOR_RGB565_RED);
    }
    else
    {
        BSP_LCD_FillRect(0, 350, 200, 100, 80, LCD_COLOR_RGB565_GREEN);
    }
}

/* USER CODE END 7 */

#ifdef __cplusplus
}
#endif
