####################################
# Makefile for CDC Example Project #
####################################

OUTPUT_ROOT_NAME = cdc_example
ELF_FNAME = $(OUTPUT_ROOT_NAME).elf
HEX_FNAME = $(OUTPUT_ROOT_NAME).hex
MAP_FNAME = $(OUTPUT_ROOT_NAME).map
LINKER_SCRIPT = link.ld

#compiler:
CC = arm-none-eabi-gcc

#for extracting various formats from linked executable
OBJCOPY=arm-none-eabi-objcopy

# common build flags
#####################

BUILD_FLAGS = 

#the name of the target ARM processor
BUILD_FLAGS =  -mcpu=cortex-m4
#specifies what floating point hardware is available
BUILD_FLAGS += -mfpu=fpv4-sp-d16
#specifies which floating point ABI to use
BUILD_FLAGS += -mfloat-abi=hard
# generate thumb code for arm
BUILD_FLAGS += -mthumb
# produce debugging output (alternate = "-ggdb")
BUILD_FLAGS += -g

# compilation flags
#####################
# start with all of the common build flags we just defined
CFLAGS = $(BUILD_FLAGS)
#Turns on all optional warnings which are desirable for normal code
CFLAGS += -Wall
# place each function into it's own section (an optimization option, may not be best idea to use?)
CFLAGS += -ffunction-sections
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

# perhaps useful for later...
######
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
# another way, for reference:
#OBJS=$(SRCS:.c=.o)

#LD=arm-none-eabi-ld
#LDFLAGS=-mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wall -g -Map=$(MAP_FNAME) -O0 --gc-sections -Tlink.ld
LDFLAGS=-mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -g2 -nostartfiles -Wl,-Map=$(MAP_FNAME) -O0 -Wl,--gc-sections -Wl,-T$(LINKER_SCRIPT) -g


#now, the rules:
########################################################################

all: $(ELF_FNAME)
	$(OBJCOPY) -O ihex $(ELF_FNAME) $(HEX_FNAME)
	echo "created HEX file!"

# link rule
$(ELF_FNAME): $(OBJECTS)
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
