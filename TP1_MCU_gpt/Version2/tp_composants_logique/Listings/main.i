# 1 "main.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 363 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "main.c" 2
# 11 "main.c"
# 1 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include\\stm32f10x.h" 1
# 105 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include\\stm32f10x.h"
# 1 "./RTE/_Target_1\\RTE_Components.h" 1
# 106 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include\\stm32f10x.h" 2
# 175 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include\\stm32f10x.h"
typedef enum IRQn
{

  NonMaskableInt_IRQn = -14,
  MemoryManagement_IRQn = -12,
  BusFault_IRQn = -11,
  UsageFault_IRQn = -10,
  SVCall_IRQn = -5,
  DebugMonitor_IRQn = -4,
  PendSV_IRQn = -2,
  SysTick_IRQn = -1,


  WWDG_IRQn = 0,
  PVD_IRQn = 1,
  TAMPER_IRQn = 2,
  RTC_IRQn = 3,
  FLASH_IRQn = 4,
  RCC_IRQn = 5,
  EXTI0_IRQn = 6,
  EXTI1_IRQn = 7,
  EXTI2_IRQn = 8,
  EXTI3_IRQn = 9,
  EXTI4_IRQn = 10,
  DMA1_Channel1_IRQn = 11,
  DMA1_Channel2_IRQn = 12,
  DMA1_Channel3_IRQn = 13,
  DMA1_Channel4_IRQn = 14,
  DMA1_Channel5_IRQn = 15,
  DMA1_Channel6_IRQn = 16,
  DMA1_Channel7_IRQn = 17,
# 252 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include\\stm32f10x.h"
  ADC1_2_IRQn = 18,
  USB_HP_CAN1_TX_IRQn = 19,
  USB_LP_CAN1_RX0_IRQn = 20,
  CAN1_RX1_IRQn = 21,
  CAN1_SCE_IRQn = 22,
  EXTI9_5_IRQn = 23,
  TIM1_BRK_IRQn = 24,
  TIM1_UP_IRQn = 25,
  TIM1_TRG_COM_IRQn = 26,
  TIM1_CC_IRQn = 27,
  TIM2_IRQn = 28,
  TIM3_IRQn = 29,
  TIM4_IRQn = 30,
  I2C1_EV_IRQn = 31,
  I2C1_ER_IRQn = 32,
  I2C2_EV_IRQn = 33,
  I2C2_ER_IRQn = 34,
  SPI1_IRQn = 35,
  SPI2_IRQn = 36,
  USART1_IRQn = 37,
  USART2_IRQn = 38,
  USART3_IRQn = 39,
  EXTI15_10_IRQn = 40,
  RTCAlarm_IRQn = 41,
  USBWakeUp_IRQn = 42
# 480 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include\\stm32f10x.h"
} IRQn_Type;






# 1 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 1
# 29 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3





# 1 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 1 3
# 56 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 3
typedef signed char int8_t;
typedef signed short int int16_t;
typedef signed int int32_t;
typedef signed long long int int64_t;


typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long int uint64_t;





typedef signed char int_least8_t;
typedef signed short int int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long int uint_least64_t;




typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long int uint_fast64_t;






typedef signed int intptr_t;
typedef unsigned int uintptr_t;



typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
# 35 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 2 3
# 63 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
# 1 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_version.h" 1 3
# 29 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_version.h" 3
# 64 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 2 3
# 115 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
# 1 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_compiler.h" 1 3
# 47 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_compiler.h" 3
# 1 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 1 3
# 31 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3


# 1 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 1 3







# 1 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 1 3
# 35 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ void __attribute__((__always_inline__, __nodebug__)) __wfi(void) {
  __builtin_arm_wfi();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __wfe(void) {
  __builtin_arm_wfe();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __sev(void) {
  __builtin_arm_sev();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __sevl(void) {
  __builtin_arm_sevl();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __yield(void) {
  __builtin_arm_yield();
}







static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__swp(uint32_t __x, volatile uint32_t *__p) {
  uint32_t v;
  do
    v = __builtin_arm_ldrex(__p);
  while (__builtin_arm_strex(__x, __p));
  return v;
}
# 95 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ void __attribute__((__always_inline__, __nodebug__)) __nop(void) {
  __builtin_arm_nop();
}





static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__ror(uint32_t __x, uint32_t __y) {
  __y %= 32;
  if (__y == 0)
    return __x;
  return (__x >> __y) | (__x << (32 - __y));
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rorll(uint64_t __x, uint32_t __y) {
  __y %= 64;
  if (__y == 0)
    return __x;
  return (__x >> __y) | (__x << (64 - __y));
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rorl(unsigned long __x, uint32_t __y) {

  return __ror(__x, __y);



}



static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__clz(uint32_t __t) {
  return __builtin_clz(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__clzl(unsigned long __t) {
  return __builtin_clzl(__t);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__clzll(uint64_t __t) {
  return __builtin_clzll(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__cls(uint32_t __t) {
  return __builtin_arm_cls(__t);
}

static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__clsl(unsigned long __t) {

  return __builtin_arm_cls(__t);



}

static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__clsll(uint64_t __t) {
  return __builtin_arm_cls64(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rev(uint32_t __t) {
  return __builtin_bswap32(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__revl(unsigned long __t) {

  return __builtin_bswap32(__t);



}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__revll(uint64_t __t) {
  return __builtin_bswap64(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rev16(uint32_t __t) {
  return __ror(__rev(__t), 16);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rev16ll(uint64_t __t) {
  return (((uint64_t)__rev16(__t >> 32)) << 32) | __rev16(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rev16l(unsigned long __t) {

    return __rev16(__t);



}


static __inline__ int16_t __attribute__((__always_inline__, __nodebug__))
__revsh(int16_t __t) {
  return __builtin_bswap16(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rbit(uint32_t __t) {
  return __builtin_arm_rbit(__t);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rbitll(uint64_t __t) {

  return (((uint64_t)__builtin_arm_rbit(__t)) << 32) |
         __builtin_arm_rbit(__t >> 32);



}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rbitl(unsigned long __t) {

  return __rbit(__t);



}
# 9 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 2 3
# 41 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__disable_fiq(void) {
  unsigned int cpsr;

  __asm__ __volatile__("mrs %[cpsr], faultmask\n"
                       "cpsid f\n"
                       : [cpsr] "=r"(cpsr));
  return cpsr & 0x1;
# 63 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}


static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__disable_irq(void) {
  unsigned int cpsr;


  __asm__ __volatile__("mrs %[cpsr], primask\n"
                       "cpsid i\n"
                       : [cpsr] "=r"(cpsr));
  return cpsr & 0x1;
# 90 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}







static __inline__ void __attribute__((__always_inline__, __nodebug__))
__enable_fiq(void) {

  __asm__ __volatile__("cpsie f");
# 110 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}


static __inline__ void __attribute__((__always_inline__, __nodebug__))
__enable_irq(void) {

  __asm__ __volatile__("cpsie i");
# 125 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __force_stores(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static void __attribute__((__always_inline__, __nodebug__)) __memory_changed(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static void __attribute__((__always_inline__, __nodebug__)) __schedule_barrier(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static __inline__ int __attribute__((__always_inline__, __nodebug__))
__semihost(int val, const void *ptr) {
  register int v __asm__("r0") = val;
  register const void *p __asm__("r1") = ptr;
  __asm__ __volatile__(


      "bkpt 0xab"
# 161 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
      : "+r"(v), "+r"(p)
      :
      : "memory", "cc");
  return v;
}
# 182 "C:\\Keil_v5\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
static __inline__ unsigned int __attribute__((
    unavailable("intrinsic not supported for targets without floating point")))
__vfp_status(unsigned int mask, unsigned int flags);
# 34 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 2 3
# 68 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed)) T_UINT32 { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT16_WRITE { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT16_READ { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT32_WRITE { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT32_READ { uint32_t v; };
#pragma clang diagnostic pop
# 166 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}
# 196 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
}
# 220 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_PSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, psp" : "=r" (result) );
  return(result);
}
# 292 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}
# 316 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_MSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, msp" : "=r" (result) );
  return(result);
}
# 346 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}
# 397 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) );
  return(result);
}
# 427 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 471 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_BASEPRI(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, basepri" : "=r" (result) );
  return(result);
}
# 501 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI(uint32_t basePri)
{
  __asm volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}
# 526 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI_MAX(uint32_t basePri)
{
  __asm volatile ("MSR basepri_max, %0" : : "r" (basePri) : "memory");
}







__attribute__((always_inline)) static __inline uint32_t __get_FAULTMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, faultmask" : "=r" (result) );
  return(result);
}
# 567 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  __asm volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}
# 914 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  op2 %= 32U;
  if (op2 == 0U)
  {
    return op1;
  }
  return (op1 >> op2) | (op1 << (32U - op2));
}
# 949 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __CLZ(uint32_t value)
{
# 960 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
  if (value == 0U)
  {
    return 32U;
  }
  return __builtin_clz(value);
}
# 1079 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __RRX(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rrx %0, %1" : "=r" (result) : "r" (value) );
  return(result);
}
# 1094 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __LDRBT(volatile uint8_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrbt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint8_t) result);
}
# 1109 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint16_t __LDRHT(volatile uint16_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrht %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint16_t) result);
}
# 1124 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __LDRT(volatile uint32_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return(result);
}
# 1139 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRBT(uint8_t value, volatile uint8_t *ptr)
{
  __asm volatile ("strbt %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1151 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRHT(uint16_t value, volatile uint16_t *ptr)
{
  __asm volatile ("strht %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1163 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRT(uint32_t value, volatile uint32_t *ptr)
{
  __asm volatile ("strt %1, %0" : "=Q" (*ptr) : "r" (value) );
}
# 48 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include/cmsis_compiler.h" 2 3
# 116 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 2 3
# 211 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef union
{
  struct
  {
    uint32_t _reserved0:27;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} APSR_Type;
# 245 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:23;
  } b;
  uint32_t w;
} IPSR_Type;
# 263 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:1;
    uint32_t ICI_IT_1:6;
    uint32_t _reserved1:8;
    uint32_t T:1;
    uint32_t ICI_IT_2:2;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} xPSR_Type;
# 314 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef union
{
  struct
  {
    uint32_t nPRIV:1;
    uint32_t SPSEL:1;
    uint32_t _reserved1:30;
  } b;
  uint32_t w;
} CONTROL_Type;
# 345 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef struct
{
  volatile uint32_t ISER[8U];
        uint32_t RESERVED0[24U];
  volatile uint32_t ICER[8U];
        uint32_t RESERVED1[24U];
  volatile uint32_t ISPR[8U];
        uint32_t RESERVED2[24U];
  volatile uint32_t ICPR[8U];
        uint32_t RESERVED3[24U];
  volatile uint32_t IABR[8U];
        uint32_t RESERVED4[56U];
  volatile uint8_t IP[240U];
        uint32_t RESERVED5[644U];
  volatile uint32_t STIR;
} NVIC_Type;
# 379 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef struct
{
  volatile const uint32_t CPUID;
  volatile uint32_t ICSR;
  volatile uint32_t VTOR;
  volatile uint32_t AIRCR;
  volatile uint32_t SCR;
  volatile uint32_t CCR;
  volatile uint8_t SHP[12U];
  volatile uint32_t SHCSR;
  volatile uint32_t CFSR;
  volatile uint32_t HFSR;
  volatile uint32_t DFSR;
  volatile uint32_t MMFAR;
  volatile uint32_t BFAR;
  volatile uint32_t AFSR;
  volatile const uint32_t PFR[2U];
  volatile const uint32_t DFR;
  volatile const uint32_t ADR;
  volatile const uint32_t MMFR[4U];
  volatile const uint32_t ISAR[5U];
        uint32_t RESERVED0[5U];
  volatile uint32_t CPACR;
} SCB_Type;
# 660 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile const uint32_t ICTR;

  volatile uint32_t ACTLR;



} SCnSCB_Type;
# 706 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t LOAD;
  volatile uint32_t VAL;
  volatile const uint32_t CALIB;
} SysTick_Type;
# 758 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef struct
{
  volatile union
  {
    volatile uint8_t u8;
    volatile uint16_t u16;
    volatile uint32_t u32;
  } PORT [32U];
        uint32_t RESERVED0[864U];
  volatile uint32_t TER;
        uint32_t RESERVED1[15U];
  volatile uint32_t TPR;
        uint32_t RESERVED2[15U];
  volatile uint32_t TCR;
        uint32_t RESERVED3[32U];
        uint32_t RESERVED4[43U];
  volatile uint32_t LAR;
  volatile const uint32_t LSR;
        uint32_t RESERVED5[6U];
  volatile const uint32_t PID4;
  volatile const uint32_t PID5;
  volatile const uint32_t PID6;
  volatile const uint32_t PID7;
  volatile const uint32_t PID0;
  volatile const uint32_t PID1;
  volatile const uint32_t PID2;
  volatile const uint32_t PID3;
  volatile const uint32_t CID0;
  volatile const uint32_t CID1;
  volatile const uint32_t CID2;
  volatile const uint32_t CID3;
} ITM_Type;
# 846 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t CYCCNT;
  volatile uint32_t CPICNT;
  volatile uint32_t EXCCNT;
  volatile uint32_t SLEEPCNT;
  volatile uint32_t LSUCNT;
  volatile uint32_t FOLDCNT;
  volatile const uint32_t PCSR;
  volatile uint32_t COMP0;
  volatile uint32_t MASK0;
  volatile uint32_t FUNCTION0;
        uint32_t RESERVED0[1U];
  volatile uint32_t COMP1;
  volatile uint32_t MASK1;
  volatile uint32_t FUNCTION1;
        uint32_t RESERVED1[1U];
  volatile uint32_t COMP2;
  volatile uint32_t MASK2;
  volatile uint32_t FUNCTION2;
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP3;
  volatile uint32_t MASK3;
  volatile uint32_t FUNCTION3;
} DWT_Type;
# 993 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef struct
{
  volatile const uint32_t SSPSR;
  volatile uint32_t CSPSR;
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;
        uint32_t RESERVED2[131U];
  volatile const uint32_t FFSR;
  volatile uint32_t FFCR;
  volatile const uint32_t FSCR;
        uint32_t RESERVED3[759U];
  volatile const uint32_t TRIGGER;
  volatile const uint32_t FIFO0;
  volatile const uint32_t ITATBCTR2;
        uint32_t RESERVED4[1U];
  volatile const uint32_t ITATBCTR0;
  volatile const uint32_t FIFO1;
  volatile uint32_t ITCTRL;
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;
  volatile uint32_t CLAIMCLR;
        uint32_t RESERVED7[8U];
  volatile const uint32_t DEVID;
  volatile const uint32_t DEVTYPE;
} TPI_Type;
# 1251 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
typedef struct
{
  volatile uint32_t DHCSR;
  volatile uint32_t DCRSR;
  volatile uint32_t DCRDR;
  volatile uint32_t DEMCR;
} CoreDebug_Type;
# 1477 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline void __NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);

  reg_value = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;
  reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));
  reg_value = (reg_value |
                ((uint32_t)0x5FAUL << 16U) |
                (PriorityGroupTmp << 8U) );
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = reg_value;
}







static __inline uint32_t __NVIC_GetPriorityGrouping(void)
{
  return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
}
# 1508 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline void __NVIC_EnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    __asm volatile("":::"memory");
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __asm volatile("":::"memory");
  }
}
# 1527 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline uint32_t __NVIC_GetEnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1546 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline void __NVIC_DisableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);
  }
}
# 1565 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline uint32_t __NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1584 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1599 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline void __NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1616 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline uint32_t __NVIC_GetActive(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1638 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline void __NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] = (uint8_t)((priority << (8U - 4)) & (uint32_t)0xFFUL);
  }
  else
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8U - 4)) & (uint32_t)0xFFUL);
  }
}
# 1660 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline uint32_t __NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) >= 0)
  {
    return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] >> (8U - 4)));
  }
  else
  {
    return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] >> (8U - 4)));
  }
}
# 1685 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4)) ? (uint32_t)(4) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority & (uint32_t)((1UL << (SubPriorityBits )) - 1UL)))
         );
}
# 1712 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4)) ? (uint32_t)(4) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority = (Priority ) & (uint32_t)((1UL << (SubPriorityBits )) - 1UL);
}
# 1735 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline void __NVIC_SetVector(IRQn_Type IRQn, uint32_t vector)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  vectors[(int32_t)IRQn + 16] = vector;

}
# 1751 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline uint32_t __NVIC_GetVector(IRQn_Type IRQn)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  return vectors[(int32_t)IRQn + 16];
}






__attribute__((__noreturn__)) static __inline void __NVIC_SystemReset(void)
{
  __builtin_arm_dsb(0xF);

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = (uint32_t)((0x5FAUL << 16U) |
                           (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
                            (1UL << 2U) );
  __builtin_arm_dsb(0xF);

  for(;;)
  {
    __builtin_arm_nop();
  }
}
# 1805 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline uint32_t SCB_GetFPUType(void)
{
    return 0U;
}
# 1836 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)(ticks - 1UL);
  __NVIC_SetPriority (SysTick_IRQn, (1UL << 4) - 1UL);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
                   (1UL << 1U) |
                   (1UL );
  return (0UL);
}
# 1866 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
extern volatile int32_t ITM_RxBuffer;
# 1878 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&
      ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL ) != 0UL) )
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
    {
      __builtin_arm_nop();
    }
    ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (uint8_t)ch;
  }
  return (ch);
}
# 1899 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline int32_t ITM_ReceiveChar (void)
{
  int32_t ch = -1;

  if (ITM_RxBuffer != ((int32_t)0x5AA55AA5U))
  {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = ((int32_t)0x5AA55AA5U);
  }

  return (ch);
}
# 1919 "C:/Users/elkat/AppData/Local/Arm/Packs/ARM/CMSIS/5.7.0/CMSIS/Core/Include\\core_cm3.h" 3
static __inline int32_t ITM_CheckChar (void)
{

  if (ITM_RxBuffer == ((int32_t)0x5AA55AA5U))
  {
    return (0);
  }
  else
  {
    return (1);
  }
}
# 487 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include\\stm32f10x.h" 2
# 1 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include/system_stm32f10x.h" 1
# 52 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include/system_stm32f10x.h"
extern uint32_t SystemCoreClock;
# 78 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include/system_stm32f10x.h"
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);
# 488 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include\\stm32f10x.h" 2







typedef int32_t s32;
typedef int16_t s16;
typedef int8_t s8;

typedef const int32_t sc32;
typedef const int16_t sc16;
typedef const int8_t sc8;

typedef volatile int32_t vs32;
typedef volatile int16_t vs16;
typedef volatile int8_t vs8;

typedef volatile const int32_t vsc32;
typedef volatile const int16_t vsc16;
typedef volatile const int8_t vsc8;

typedef uint32_t u32;
typedef uint16_t u16;
typedef uint8_t u8;

typedef const uint32_t uc32;
typedef const uint16_t uc16;
typedef const uint8_t uc8;

typedef volatile uint32_t vu32;
typedef volatile uint16_t vu16;
typedef volatile uint8_t vu8;

typedef volatile const uint32_t vuc32;
typedef volatile const uint16_t vuc16;
typedef volatile const uint8_t vuc8;

typedef enum {RESET = 0, SET = !RESET} FlagStatus, ITStatus;

typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;


typedef enum {ERROR = 0, SUCCESS = !ERROR} ErrorStatus;
# 550 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include\\stm32f10x.h"
typedef struct
{
  volatile uint32_t SR;
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SMPR1;
  volatile uint32_t SMPR2;
  volatile uint32_t JOFR1;
  volatile uint32_t JOFR2;
  volatile uint32_t JOFR3;
  volatile uint32_t JOFR4;
  volatile uint32_t HTR;
  volatile uint32_t LTR;
  volatile uint32_t SQR1;
  volatile uint32_t SQR2;
  volatile uint32_t SQR3;
  volatile uint32_t JSQR;
  volatile uint32_t JDR1;
  volatile uint32_t JDR2;
  volatile uint32_t JDR3;
  volatile uint32_t JDR4;
  volatile uint32_t DR;
} ADC_TypeDef;





typedef struct
{
  uint32_t RESERVED0;
  volatile uint16_t DR1;
  uint16_t RESERVED1;
  volatile uint16_t DR2;
  uint16_t RESERVED2;
  volatile uint16_t DR3;
  uint16_t RESERVED3;
  volatile uint16_t DR4;
  uint16_t RESERVED4;
  volatile uint16_t DR5;
  uint16_t RESERVED5;
  volatile uint16_t DR6;
  uint16_t RESERVED6;
  volatile uint16_t DR7;
  uint16_t RESERVED7;
  volatile uint16_t DR8;
  uint16_t RESERVED8;
  volatile uint16_t DR9;
  uint16_t RESERVED9;
  volatile uint16_t DR10;
  uint16_t RESERVED10;
  volatile uint16_t RTCCR;
  uint16_t RESERVED11;
  volatile uint16_t CR;
  uint16_t RESERVED12;
  volatile uint16_t CSR;
  uint16_t RESERVED13[5];
  volatile uint16_t DR11;
  uint16_t RESERVED14;
  volatile uint16_t DR12;
  uint16_t RESERVED15;
  volatile uint16_t DR13;
  uint16_t RESERVED16;
  volatile uint16_t DR14;
  uint16_t RESERVED17;
  volatile uint16_t DR15;
  uint16_t RESERVED18;
  volatile uint16_t DR16;
  uint16_t RESERVED19;
  volatile uint16_t DR17;
  uint16_t RESERVED20;
  volatile uint16_t DR18;
  uint16_t RESERVED21;
  volatile uint16_t DR19;
  uint16_t RESERVED22;
  volatile uint16_t DR20;
  uint16_t RESERVED23;
  volatile uint16_t DR21;
  uint16_t RESERVED24;
  volatile uint16_t DR22;
  uint16_t RESERVED25;
  volatile uint16_t DR23;
  uint16_t RESERVED26;
  volatile uint16_t DR24;
  uint16_t RESERVED27;
  volatile uint16_t DR25;
  uint16_t RESERVED28;
  volatile uint16_t DR26;
  uint16_t RESERVED29;
  volatile uint16_t DR27;
  uint16_t RESERVED30;
  volatile uint16_t DR28;
  uint16_t RESERVED31;
  volatile uint16_t DR29;
  uint16_t RESERVED32;
  volatile uint16_t DR30;
  uint16_t RESERVED33;
  volatile uint16_t DR31;
  uint16_t RESERVED34;
  volatile uint16_t DR32;
  uint16_t RESERVED35;
  volatile uint16_t DR33;
  uint16_t RESERVED36;
  volatile uint16_t DR34;
  uint16_t RESERVED37;
  volatile uint16_t DR35;
  uint16_t RESERVED38;
  volatile uint16_t DR36;
  uint16_t RESERVED39;
  volatile uint16_t DR37;
  uint16_t RESERVED40;
  volatile uint16_t DR38;
  uint16_t RESERVED41;
  volatile uint16_t DR39;
  uint16_t RESERVED42;
  volatile uint16_t DR40;
  uint16_t RESERVED43;
  volatile uint16_t DR41;
  uint16_t RESERVED44;
  volatile uint16_t DR42;
  uint16_t RESERVED45;
} BKP_TypeDef;





typedef struct
{
  volatile uint32_t TIR;
  volatile uint32_t TDTR;
  volatile uint32_t TDLR;
  volatile uint32_t TDHR;
} CAN_TxMailBox_TypeDef;





typedef struct
{
  volatile uint32_t RIR;
  volatile uint32_t RDTR;
  volatile uint32_t RDLR;
  volatile uint32_t RDHR;
} CAN_FIFOMailBox_TypeDef;





typedef struct
{
  volatile uint32_t FR1;
  volatile uint32_t FR2;
} CAN_FilterRegister_TypeDef;





typedef struct
{
  volatile uint32_t MCR;
  volatile uint32_t MSR;
  volatile uint32_t TSR;
  volatile uint32_t RF0R;
  volatile uint32_t RF1R;
  volatile uint32_t IER;
  volatile uint32_t ESR;
  volatile uint32_t BTR;
  uint32_t RESERVED0[88];
  CAN_TxMailBox_TypeDef sTxMailBox[3];
  CAN_FIFOMailBox_TypeDef sFIFOMailBox[2];
  uint32_t RESERVED1[12];
  volatile uint32_t FMR;
  volatile uint32_t FM1R;
  uint32_t RESERVED2;
  volatile uint32_t FS1R;
  uint32_t RESERVED3;
  volatile uint32_t FFA1R;
  uint32_t RESERVED4;
  volatile uint32_t FA1R;
  uint32_t RESERVED5[8];

  CAN_FilterRegister_TypeDef sFilterRegister[14];



} CAN_TypeDef;




typedef struct
{
  volatile uint32_t CFGR;
  volatile uint32_t OAR;
  volatile uint32_t PRES;
  volatile uint32_t ESR;
  volatile uint32_t CSR;
  volatile uint32_t TXD;
  volatile uint32_t RXD;
} CEC_TypeDef;





typedef struct
{
  volatile uint32_t DR;
  volatile uint8_t IDR;
  uint8_t RESERVED0;
  uint16_t RESERVED1;
  volatile uint32_t CR;
} CRC_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t SWTRIGR;
  volatile uint32_t DHR12R1;
  volatile uint32_t DHR12L1;
  volatile uint32_t DHR8R1;
  volatile uint32_t DHR12R2;
  volatile uint32_t DHR12L2;
  volatile uint32_t DHR8R2;
  volatile uint32_t DHR12RD;
  volatile uint32_t DHR12LD;
  volatile uint32_t DHR8RD;
  volatile uint32_t DOR1;
  volatile uint32_t DOR2;



} DAC_TypeDef;





typedef struct
{
  volatile uint32_t IDCODE;
  volatile uint32_t CR;
}DBGMCU_TypeDef;





typedef struct
{
  volatile uint32_t CCR;
  volatile uint32_t CNDTR;
  volatile uint32_t CPAR;
  volatile uint32_t CMAR;
} DMA_Channel_TypeDef;

typedef struct
{
  volatile uint32_t ISR;
  volatile uint32_t IFCR;
} DMA_TypeDef;





typedef struct
{
  volatile uint32_t MACCR;
  volatile uint32_t MACFFR;
  volatile uint32_t MACHTHR;
  volatile uint32_t MACHTLR;
  volatile uint32_t MACMIIAR;
  volatile uint32_t MACMIIDR;
  volatile uint32_t MACFCR;
  volatile uint32_t MACVLANTR;
       uint32_t RESERVED0[2];
  volatile uint32_t MACRWUFFR;
  volatile uint32_t MACPMTCSR;
       uint32_t RESERVED1[2];
  volatile uint32_t MACSR;
  volatile uint32_t MACIMR;
  volatile uint32_t MACA0HR;
  volatile uint32_t MACA0LR;
  volatile uint32_t MACA1HR;
  volatile uint32_t MACA1LR;
  volatile uint32_t MACA2HR;
  volatile uint32_t MACA2LR;
  volatile uint32_t MACA3HR;
  volatile uint32_t MACA3LR;
       uint32_t RESERVED2[40];
  volatile uint32_t MMCCR;
  volatile uint32_t MMCRIR;
  volatile uint32_t MMCTIR;
  volatile uint32_t MMCRIMR;
  volatile uint32_t MMCTIMR;
       uint32_t RESERVED3[14];
  volatile uint32_t MMCTGFSCCR;
  volatile uint32_t MMCTGFMSCCR;
       uint32_t RESERVED4[5];
  volatile uint32_t MMCTGFCR;
       uint32_t RESERVED5[10];
  volatile uint32_t MMCRFCECR;
  volatile uint32_t MMCRFAECR;
       uint32_t RESERVED6[10];
  volatile uint32_t MMCRGUFCR;
       uint32_t RESERVED7[334];
  volatile uint32_t PTPTSCR;
  volatile uint32_t PTPSSIR;
  volatile uint32_t PTPTSHR;
  volatile uint32_t PTPTSLR;
  volatile uint32_t PTPTSHUR;
  volatile uint32_t PTPTSLUR;
  volatile uint32_t PTPTSAR;
  volatile uint32_t PTPTTHR;
  volatile uint32_t PTPTTLR;
       uint32_t RESERVED8[567];
  volatile uint32_t DMABMR;
  volatile uint32_t DMATPDR;
  volatile uint32_t DMARPDR;
  volatile uint32_t DMARDLAR;
  volatile uint32_t DMATDLAR;
  volatile uint32_t DMASR;
  volatile uint32_t DMAOMR;
  volatile uint32_t DMAIER;
  volatile uint32_t DMAMFBOCR;
       uint32_t RESERVED9[9];
  volatile uint32_t DMACHTDR;
  volatile uint32_t DMACHRDR;
  volatile uint32_t DMACHTBAR;
  volatile uint32_t DMACHRBAR;
} ETH_TypeDef;





typedef struct
{
  volatile uint32_t IMR;
  volatile uint32_t EMR;
  volatile uint32_t RTSR;
  volatile uint32_t FTSR;
  volatile uint32_t SWIER;
  volatile uint32_t PR;
} EXTI_TypeDef;





typedef struct
{
  volatile uint32_t ACR;
  volatile uint32_t KEYR;
  volatile uint32_t OPTKEYR;
  volatile uint32_t SR;
  volatile uint32_t CR;
  volatile uint32_t AR;
  volatile uint32_t RESERVED;
  volatile uint32_t OBR;
  volatile uint32_t WRPR;
# 928 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include\\stm32f10x.h"
} FLASH_TypeDef;





typedef struct
{
  volatile uint16_t RDP;
  volatile uint16_t USER;
  volatile uint16_t Data0;
  volatile uint16_t Data1;
  volatile uint16_t WRP0;
  volatile uint16_t WRP1;
  volatile uint16_t WRP2;
  volatile uint16_t WRP3;
} OB_TypeDef;





typedef struct
{
  volatile uint32_t BTCR[8];
} FSMC_Bank1_TypeDef;





typedef struct
{
  volatile uint32_t BWTR[7];
} FSMC_Bank1E_TypeDef;





typedef struct
{
  volatile uint32_t PCR2;
  volatile uint32_t SR2;
  volatile uint32_t PMEM2;
  volatile uint32_t PATT2;
  uint32_t RESERVED0;
  volatile uint32_t ECCR2;
} FSMC_Bank2_TypeDef;





typedef struct
{
  volatile uint32_t PCR3;
  volatile uint32_t SR3;
  volatile uint32_t PMEM3;
  volatile uint32_t PATT3;
  uint32_t RESERVED0;
  volatile uint32_t ECCR3;
} FSMC_Bank3_TypeDef;





typedef struct
{
  volatile uint32_t PCR4;
  volatile uint32_t SR4;
  volatile uint32_t PMEM4;
  volatile uint32_t PATT4;
  volatile uint32_t PIO4;
} FSMC_Bank4_TypeDef;





typedef struct
{
  volatile uint32_t CRL;
  volatile uint32_t CRH;
  volatile uint32_t IDR;
  volatile uint32_t ODR;
  volatile uint32_t BSRR;
  volatile uint32_t BRR;
  volatile uint32_t LCKR;
} GPIO_TypeDef;





typedef struct
{
  volatile uint32_t EVCR;
  volatile uint32_t MAPR;
  volatile uint32_t EXTICR[4];
  uint32_t RESERVED0;
  volatile uint32_t MAPR2;
} AFIO_TypeDef;




typedef struct
{
  volatile uint16_t CR1;
  uint16_t RESERVED0;
  volatile uint16_t CR2;
  uint16_t RESERVED1;
  volatile uint16_t OAR1;
  uint16_t RESERVED2;
  volatile uint16_t OAR2;
  uint16_t RESERVED3;
  volatile uint16_t DR;
  uint16_t RESERVED4;
  volatile uint16_t SR1;
  uint16_t RESERVED5;
  volatile uint16_t SR2;
  uint16_t RESERVED6;
  volatile uint16_t CCR;
  uint16_t RESERVED7;
  volatile uint16_t TRISE;
  uint16_t RESERVED8;
} I2C_TypeDef;





typedef struct
{
  volatile uint32_t KR;
  volatile uint32_t PR;
  volatile uint32_t RLR;
  volatile uint32_t SR;
} IWDG_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CSR;
} PWR_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CFGR;
  volatile uint32_t CIR;
  volatile uint32_t APB2RSTR;
  volatile uint32_t APB1RSTR;
  volatile uint32_t AHBENR;
  volatile uint32_t APB2ENR;
  volatile uint32_t APB1ENR;
  volatile uint32_t BDCR;
  volatile uint32_t CSR;
# 1106 "C:/Users/elkat/AppData/Local/Arm/Packs/Keil/STM32F1xx_DFP/2.4.1/Device/Include\\stm32f10x.h"
} RCC_TypeDef;





typedef struct
{
  volatile uint16_t CRH;
  uint16_t RESERVED0;
  volatile uint16_t CRL;
  uint16_t RESERVED1;
  volatile uint16_t PRLH;
  uint16_t RESERVED2;
  volatile uint16_t PRLL;
  uint16_t RESERVED3;
  volatile uint16_t DIVH;
  uint16_t RESERVED4;
  volatile uint16_t DIVL;
  uint16_t RESERVED5;
  volatile uint16_t CNTH;
  uint16_t RESERVED6;
  volatile uint16_t CNTL;
  uint16_t RESERVED7;
  volatile uint16_t ALRH;
  uint16_t RESERVED8;
  volatile uint16_t ALRL;
  uint16_t RESERVED9;
} RTC_TypeDef;





typedef struct
{
  volatile uint32_t POWER;
  volatile uint32_t CLKCR;
  volatile uint32_t ARG;
  volatile uint32_t CMD;
  volatile const uint32_t RESPCMD;
  volatile const uint32_t RESP1;
  volatile const uint32_t RESP2;
  volatile const uint32_t RESP3;
  volatile const uint32_t RESP4;
  volatile uint32_t DTIMER;
  volatile uint32_t DLEN;
  volatile uint32_t DCTRL;
  volatile const uint32_t DCOUNT;
  volatile const uint32_t STA;
  volatile uint32_t ICR;
  volatile uint32_t MASK;
  uint32_t RESERVED0[2];
  volatile const uint32_t FIFOCNT;
  uint32_t RESERVED1[13];
  volatile uint32_t FIFO;
} SDIO_TypeDef;





typedef struct
{
  volatile uint16_t CR1;
  uint16_t RESERVED0;
  volatile uint16_t CR2;
  uint16_t RESERVED1;
  volatile uint16_t SR;
  uint16_t RESERVED2;
  volatile uint16_t DR;
  uint16_t RESERVED3;
  volatile uint16_t CRCPR;
  uint16_t RESERVED4;
  volatile uint16_t RXCRCR;
  uint16_t RESERVED5;
  volatile uint16_t TXCRCR;
  uint16_t RESERVED6;
  volatile uint16_t I2SCFGR;
  uint16_t RESERVED7;
  volatile uint16_t I2SPR;
  uint16_t RESERVED8;
} SPI_TypeDef;





typedef struct
{
  volatile uint16_t CR1;
  uint16_t RESERVED0;
  volatile uint16_t CR2;
  uint16_t RESERVED1;
  volatile uint16_t SMCR;
  uint16_t RESERVED2;
  volatile uint16_t DIER;
  uint16_t RESERVED3;
  volatile uint16_t SR;
  uint16_t RESERVED4;
  volatile uint16_t EGR;
  uint16_t RESERVED5;
  volatile uint16_t CCMR1;
  uint16_t RESERVED6;
  volatile uint16_t CCMR2;
  uint16_t RESERVED7;
  volatile uint16_t CCER;
  uint16_t RESERVED8;
  volatile uint16_t CNT;
  uint16_t RESERVED9;
  volatile uint16_t PSC;
  uint16_t RESERVED10;
  volatile uint16_t ARR;
  uint16_t RESERVED11;
  volatile uint16_t RCR;
  uint16_t RESERVED12;
  volatile uint16_t CCR1;
  uint16_t RESERVED13;
  volatile uint16_t CCR2;
  uint16_t RESERVED14;
  volatile uint16_t CCR3;
  uint16_t RESERVED15;
  volatile uint16_t CCR4;
  uint16_t RESERVED16;
  volatile uint16_t BDTR;
  uint16_t RESERVED17;
  volatile uint16_t DCR;
  uint16_t RESERVED18;
  volatile uint16_t DMAR;
  uint16_t RESERVED19;
} TIM_TypeDef;





typedef struct
{
  volatile uint16_t SR;
  uint16_t RESERVED0;
  volatile uint16_t DR;
  uint16_t RESERVED1;
  volatile uint16_t BRR;
  uint16_t RESERVED2;
  volatile uint16_t CR1;
  uint16_t RESERVED3;
  volatile uint16_t CR2;
  uint16_t RESERVED4;
  volatile uint16_t CR3;
  uint16_t RESERVED5;
  volatile uint16_t GTPR;
  uint16_t RESERVED6;
} USART_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CFR;
  volatile uint32_t SR;
} WWDG_TypeDef;
# 12 "main.c" 2
# 37 "main.c"
typedef enum
{
    GPIO_INPUT_ANALOG = 0x0,
    GPIO_INPUT_FLOATING = 0x4,
    GPIO_INPUT_PULL = 0x8,
    GPIO_OUTPUT_PP_10MHZ = 0x1,
    GPIO_OUTPUT_PP_2MHZ = 0x2,
    GPIO_OUTPUT_PP_50MHZ = 0x3,
    GPIO_OUTPUT_OD_10MHZ = 0x5,
    GPIO_OUTPUT_OD_2MHZ = 0x6,
    GPIO_OUTPUT_OD_50MHZ = 0x7,
    GPIO_AF_PP_10MHZ = 0x9,
    GPIO_AF_PP_2MHZ = 0xA,
    GPIO_AF_PP_50MHZ = 0xB,
    GPIO_AF_OD_10MHZ = 0xD,
    GPIO_AF_OD_2MHZ = 0xE,
    GPIO_AF_OD_50MHZ = 0xF
} GPIO_Config_t;

typedef enum
{
    GPIO_LOW = 0,
    GPIO_HIGH = 1
} GPIO_State_t;


static volatile uint8_t MaeRcp = 0;
static volatile uint8_t entete = 0;
static volatile uint8_t octets_recus[4];
static volatile uint8_t commande_casiers[4];
static volatile uint8_t commande_zif[4];
static volatile uint8_t casiers_prets = 0;
static volatile uint8_t zif_pret = 0;


static uint8_t Fifo[16U];
static uint8_t IwFifo = 0;
static uint8_t IrFifo = 0;
static uint8_t FifoLibre = 16U;
static volatile uint8_t pcfs_initialises = 0;

static const uint8_t adresses_leds[2U] = {
    ((0x2 << 4) | 0b000), ((0x2 << 4) | 0b001)};


void GPIO_InitPin(GPIO_TypeDef *port, uint8_t pin,
                  GPIO_Config_t config, GPIO_State_t etat)
{
    volatile uint32_t *registre;
    uint32_t decalage;
    uint32_t masque;

    if (pin > 15U || (uint32_t)config > 15U)
        return;

    if (port == ((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0800)))
        ((RCC_TypeDef *) ((((uint32_t)0x40000000) + 0x20000) + 0x1000))->APB2ENR |= ((uint32_t)0x00000004);
    else if (port == ((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)))
        ((RCC_TypeDef *) ((((uint32_t)0x40000000) + 0x20000) + 0x1000))->APB2ENR |= ((uint32_t)0x00000008);
    else if (port == ((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x1000)))
        ((RCC_TypeDef *) ((((uint32_t)0x40000000) + 0x20000) + 0x1000))->APB2ENR |= ((uint32_t)0x00000010);
    else
        return;

    registre = (pin < 8U) ? &port->CRL : &port->CRH;
    decalage = ((uint32_t)pin % 8U) * 4U;
    masque = 0xFU << decalage;



    if (config == GPIO_INPUT_PULL)
    {
        *registre = (*registre & ~masque) | (0x4U << decalage);
    }

    if (etat == GPIO_HIGH)
        port->BSRR = 1U << pin;
    else
        port->BRR = 1U << pin;

    *registre = (*registre & ~masque) | ((uint32_t)config << decalage);
}

static void GPIO_Ecrire(GPIO_TypeDef *port, uint8_t pin, uint8_t niveau)
{
    if (niveau)
        port->BSRR = 1U << pin;
    else
        port->BRR = 1U << pin;
}


static void delay_us(uint32_t us)
{
    uint32_t ticks;
    if (us == 0U)
        return;
    ticks = (SystemCoreClock / 1000000U) * us;
    if (ticks == 0U || ticks > 0x1000000U)
        return;

    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = 0U;
    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = ticks - 1U;
    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0U;
    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) | (1UL );
    while ((((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL & (1UL << 16U)) == 0U)
    {
    }
    ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = 0U;
}
void delay_ms(uint32_t ms)
{
    for (uint32_t i = 0; i < ms; i++)
    {
        delay_us(1000);
    }
}




static void ZIF_Config(uint16_t directions, uint16_t niveaux)
{
    uint8_t i;
    GPIO_TypeDef *port;
    uint8_t pin;


    for (i = 0; i < 16U; i++)
    {
        port = (i < 8U) ? ((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x1000)) : ((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00));
        pin = i;
        GPIO_InitPin(port, pin, GPIO_INPUT_FLOATING, GPIO_LOW);
    }

    for (i = 0; i < 16U; i++)
    {
        port = (i < 8U) ? ((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x1000)) : ((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00));
        pin = i;
        if (directions & (1U << i))
        {
            GPIO_InitPin(port, pin, GPIO_INPUT_PULL,
                         (niveaux & (1U << i)) ? GPIO_HIGH : GPIO_LOW);
        }
        else
        {
            GPIO_InitPin(port, pin, GPIO_OUTPUT_PP_2MHZ,
                         (niveaux & (1U << i)) ? GPIO_HIGH : GPIO_LOW);
        }
    }
}

static uint16_t ZIF_Lire(void)
{
    uint16_t broches_PC = (uint16_t)(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x1000))->IDR & 0x00FFU);
    uint16_t broches_PB = (uint16_t)(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00))->IDR & 0xFF00U);
    return (uint16_t)(broches_PB | broches_PC);
}


static uint8_t ZIF_DirectionsValides(uint16_t directions)
{
    uint8_t sorties = 0;
    uint8_t i;
    for (i = 0; i < 16U; i++)
    {
        if ((directions & (1U << i)) == 0U)
            sorties++;
    }
    return (uint8_t)(sorties <= 2U);
}


static void I2C_Init(void)
{

    GPIO_InitPin(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 6U, GPIO_OUTPUT_OD_2MHZ, GPIO_HIGH);
    GPIO_InitPin(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 7U, GPIO_OUTPUT_OD_2MHZ, GPIO_HIGH);
}

static void I2C_Start(void)
{
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 7U, 1);
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 6U, 1);
    delay_us(5);
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 7U, 0);
    delay_us(5);
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 6U, 0);
}

static void I2C_Stop(void)
{
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 7U, 0);
    delay_us(5);
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 6U, 1);
    delay_us(5);
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 7U, 1);
    delay_us(5);
}

static void I2C_EcrireBit(uint8_t bit)
{
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 7U, bit);
    delay_us(5);
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 6U, 1);
    delay_us(5);
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 6U, 0);
    delay_us(5);
}

static uint8_t I2C_LireBit(void)
{
    uint8_t bit;
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 7U, 1);
    delay_us(5);
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 6U, 1);
    delay_us(5);
    bit = (((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00))->IDR & (1U << 7U)) ? 1U : 0U;
    GPIO_Ecrire(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0C00)), 6U, 0);
    delay_us(5);
    return bit;
}


static uint8_t I2C_EcrireOctet(uint8_t valeur)
{
    int8_t i;
    for (i = 7; i >= 0; i--)
        I2C_EcrireBit((uint8_t)((valeur >> i) & 1U));
    return (uint8_t)(I2C_LireBit() == 0U);
}


static uint8_t I2C_LireOctet(void)
{
    uint8_t valeur = 0;
    uint8_t i;
    for (i = 0; i < 8U; i++)
        valeur = (uint8_t)((valeur << 1) | I2C_LireBit());
    I2C_EcrireBit(1);
    return valeur;
}

static uint8_t PCF_Ecrire(uint8_t adresse, uint8_t valeur)
{
    uint8_t ok;
    I2C_Start();
    ok = I2C_EcrireOctet((uint8_t)(adresse << 1));
    if (ok)
        ok = I2C_EcrireOctet(valeur);
    I2C_Stop();
    return ok;
}

static uint8_t PCF_Lire(uint8_t adresse, uint8_t *valeur)
{
    uint8_t ok;
    I2C_Start();
    ok = I2C_EcrireOctet((uint8_t)((adresse << 1) | 1U));
    if (ok)
        *valeur = I2C_LireOctet();
    I2C_Stop();
    return ok;
}


static uint8_t Casiers_Initialiser(void)
{
    uint8_t i;
    uint8_t ok = 1;
    for (i = 0; i < 2U; i++)
        if (!PCF_Ecrire(adresses_leds[i], 0xFFU))
            ok = 0;


    if (!PCF_Ecrire(((0x2 << 4) | 0b011), 0b11111111))
        ok = 0;
    return ok;
}




static uint8_t LEDs_CalculerOctet(uint8_t numero_pcf,
                                  uint16_t vertes, uint16_t rouges)
{
    uint8_t etat = 0xFFU;
    uint8_t position;

    for (position = 0; position < 3U; position++)
    {
        uint8_t numero_led = numero_pcf * 3U + position;
        uint8_t bit_rouge = position * 2U;
        uint8_t bit_vert = bit_rouge + 1U;
        if (numero_led >= 6U)
            break;
        if (rouges & (1U << numero_led))
            etat &= (uint8_t)~(1U << bit_rouge);
        if (vertes & (1U << numero_led))
            etat &= (uint8_t)~(1U << bit_vert);
    }
    return etat;
}



static uint8_t Casiers_LEDs(uint16_t vertes, uint16_t rouges)
{
    uint8_t i;
    uint8_t ok = 1;

    for (i = 0; i < 2U; i++)
    {
        uint8_t octet = LEDs_CalculerOctet(i, vertes, rouges);
        if (!PCF_Ecrire(adresses_leds[i], octet))
            ok = 0;
    }
    return ok;
}


static uint8_t Casiers_Lire(uint16_t *etat)
{
    uint8_t bas;

    if (!PCF_Lire(((0x2 << 4) | 0b011), &bas))
        return 0;

    *etat = (uint16_t)bas;

    return 1;
}

static void UART_Init(void)
{
    uint32_t pclk1;
    uint32_t apb1;
    SystemCoreClockUpdate();
    ((RCC_TypeDef *) ((((uint32_t)0x40000000) + 0x20000) + 0x1000))->APB1ENR |= ((uint32_t)0x00020000);
    GPIO_InitPin(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0800)), 2, GPIO_AF_PP_2MHZ, GPIO_HIGH);
    GPIO_InitPin(((GPIO_TypeDef *) ((((uint32_t)0x40000000) + 0x10000) + 0x0800)), 3, GPIO_INPUT_FLOATING, GPIO_HIGH);


    apb1 = (((RCC_TypeDef *) ((((uint32_t)0x40000000) + 0x20000) + 0x1000))->CFGR >> 8) & 7U;
    pclk1 = SystemCoreClock;
    if (apb1 >= 4U)
        pclk1 >>= (apb1 - 3U);

    ((USART_TypeDef *) (((uint32_t)0x40000000) + 0x4400))->CR1 = 0U;
    ((USART_TypeDef *) (((uint32_t)0x40000000) + 0x4400))->CR2 = 0U;
    ((USART_TypeDef *) (((uint32_t)0x40000000) + 0x4400))->CR3 = 0U;
    ((USART_TypeDef *) (((uint32_t)0x40000000) + 0x4400))->BRR = (pclk1 + 9600U / 2U) / 9600U;
    ((USART_TypeDef *) (((uint32_t)0x40000000) + 0x4400))->CR1 = ((uint16_t)0x2000) | ((uint16_t)0x0008) | ((uint16_t)0x0004) |
                  ((uint16_t)0x0020);
    __NVIC_EnableIRQ(USART2_IRQn);
}


static uint8_t Reception_Reconstituer(uint8_t octet, uint8_t numero)
{
    return (uint8_t)((octet & 0x7FU) |
                     (((entete >> numero) & 1U) << 7));
}


void USART2_IRQHandler(void)
{
    uint32_t etat = ((USART_TypeDef *) (((uint32_t)0x40000000) + 0x4400))->SR;
    uint8_t octet;
    uint8_t i;

    if ((etat & (((uint16_t)0x0020) | ((uint16_t)0x0008) | ((uint16_t)0x0004) |
                 ((uint16_t)0x0002) | ((uint16_t)0x0001))) == 0U)
        return;
    octet = (uint8_t)((USART_TypeDef *) (((uint32_t)0x40000000) + 0x4400))->DR;

    if (etat & (((uint16_t)0x0008) | ((uint16_t)0x0004) | ((uint16_t)0x0002) | ((uint16_t)0x0001)))
    {
        MaeRcp = 0;
        return;
    }


    if (octet & 0x80U)
    {
        if (octet & 0x30U)
        {
            MaeRcp = 0;
            return;
        }
        entete = octet;
        MaeRcp = (octet & 0x40U) ? 1U : 5U;
        return;
    }

    switch (MaeRcp)
    {
    case 1:
    case 2:
    case 3:
    case 4:
        octets_recus[MaeRcp - 1U] = Reception_Reconstituer(octet, MaeRcp - 1U);
        if (MaeRcp == 4U)
        {
            for (i = 0; i < 4U; i++)
                commande_casiers[i] = octets_recus[i];
            casiers_prets = 1U;
            MaeRcp = 0U;
        }
        else
            MaeRcp++;
        break;

    case 5:
    case 6:
    case 7:
    case 8:
        octets_recus[MaeRcp - 5U] = Reception_Reconstituer(octet, MaeRcp - 5U);
        if (MaeRcp == 8U)
        {
            for (i = 0; i < 4U; i++)
                commande_zif[i] = octets_recus[i];
            zif_pret = 1U;
            MaeRcp = 0U;
        }
        else
            MaeRcp++;
        break;

    default:
        MaeRcp = 0U;
        break;
    }
}


static uint8_t FIFO_AjouterReponse(uint8_t type, uint16_t valeur)
{
    uint8_t fort = (uint8_t)(valeur >> 8);
    uint8_t faible = (uint8_t)valeur;
    uint8_t message[3];
    uint8_t i;

    if (FifoLibre < 3U)
        return 0;
    message[0] = (uint8_t)(type | ((fort >> 7) & 1U) |
                           (((faible >> 7) & 1U) << 1));
    message[1] = fort & 0x7FU;
    message[2] = faible & 0x7FU;

    for (i = 0; i < 3U; i++)
    {
        Fifo[IwFifo] = message[i];
        IwFifo = (uint8_t)((IwFifo + 1U) % 16U);
        FifoLibre--;
    }
    return 1;
}


static void FIFO_Emettre(void)
{
    if (FifoLibre < 16U && (((USART_TypeDef *) (((uint32_t)0x40000000) + 0x4400))->SR & ((uint16_t)0x0080)))
    {
        ((USART_TypeDef *) (((uint32_t)0x40000000) + 0x4400))->DR = Fifo[IrFifo];
        IrFifo = (uint8_t)((IrFifo + 1U) % 16U);
        FifoLibre++;
    }
}
void Allumer_Toutes_LEDs(uint8_t a_repeter)
{
    static int time = 1000;
    static uint8_t cpt = 0;
    while (cpt < a_repeter)
    {
        PCF_Ecrire(((0x2 << 4) | 0b000), 0b11111111);
        PCF_Ecrire(((0x2 << 4) | 0b001), 0b11111111);
        delay_ms(time);

        PCF_Ecrire(((0x2 << 4) | 0b000), 0b10101010);
        PCF_Ecrire(((0x2 << 4) | 0b001), 0b10101010);
        delay_ms(time);
        PCF_Ecrire(((0x2 << 4) | 0b000), 0b01010101);
        PCF_Ecrire(((0x2 << 4) | 0b001), 0b01010101);
        delay_ms(time);
        cpt += 1;
    }
}
void Maj_LEDs_Casiers(void)
{
    uint8_t capteurs;
    uint8_t led0 = 0xFF;
    uint8_t led1 = 0xFF;


    if (!PCF_Lire(((0x2 << 4) | 0b011), &capteurs))
        return;

    for (uint8_t i = 0; i < 3; i++)
    {

        if (capteurs & (1U << i))
            led0 &= ~(1U << (2 * i));
        else
            led0 &= ~(1U << (2 * i + 1));


        if (capteurs & (1U << (i + 4)))
            led1 &= ~(1U << (2 * i));
        else
            led1 &= ~(1U << (2 * i + 1));
    }


    PCF_Ecrire(((0x2 << 4) | 0b000), led0);
    PCF_Ecrire(((0x2 << 4) | 0b001), led1);
}
# 576 "main.c"
int main(void)
{
    uint8_t demande_casiers[4];
    uint8_t demande_zif[4];
    uint8_t traiter_casiers;
    uint8_t traiter_zif;
    uint8_t i;
    uint16_t directions;
    uint16_t niveaux;
    uint16_t lecture;

    SystemCoreClockUpdate();

    ZIF_Config(0xFFFFU, 0x0000U);
    I2C_Init();
    pcfs_initialises = Casiers_Initialiser();
    UART_Init();
    Allumer_Toutes_LEDs(1);
    while (1)
    {
        traiter_casiers = 0;
        traiter_zif = 0;


        __disable_irq();
        if (casiers_prets)
        {
            for (i = 0; i < 4U; i++)
                demande_casiers[i] = commande_casiers[i];
            casiers_prets = 0U;
            traiter_casiers = 1U;
        }
        if (zif_pret)
        {
            for (i = 0; i < 4U; i++)
                demande_zif[i] = commande_zif[i];
            zif_pret = 0U;
            traiter_zif = 1U;
        }
        __enable_irq();

        if (traiter_casiers)
        {
            uint16_t vertes = (uint16_t)(((uint16_t)demande_casiers[0] << 8) |
                                         demande_casiers[1]);
            uint16_t rouges = (uint16_t)(((uint16_t)demande_casiers[2] << 8) |
                                         demande_casiers[3]);
            if (Casiers_LEDs(vertes, rouges) && Casiers_Lire(&lecture))
                (void)FIFO_AjouterReponse(0xC0U, lecture);
        }

        if (traiter_zif)
        {
            directions = (uint16_t)(((uint16_t)demande_zif[0] << 8) |
                                    demande_zif[1]);
            niveaux = (uint16_t)(((uint16_t)demande_zif[2] << 8) |
                                 demande_zif[3]);
            if (ZIF_DirectionsValides(directions))
            {
                ZIF_Config(directions, niveaux);
                delay_us(20);
                lecture = ZIF_Lire();
                (void)FIFO_AjouterReponse(0x80U, lecture);
            }
            else
            {
                ZIF_Config(0xFFFFU, 0x0000U);

            }
        }

        FIFO_Emettre();
    }
}
