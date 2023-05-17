##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=102bootloader
ConfigurationName      :=BuildSet
WorkspacePath          :=C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/
ProjectPath            :=C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=Administrator
Date                   :=02/04/2021
CDKPath                :=D:/C-Sky/CDK/
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elfabiv2-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=$(ProjectName)
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="102bootloader.txt"
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck801  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/ckcpu.ld"
LinkOtherFlagsOption   :=
IncludePackagePath     :=
IncludeCPath           :=$(IncludeSwitch)"$(CDKPath)CSKY/csi/csi_core/csi_cdk/" $(IncludeSwitch)"$(CDKPath)CSKY/csi/csi_core/include/" $(IncludeSwitch)"$(CDKPath)CSKY/csi/csi_driver/include/" $(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)include"  
IncludeAPath           :=$(IncludeSwitch)"$(CDKPath)CSKY/csi/csi_core/csi_cdk/" -Wa,$(IncludeSwitch)"$(CDKPath)CSKY/csi/csi_core/csi_cdk/" $(IncludeSwitch)"$(CDKPath)CSKY/csi/csi_core/include/" -Wa,$(IncludeSwitch)"$(CDKPath)CSKY/csi/csi_core/include/" $(IncludeSwitch)"$(CDKPath)CSKY/csi/csi_driver/include/" -Wa,$(IncludeSwitch)"$(CDKPath)CSKY/csi/csi_driver/include/" $(IncludeSwitch)"$(ProjectPath)" -Wa,$(IncludeSwitch)"$(ProjectPath)"  
Libs                   := -Wl,--whole-archive  -Wl,--no-whole-archive  
ArLibs                 := 
PackagesLibPath        :=
LibPath                := $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=ck801   $(PreprocessorSwitch)CONFIG_CSKY_MMU=0   $(UnPreprocessorSwitch)__CSKY_ABIV2__  -Os  -g  -Wall  -ffunction-sections -mistack 
CFLAGS   := -mcpu=ck801   $(PreprocessorSwitch)CONFIG_CSKY_MMU=0   $(UnPreprocessorSwitch)__CSKY_ABIV2__  -Os  -g  -Wall  -ffunction-sections -mistack 
ASFLAGS  := -mcpu=ck801   $(PreprocessorSwitch)CONFIG_CKCPU_MMU=0   $(UnPreprocessorSwitch)__CSKY_ABIV2__  -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) $(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_syscon$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_uart$(ObjectSuffix) $(IntermediateDirectory)/FWlib_btloaderPub$(ObjectSuffix) $(IntermediateDirectory)/FWlib_btloaderDriver$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_delay$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_ifc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_gpio$(ObjectSuffix) $(IntermediateDirectory)/apt32f102_initial$(ObjectSuffix) \
	$(IntermediateDirectory)/apt32f102_interrupt$(ObjectSuffix) $(IntermediateDirectory)/main$(ObjectSuffix) $(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix) $(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix) $(IntermediateDirectory)/__rt_entry$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean MakeIntermediateDirs
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(IntermediateDirectory)/.d $(Objects) 
	@echo "" > $(IntermediateDirectory)/.d
	@touch  $(ObjectsFileList)
	@echo $(Objects0)  > $(ObjectsFileList)
	@echo linking...
	@$(LinkerName) $(OutputSwitch)"$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" $(LinkerNameoption) $(LinkOtherFlagsOption)  -Wl,--ckmap="$(ProjectPath)/Lst/$(OutputFile).map"  @$(ObjectsFileList)  $(LinkOptions) $(LibPath) $(Libs)
	@mv "$(ProjectPath)/Lst/$(OutputFile).map" "$(ProjectPath)/Lst/$(OutputFile).temp" && $(READELF) $(ElfInfoSwitch) "$(ProjectPath)/Obj/$(OutputFile)$(ExeSuffix)" > "$(ProjectPath)/Lst/$(OutputFile).map" && echo ====================================================================== >> "$(ProjectPath)/Lst/$(OutputFile).map" && cat "$(ProjectPath)/Lst/$(OutputFile).temp" >> "$(ProjectPath)/Lst/$(OutputFile).map" && rm -rf "$(ProjectPath)/Lst/$(OutputFile).temp"
	@echo generating hex file...
	@$(OBJCOPY) $(ObjcopySwitch) "$(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)"  "$(ProjectPath)/Obj/$(OutputFile)$(IHexSuffix)" 
	@echo generating bin file...
	@	@echo generating asm file...
	@$(OBJDUMP) $(ObjdumpSwitch) "$(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)"  > "$(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix)" 
	@echo size of target:
	@$(SIZE) "$(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" 
	@echo -n "checksum value of target:  "
	@$(CHECKSUM) "$(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" 
	
MakeIntermediateDirs:
	@test -d Obj || $(MakeDirCommand) Obj
	@test -d Lst || $(MakeDirCommand) Lst

$(IntermediateDirectory)/.d:
	@test -d Obj || $(MakeDirCommand) Obj
	@test -d Lst || $(MakeDirCommand) Lst



##
## Objects
##
$(IntermediateDirectory)/arch_crt0$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/arch/crt0.S  
	@echo assembling crt0.S...
	@$(AS) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/arch/crt0.S" $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_crt0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/arch_crt0$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/arch/crt0.S
	@echo generating preprocess file of crt0.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_crt0$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/arch/crt0.S"

$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/arch/mem_init.c  
	@echo compiling mem_init.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/arch/mem_init.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_mem_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/arch_mem_init$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/arch/mem_init.c
	@echo generating preprocess file of mem_init.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_mem_init$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/arch/mem_init.c"

$(IntermediateDirectory)/FWlib_apt32f102_syscon$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_syscon.c  
	@echo compiling apt32f102_syscon.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_syscon.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_syscon$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_syscon$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_syscon$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_syscon$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_syscon.c
	@echo generating preprocess file of apt32f102_syscon.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_syscon$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_syscon.c"

$(IntermediateDirectory)/FWlib_apt32f102_uart$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_uart.c  
	@echo compiling apt32f102_uart.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_uart.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_uart$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_uart.c
	@echo generating preprocess file of apt32f102_uart.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_uart$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_uart.c"

$(IntermediateDirectory)/FWlib_btloaderPub$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/btloaderPub.c  
	@echo compiling btloaderPub.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/btloaderPub.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_btloaderPub$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_btloaderPub$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_btloaderPub$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_btloaderPub$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/btloaderPub.c
	@echo generating preprocess file of btloaderPub.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_btloaderPub$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/btloaderPub.c"

$(IntermediateDirectory)/FWlib_btloaderDriver$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/btloaderDriver.c  
	@echo compiling btloaderDriver.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/btloaderDriver.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_btloaderDriver$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_btloaderDriver$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_btloaderDriver$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_btloaderDriver$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/btloaderDriver.c
	@echo generating preprocess file of btloaderDriver.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_btloaderDriver$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/btloaderDriver.c"

$(IntermediateDirectory)/FWlib_apt32f102_delay$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_delay.c  
	@echo compiling apt32f102_delay.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_delay.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_delay$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_delay$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_delay$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_delay$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_delay.c
	@echo generating preprocess file of apt32f102_delay.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_delay$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_delay.c"

$(IntermediateDirectory)/FWlib_apt32f102_ifc$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_ifc.c  
	@echo compiling apt32f102_ifc.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_ifc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_ifc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_ifc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_ifc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_ifc$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_ifc.c
	@echo generating preprocess file of apt32f102_ifc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_ifc$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_ifc.c"

$(IntermediateDirectory)/FWlib_apt32f102_gpio$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_gpio.c  
	@echo compiling apt32f102_gpio.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_gpio.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_gpio$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_gpio.c
	@echo generating preprocess file of apt32f102_gpio.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_gpio$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/FWlib/apt32f102_gpio.c"

$(IntermediateDirectory)/apt32f102_initial$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/apt32f102_initial.c  
	@echo compiling apt32f102_initial.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/apt32f102_initial.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/apt32f102_initial$(ObjectSuffix) -MF$(IntermediateDirectory)/apt32f102_initial$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/apt32f102_initial$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/apt32f102_initial$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/apt32f102_initial.c
	@echo generating preprocess file of apt32f102_initial.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/apt32f102_initial$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/apt32f102_initial.c"

$(IntermediateDirectory)/apt32f102_interrupt$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/apt32f102_interrupt.c  
	@echo compiling apt32f102_interrupt.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/apt32f102_interrupt.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/apt32f102_interrupt$(ObjectSuffix) -MF$(IntermediateDirectory)/apt32f102_interrupt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/apt32f102_interrupt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/apt32f102_interrupt$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/apt32f102_interrupt.c
	@echo generating preprocess file of apt32f102_interrupt.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/apt32f102_interrupt$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/apt32f102_interrupt.c"

$(IntermediateDirectory)/main$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/main.c  
	@echo compiling main.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/main.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/main$(ObjectSuffix) -MF$(IntermediateDirectory)/main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/main$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/main.c
	@echo generating preprocess file of main.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/main$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/main.c"

$(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/drivers/apt32f102.c  
	@echo compiling apt32f102.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/drivers/apt32f102.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_apt32f102$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_apt32f102$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/drivers/apt32f102.c
	@echo generating preprocess file of apt32f102.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_apt32f102$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/drivers/apt32f102.c"

$(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/drivers/apt32f102_ck801.c  
	@echo compiling apt32f102_ck801.c...
	@$(CC) $(SourceSwitch) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/drivers/apt32f102_ck801.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_apt32f102_ck801$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_apt32f102_ck801$(PreprocessSuffix): C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/drivers/apt32f102_ck801.c
	@echo generating preprocess file of apt32f102_ck801.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_apt32f102_ck801$(PreprocessSuffix) "C:/Users/Administrator/Desktop/hgjghj/slow/32F102_Bootloader/bootloader/drivers/apt32f102_ck801.c"


$(IntermediateDirectory)/__rt_entry$(ObjectSuffix): $(IntermediateDirectory)/__rt_entry$(DependSuffix)
	@$(AS) $(SourceSwitch) "$(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) $(IncludeAPath)
$(IntermediateDirectory)/__rt_entry$(DependSuffix):
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) -MF$(IntermediateDirectory)/__rt_entry$(DependSuffix) -MM "$(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S"

-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	@echo Cleaning target...
	@rm -rf $(IntermediateDirectory)/ $(ObjectsFileList) 102bootloader.mk Lst/

clean_internal:
	@rm -rf $(IntermediateDirectory)/*.o $(IntermediateDirectory)/.d $(IntermediateDirectory)/*.d $(IntermediateDirectory)/*.a $(IntermediateDirectory)/*.elf $(IntermediateDirectory)/*.ihex

