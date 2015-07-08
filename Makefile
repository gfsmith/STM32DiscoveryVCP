

#############
# Coocox build after setting up FPU, etc:
#ompile:
#   [mkdir] Created dir: C:\Users\Greg\Documents\src\STM32DiscoveryVCP\stm32_build\Debug\bin
#   [mkdir] Created dir: C:\Users\Greg\Documents\src\STM32DiscoveryVCP\stm32_build\Debug\obj
#      [cc] 19 total files to be compiled.
#      [cc] arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -g2 -Wall -O0 -c -DSTM32F407VG -DSTM32F4XX -D__ASSEMBLY__ -DUSE_STDPERIPH_DRIVER -D__FPU_USED
#               -IC:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib\otg -IC:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_conf -IC:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib -IC:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib\cdc -IC:\Users\Greg\Documents\src -IC:\Users\Greg\Documents\src\STM32DiscoveryVCP\cmsis_lib\include -IC:\Users\Greg\Documents\src\STM32DiscoveryVCP\cmsis_lib -IC:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib\core -IC:\Users\Greg\Documents\src\STM32DiscoveryVCP\cmsis -IC:\Users\Greg\Documents\src\STM32DiscoveryVCP -IC:\Users\Greg\Documents\src\STM32DiscoveryVCP\cmsis_boot
#               C:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib\otg\usb_core.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_conf\usbd_usr.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\cmsis_lib\source\stm32f4xx_usart.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\cmsis_boot\startup\startup_stm32f4xx.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib\core\usbd_core.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\main.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\cmsis_lib\source\stm32f4xx_rcc.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_conf\usbd_desc.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\cmsis_lib\source\stm32f4xx_gpio.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib\cdc\usbd_cdc_vcp.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\cmsis_boot\system_stm32f4xx.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_conf\usb_bsp.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib\core\usbd_req.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib\otg\usb_dcd_int.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib\cdc\usbd_cdc_core.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\cmsis_lib\source\stm32f4xx_exti.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\cmsis_lib\source\misc.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib\otg\usb_dcd.c C:\Users\Greg\Documents\src\STM32DiscoveryVCP\usb_lib\core\usbd_ioreq.c
#      [cc] 0 total files to be compiled.
#      [cc] Starting link
#      [cc] arm-none-eabi-gcc -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -g2 -nostartfiles -Wl,-Map=build.map -O0 -Wl,--gc-sections -LC:\Users\Greg\AppData\Roaming\CooCox\CoIDE\configuration\ProgramData\STM32DiscoveryVCP -Wl,-TC:\Users\Greg\AppData\Roaming\CooCox\CoIDE\configuration\ProgramData\STM32DiscoveryVCP/arm-gcc-link.ld -g -o build.elf ..\obj\stm32f4xx_gpio.o ..\obj\stm32f4xx_usart.o ..\obj\usbd_req.o ..\obj\usbd_cdc_vcp.o ..\obj\usb_dcd_int.o ..\obj\usb_bsp.o ..\obj\misc.o ..\obj\usbd_usr.o ..\obj\usbd_core.o ..\obj\startup_stm32f4xx.o ..\obj\stm32f4xx_rcc.o ..\obj\usb_core.o ..\obj\usbd_ioreq.o ..\obj\usbd_cdc_core.o ..\obj\stm32f4xx_exti.o ..\obj\system_stm32f4xx.o ..\obj\usb_dcd.o ..\obj\usbd_desc.o ..\obj\main.o


OUTPUT_ROOT_NAME = cdc_example
ELF_FNAME = $(OUTPUT_ROOT_NAME).elf
HEX_FNAME = $(OUTPUT_ROOT_NAME).hex
MAP_FNAME = $(OUTPUT_ROOT_NAME).map
LINKER_SCRIPT = link.ld

#compiler:
CC = arm-none-eabi-gcc

#linker
LD = arm-none-eabi-ld

#for extracting various formats from linked executable
OBJCOPY=arm-none-eabi-objcopy

#the name of the target ARM processor
CFLAGS =  -mcpu=cortex-m4
#specifies what floating point hardware is available
CFLAGS += -mfpu=fpv4-sp-d16
#specifies which floating point ABI to use
CFLAGS += -mfloat-abi=hard
CFLAGS += -mthumb
#Turns on all optional warnings which are desirable for normal code
CFLAGS += -Wall
# place each function into it's own section (an optimization option, may not be best idea to use?)
CFLAGS += -ffunction-sections
# produce debugging output (alternate = "-ggdb")
CFLAGS += -g
# optimization
CFLAGS += -O0
# compile only, don't link
CFLAGS += -c

# define symbols (mostly used by the STM peripheral library)
DEFINES =  -DSTM32F407VG
DEFINES += -D__FPU_USED
DEFINES += -DSTM32F407xx
DEFINES += -D__ASSEMBLY__
DEFINES += -DUSE_STDPERIPH_DRIVER 

# INCLUDES, directories to search for header files
INCLUDES += -Icmsis
INCLUDES += -Icmsis_boot
INCLUDES += -Icmsis_lib/include

# USB related
INCLUDES += -Iusb_conf
INCLUDES += -Iusb_lib/cdc
INCLUDES += -Iusb_lib/core
INCLUDES += -Iusb_lib/otg

###
# Find source files
SRCDIR = ./
INCDIR = ./
ASOURCES=$(shell find -L $(SRCDIR) -name '*.s')
CSOURCES=$(shell find -L $(SRCDIR) -name '*.c')
CXXSOURCES=$(shell find -L $(SRCDIR) -name '*.cpp')
# Find header directories
###INC=$(shell find -L $(INCDIR) -name '*.h' -exec dirname {} \; | uniq)
###INCLUDES=$(INC:%=-I%)
# Find libraries
INCLUDES_LIBS=
LINK_LIBS=
# Create object list
OBJECTS = $(ASOURCES:%.s=%.o)
OBJECTS += $(CSOURCES:%.c=%.o)
OBJECTS += $(CXXSOURCES:%.cpp=%.o)
# Define output files ELF & IHEX

#OBJS=$(SRCS:.c=.o)

#LD=arm-none-eabi-ld
#LDFLAGS=-mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wall -g -Map=$(MAP_FNAME) -O0 --gc-sections -Tlink.ld
LDFLAGS=-mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -g2 -nostartfiles -Wl,-Map=$(MAP_FNAME) -O0 -Wl,--gc-sections -Wl,-T$(LINKER_SCRIPT) -g

#$(ELF): $(SRCS)
#all: $(SRCS)

all: $(ELF_FNAME)
	$(OBJCOPY) -O ihex $(ELF_FNAME) $(HEX_FNAME)
	echo "created HEX file!"

# link rule
$(ELF_FNAME): $(OBJECTS)
	#echo $(SRCS)
	#echo "all"
	#echo $(OBJECTS)
	#$(CC) $(CFLAGS) -c $< -o $@
	##$(LD) $(LDFLAGS) -o $(ELF_FNAME) $(OBJECTS)
	#arm-none-eabi-gcc -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -g2 -nostartfiles -Wl,-Map=$(MAP_FNAME) -O0 -Wl,--gc-sections -Wl,-T$(LINKER_SCRIPT) -g -o $(ELF_FNAME) $(OBJECTS)
	$(CC) $(LDFLAGS) -o $(ELF_FNAME) $(OBJECTS)
	echo "linked!"

# compilation rule
%.o: %.c
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) $< -o $@
	@echo "Compiled "$<"!\n"

.phony: clean

clean:
	rm $(OBJECTS) $(ELF_FNAME) $(HEX_FNAME) $(MAP_FNAME)

#.c.o:
#	$(CC) $(CFLAGS) $< -o $@

#main.o: main.c
#	$(CC) $(CFLAGS) main.c




#all: main.o
#	#echo $(INC_CMSIS)
#	#echo $(CFLAGS)
#	$(CC) $(CFLAGS) -M main.c