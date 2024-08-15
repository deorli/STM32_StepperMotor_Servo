################################################################################################
#   File           : Makefile
#   Author         : Mateusz Bator
#   Brief          : Startup file with information on compilation, flashing
#   ############################################################################################
#   Copyright (c) Bator Mateusz 
#   email: deorli@o2.pl
#   
#   All rights reserved.
#   
#   This software is licensed under terms that can be found in the LICENSE file
#   in the root directory of this software project.
################################################################################################

###########################################	  TODO	 ###########################################
#1. Adding protection against flashing an oversized program
################################################################################################

# Text colour variables
RED := $(shell tput -Txterm setaf 1)
GREEN := $(shell tput -Txterm setaf 2)
BLUE := $(shell tput -Txterm setaf 4)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE := $(shell tput -Txterm setaf 7)
RESET := $(shell tput -Txterm sgr0)

# When the first parameter is empty (e.g. make)
ifeq ($(MAKECMDGOALS),$(filter $(MAKECMDGOALS),))
information:
endif

# When the first parameter is "help" (e.g. make help)
ifeq ($(MAKECMDGOALS),$(filter $(MAKECMDGOALS), help))
help:
endif

# Write information in the console on how to use the help command
information:
	@echo	'Call: $(GREEN)make help$(RESET)              -To get information how to build, debug, compile etc'

# Write information in the console about available commands
help:
	@echo
	@echo	'###################################################################################################################'
	@echo	'How use this build system:'
	@echo	'-------------------------------------------------------------------------------------------------------------------'
	@echo	'1. $(GREEN)make App$(RESET)                  -To compile app - Firmware for MCU - without debug information'
	@echo	'2. $(GREEN)make App-flash$(RESET)            -To compile and flash app - Firmware for MCU -without debug information'
	@echo	'3. $(GREEN)make DebugApp$(RESET)             -To compile App with Debug information'
	@echo	'4. $(GREEN)make DebugApp-flash$(RESET)       -To compile App with Debug information and flash Firmware in MCU'
	@echo	'-------------------------------------------------------------------------------------------------------------------'
	@echo	'5. $(GREEN)make clean-App$(RESET)            -Remove build Folder'
	@echo	'6. $(GREEN)make clean-DebugApp$(RESET)       -Remove build Debug Folder'
	@echo	'-------------------------------------------------------------------------------------------------------------------'
	@echo	'7. $(GREEN)make static-analisis$(RESET)      -Run static analisis'
	@echo	'###################################################################################################################'

# Include makefile for debugging and flashing STM32F3
ifeq ($(MAKECMDGOALS),$(filter $(MAKECMDGOALS), App App-flash DebugApp DebugApp-flash clean-App clean-DebugApp static-analisis))
include Makefiles/main_Makefile
endif