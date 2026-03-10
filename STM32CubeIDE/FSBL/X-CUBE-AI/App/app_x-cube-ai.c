#include "app_x-cube-ai.h"
#include "main.h"

#include <stdio.h>
#include <string.h>

#include "network.h"
#include "ll_aton_rt_user_api.h"

#include "stm32n6xx_hal_dma2d.h"
#include "stm32n6xx_hal_ltdc.h"

#include "stm32n6570_discovery_lcd.h"

/* AI input size */
#define AI_WIDTH   224
#define AI_HEIGHT  224
#define AI_CH      3

/* AI buffers */
static uint8_t ai_input[AI_WIDTH * AI_HEIGHT * AI_CH];
static int8_t  ai_output[4096];

/* network instance */
LL_ATON_DECLARE_NAMED_NN_INSTANCE_AND_INTERFACE(Default)

/* function prototypes */
static void camera_to_ai(void);
static void display_result(uint8_t detected);

/* ======================================================= */
/* AI INIT */

void MX_X_CUBE_AI_Init(void)
{
    printf("\n==== AI INIT ====\n");

    /* NPU runtime init */
    LL_ATON_RT_RuntimeInit();

    /* network init */
    LL_ATON_RT_Init_Network(&NN_Instance_Default);

    /* bind input buffer */
    LL_ATON_Set_User_Input_Buffer(
        &NN_Instance_Default,
        0,
        ai_input,
        sizeof(ai_input)
    );

    /* bind output buffer */
    LL_ATON_Set_User_Output_Buffer(
        &NN_Instance_Default,
        0,
        ai_output,
        sizeof(ai_output)
    );

    printf("AI READY\n");
}

/* ======================================================= */
/* AI PROCESS */

void MX_X_CUBE_AI_Process(void)
{
    LL_ATON_RT_RetValues_t ret;

    /* camera frame -> AI input */
    camera_to_ai();

    /* run inference */
    do
    {
        ret = LL_ATON_RT_RunEpochBlock(&NN_Instance_Default);

        if(ret == LL_ATON_RT_WFE)
        {
            LL_ATON_OSAL_WFE();
        }

    } while(ret != LL_ATON_RT_DONE);

    /* reset network */
    LL_ATON_RT_Reset_Network(&NN_Instance_Default);

    /* simple detection check */
    int max_val = -128;

    for(int i=0;i<4096;i++)
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

/* ======================================================= */
/* CAMERA → AI INPUT */

static void camera_to_ai(void)
{
	uint16_t *cam = (uint16_t*)BUFFER_ADDRESS;

    int idx = 0;

    for(int y=0;y<AI_HEIGHT;y++)
    {
        for(int x=0;x<AI_WIDTH;x++)
        {
            int sx = x * 800 / AI_WIDTH;
            int sy = y * 480 / AI_HEIGHT;

            uint16_t p = cam[sy * 800 + sx];

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
        BSP_LCD_FillRect(
            0,
            350,
            200,
            100,
            80,
            LCD_COLOR_RGB565_RED
        );
    }
    else
    {
        BSP_LCD_FillRect(
            0,
            350,
            200,
            100,
            80,
            LCD_COLOR_RGB565_GREEN
        );
    }
}
