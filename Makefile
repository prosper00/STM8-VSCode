#######################
# SDCC Makefile for making a hexfile from all .C files in this directory,
# and specified directories.
#
# Output files are created in directory './SDCC'.
# Target file for STM8 programming is ./SDCC/main.ihx
#######################

# required for stm8flash
stm8flash_PATH   = stm8flash
#stm8flash_DEVICE = stm8s105c6          # STM8S Discovery
#stm8flash_SWIM   = stlink
stm8flash_DEVICE = stm8s103f3           # STM8L Discovery
stm8flash_SWIM   = stlinkv2
#stm8flash_DEVICE = stm8s001j3          # STM8-SO8-DISCO (stm8s001j3)
#stm8flash_SWIM   = stlinkv2

OPENOCD			 = openocd
OPENOCD_INTF	 = stlink-dap.cfg
OPENOCD_DEV		 = stm8s103.cfg
OPENOCD_SCRIPTS  = ./openocd


# required for stm8gal
stm8gal_PATH     = 
stm8gal_PORT     = 

# define compiler path (if not in PATH), and flags
CC               = sdcc
LD               = sdcc
OPTIMIZE         = --opt-code-size 
CFLAGS           = -mstm8 -lstm8 --std-sdcc99 --std-c99 $(OPTIMIZE) --debug --out-fmt-elf --verbose --fverbose-asm
#CFLAGS			 = -mstm8 -lstm8 --opt-code-size --out-fmt-elf --debug --all-callee-saves --verbose --stack-auto --fverbose-asm  --float-reent --no-peep
LFLAGS           = -mstm8 -lstm8 --out-fmt-elf --debug --verbose
OBJSIZE			 = stm8-size
OBJCOPY			 = stm8-objcopy

# set output folder and target name
OUTPUT_DIR       = bin
TARGET           = $(OUTPUT_DIR)/main.elf

# find all -c and .h in specified directories PRJ_DIRS
PRJ_SRC_DIR      = .
PRJ_INC_DIR      = $(PRJ_SRC_DIR)
PRJ_SOURCE       = $(foreach d, $(PRJ_SRC_DIR), $(wildcard $(d)/*.c))
PRJ_HEADER       = $(foreach d, $(PRJ_INC_DIR), $(wildcard $(d)/*.h))
PRJ_OBJECTS      = $(addprefix $(OUTPUT_DIR)/, $(notdir $(PRJ_SOURCE:.c=.rel)))

# concat all project files
SRC_DIR          = $(PRJ_SRC_DIR)
INC_DIR          = include
SOURCE           = $(PRJ_SOURCE)
HEADER           = $(PRJ_HEADER)
OBJECTS          = $(PRJ_OBJECTS)

# set compiler include paths
INCLUDE          = $(foreach d, $(INC_DIR), $(addprefix -I, $(d)))

# set make search paths
vpath %.c $(SRC_DIR)
vpath %.h $(INC_DIR)

# debug: print variable and stop
#$(error variable is [${INC_DIR}])


########
# dependencies & make instructions
########

.PHONY: clean all default size

.PRECIOUS: $(TARGET) $(OBJECTS)

default: size

all: default

# create output folder
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)
	rm -fr -- -p

# link target
$(TARGET) : $(OBJECTS)
	@$(LD) $(LFLAGS) -o $@ $(OBJECTS)
	@$(OBJCOPY) -O ihex -R DATA -R INITIALIZED -R SSEG $(TARGET) $(basename $(TARGET)).ihx
	@$(OBJCOPY) -O ihex -R DATA -R INITIALIZED -R SSEG $(TARGET) $(basename $(TARGET)).bin

# compile objects
$(OBJECTS) : $(SOURCE) $(HEADER)

$(OUTPUT_DIR)/%.rel : %.c
	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@


# clean up
clean:
	rm -fr $(OUTPUT_DIR)/*

size: $(OUTPUT_DIR) $(TARGET)
	@echo "------------------"
	@echo "FLASH:  $(shell $(OBJSIZE) -Ad $(TARGET) | awk 'NR >= 5 && NR <= 9 {sum += $$2} END {print sum}') bytes"
	@echo "SRAM:  $(shell $(OBJSIZE) -Ad $(TARGET) | awk 'NR <= 3 {sum += $$2} END {print sum}') bytes" 
	@echo "------------------"

# upload SDCC output via SWIM ( https://github.com/vdudouyt/stm8flash )
flash: size
# $(stm8flash_PATH) -c $(stm8flash_SWIM) -w $(TARGET) -p $(stm8flash_DEVICE)
# to use openocd:
	$(OPENOCD) -f interface/$(OPENOCD_INTF) -f target/$(OPENOCD_DEV) -f $(OPENOCD_SCRIPTS)/stm8-flash.cfg -f$(OPENOCD_SCRIPTS)/connect-under-reset.cfg -c init -c "program_device $(TARGET) 0"

#EOF
