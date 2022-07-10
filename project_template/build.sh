#!/bin/sh

# GOTARGET (required) specifies the target MCU/SOC family. All family members
# have similar peripherals but may vary in the amount or structure of RAM.
#
# Supported values: imxrt1060, k210, nrf52840, stm32f215, stm32f407, stm32f412,
# stm32h7x3, stm32l4x6
GOTARGET=stm32f407

# GOMEM (required) describes the structure of available RAM. Currently at most
# two RAM regions can be specified. The first one is considered DMA capable and
# available for the user code (stacks, heap, global variables). The second one
#(if exists) is used only for the runtime internal structures making more of the
# DMA capable RAM available for the user code.
#
# The format is START_ADDRESS:SIZE or START_ADDRESS1:SIZE1,START_ADDRESS2:SIZE2
GOMEM=0x20000000:128K,0x10000000:64K

# GOTEXT specifies the beggining of code memory, usually Flash. For most targets
# its default value is infered from GOTARGET. The exception is nRF52840 where
# you must specify it explicitly because of the possibly preprogrammed
# bootloader and softdevice. Set to 0x27000 for bootloader+SD140, 0x1000 for
# bootloader only, 0 if you don't use any of them.
#
# CAUTION! Wrong or default setting may destroy the preprogrammed bootloader on
# any target.
#GOTEXT=0x8000000

# GOSTRIPFN allows to slightly reduce the size of compiled binary at the cost of
# less information in stack traces.
#
# Supported values: 0 (default) - do nothing, 1 - remove package path, 2 - blank
# function names.
#GOSTRIPFN=1

# Include and run the build script.
. $(emgo env GOROOT)/../scripts/build.sh $@
