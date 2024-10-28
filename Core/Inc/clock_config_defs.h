#ifndef CLOCK_CONFIG_DEFS_H
#define CLOCK_CONFIG_DEFS_H

#define SYSCLK_FREQUENCY_HZ     72000000
#define HCLK_FREQUENCY_HZ       72000000
#define PCLK1_FREQUENCY_HZ      36000000
#define PCLK2_FREQUENCY_HZ      72000000


// Add compile-time checks for configuration values
#if PCLK1_FREQUENCY_HZ > 36000000
    #error "PCLK1_FREQUENCY_HZ must not exceed 36000000 Hz. Please adjust the value in clock_config_defs.h."
#endif

#if SYSCLK_FREQUENCY_HZ > 80000000
    #error "SYSCLK_FREQUENCY_HZ must not exceed 80000000 Hz. Please adjust the value in clock_config_defs.h."
#endif

#if HCLK_FREQUENCY_HZ > 80000000
    #error "HCLK_FREQUENCY_HZ must not exceed 80000000 Hz. Please adjust the value in clock_config_defs.h."
#endif

#if PCLK2_FREQUENCY_HZ > 80000000
    #error "PCLK2_FREQUENCY_HZ must not exceed 80000000 Hz. Please adjust the value in clock_config_defs.h."
#endif


#endif // CLOCK_CONFIG_DEFS_H
