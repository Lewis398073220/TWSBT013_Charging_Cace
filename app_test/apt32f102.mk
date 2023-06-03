##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=apt32f102
ConfigurationName      :=BuildSet
WorkspacePath          :=E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/
ProjectPath            :=E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=Administrator
Date                   :=02/06/2023
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
OutputFile             :=TWSBT_013_charge_case_V0_0_4
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="apt32f102.txt"
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck801  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/ckcpu.ld"
LinkOtherFlagsOption   :=
IncludePackagePath     :=
IncludeCPath           :=$(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)include" $(IncludeSwitch)"$(ProjectPath)drivers" $(IncludeSwitch)"$(ProjectPath)app"  
IncludeAPath           :=$(IncludeSwitch)"$(ProjectPath)" -Wa,$(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)include" -Wa,$(IncludeSwitch)"$(ProjectPath)include" $(IncludeSwitch)"$(ProjectPath)drivers" -Wa,$(IncludeSwitch)"$(ProjectPath)drivers" $(IncludeSwitch)"$(ProjectPath)app" -Wa,$(IncludeSwitch)"$(ProjectPath)app"  
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


Objects0=$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) $(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_syscon$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_coret$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_gpio$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_lpt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_crc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_wwdt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_countera$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_et$(ObjectSuffix) \
	$(IntermediateDirectory)/FWlib_apt32f102_bt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_hwdiv$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_gpt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_sio$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_spi$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_uart$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_i2c$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_ept$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f102_rtc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f101_adc$(ObjectSuffix) \
	$(IntermediateDirectory)/FWlib_apt32f101_ifc$(ObjectSuffix) $(IntermediateDirectory)/apt32f102_initial$(ObjectSuffix) $(IntermediateDirectory)/apt32f102_interrupt$(ObjectSuffix) $(IntermediateDirectory)/main$(ObjectSuffix) $(IntermediateDirectory)/app_reset$(ObjectSuffix) $(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix) $(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix) $(IntermediateDirectory)/drivers_platform_driver$(ObjectSuffix) $(IntermediateDirectory)/APP_app_communicate$(ObjectSuffix) $(IntermediateDirectory)/APP_app_battery$(ObjectSuffix) \
	$(IntermediateDirectory)/APP_app_status_ind$(ObjectSuffix) $(IntermediateDirectory)/APP_app_state_machine$(ObjectSuffix) $(IntermediateDirectory)/app_app_delay$(ObjectSuffix) $(IntermediateDirectory)/__rt_entry$(ObjectSuffix) 



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
$(IntermediateDirectory)/arch_crt0$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/arch/crt0.S  
	@echo assembling crt0.S...
	@$(AS) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/arch/crt0.S" $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_crt0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/arch_crt0$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/arch/crt0.S
	@echo generating preprocess file of crt0.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_crt0$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/arch/crt0.S"

$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/arch/mem_init.c  
	@echo compiling mem_init.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/arch/mem_init.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_mem_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/arch_mem_init$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/arch/mem_init.c
	@echo generating preprocess file of mem_init.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_mem_init$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/arch/mem_init.c"

$(IntermediateDirectory)/FWlib_apt32f102_syscon$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_syscon.c  
	@echo compiling apt32f102_syscon.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_syscon.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_syscon$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_syscon$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_syscon$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_syscon$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_syscon.c
	@echo generating preprocess file of apt32f102_syscon.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_syscon$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_syscon.c"

$(IntermediateDirectory)/FWlib_apt32f102_coret$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_coret.c  
	@echo compiling apt32f102_coret.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_coret.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_coret$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_coret$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_coret$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_coret$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_coret.c
	@echo generating preprocess file of apt32f102_coret.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_coret$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_coret.c"

$(IntermediateDirectory)/FWlib_apt32f102_gpio$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_gpio.c  
	@echo compiling apt32f102_gpio.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_gpio.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_gpio$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_gpio.c
	@echo generating preprocess file of apt32f102_gpio.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_gpio$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_gpio.c"

$(IntermediateDirectory)/FWlib_apt32f102_lpt$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_lpt.c  
	@echo compiling apt32f102_lpt.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_lpt.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_lpt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_lpt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_lpt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_lpt$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_lpt.c
	@echo generating preprocess file of apt32f102_lpt.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_lpt$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_lpt.c"

$(IntermediateDirectory)/FWlib_apt32f102_crc$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_crc.c  
	@echo compiling apt32f102_crc.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_crc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_crc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_crc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_crc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_crc$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_crc.c
	@echo generating preprocess file of apt32f102_crc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_crc$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_crc.c"

$(IntermediateDirectory)/FWlib_apt32f102_wwdt$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_wwdt.c  
	@echo compiling apt32f102_wwdt.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_wwdt.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_wwdt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_wwdt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_wwdt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_wwdt$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_wwdt.c
	@echo generating preprocess file of apt32f102_wwdt.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_wwdt$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_wwdt.c"

$(IntermediateDirectory)/FWlib_apt32f102_countera$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_countera.c  
	@echo compiling apt32f102_countera.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_countera.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_countera$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_countera$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_countera$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_countera$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_countera.c
	@echo generating preprocess file of apt32f102_countera.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_countera$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_countera.c"

$(IntermediateDirectory)/FWlib_apt32f102_et$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_et.c  
	@echo compiling apt32f102_et.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_et.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_et$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_et$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_et$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_et$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_et.c
	@echo generating preprocess file of apt32f102_et.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_et$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_et.c"

$(IntermediateDirectory)/FWlib_apt32f102_bt$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_bt.c  
	@echo compiling apt32f102_bt.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_bt.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_bt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_bt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_bt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_bt$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_bt.c
	@echo generating preprocess file of apt32f102_bt.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_bt$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_bt.c"

$(IntermediateDirectory)/FWlib_apt32f102_hwdiv$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_hwdiv.c  
	@echo compiling apt32f102_hwdiv.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_hwdiv.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_hwdiv$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_hwdiv$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_hwdiv$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_hwdiv$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_hwdiv.c
	@echo generating preprocess file of apt32f102_hwdiv.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_hwdiv$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_hwdiv.c"

$(IntermediateDirectory)/FWlib_apt32f102_gpt$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_gpt.c  
	@echo compiling apt32f102_gpt.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_gpt.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_gpt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_gpt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_gpt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_gpt$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_gpt.c
	@echo generating preprocess file of apt32f102_gpt.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_gpt$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_gpt.c"

$(IntermediateDirectory)/FWlib_apt32f102_sio$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_sio.c  
	@echo compiling apt32f102_sio.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_sio.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_sio$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_sio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_sio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_sio$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_sio.c
	@echo generating preprocess file of apt32f102_sio.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_sio$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_sio.c"

$(IntermediateDirectory)/FWlib_apt32f102_spi$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_spi.c  
	@echo compiling apt32f102_spi.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_spi.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_spi$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_spi.c
	@echo generating preprocess file of apt32f102_spi.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_spi$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_spi.c"

$(IntermediateDirectory)/FWlib_apt32f102_uart$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_uart.c  
	@echo compiling apt32f102_uart.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_uart.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_uart$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_uart.c
	@echo generating preprocess file of apt32f102_uart.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_uart$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_uart.c"

$(IntermediateDirectory)/FWlib_apt32f102_i2c$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_i2c.c  
	@echo compiling apt32f102_i2c.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_i2c.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_i2c$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_i2c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_i2c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_i2c$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_i2c.c
	@echo generating preprocess file of apt32f102_i2c.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_i2c$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_i2c.c"

$(IntermediateDirectory)/FWlib_apt32f102_ept$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_ept.c  
	@echo compiling apt32f102_ept.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_ept.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_ept$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_ept$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_ept$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_ept$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_ept.c
	@echo generating preprocess file of apt32f102_ept.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_ept$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_ept.c"

$(IntermediateDirectory)/FWlib_apt32f102_rtc$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_rtc.c  
	@echo compiling apt32f102_rtc.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_rtc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f102_rtc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f102_rtc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f102_rtc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f102_rtc$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_rtc.c
	@echo generating preprocess file of apt32f102_rtc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f102_rtc$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f102_rtc.c"

$(IntermediateDirectory)/FWlib_apt32f101_adc$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f101_adc.c  
	@echo compiling apt32f101_adc.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f101_adc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f101_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f101_adc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f101_adc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f101_adc$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f101_adc.c
	@echo generating preprocess file of apt32f101_adc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f101_adc$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f101_adc.c"

$(IntermediateDirectory)/FWlib_apt32f101_ifc$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f101_ifc.c  
	@echo compiling apt32f101_ifc.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f101_ifc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f101_ifc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f101_ifc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f101_ifc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f101_ifc$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f101_ifc.c
	@echo generating preprocess file of apt32f101_ifc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f101_ifc$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/FWlib/apt32f101_ifc.c"

$(IntermediateDirectory)/apt32f102_initial$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/apt32f102_initial.c  
	@echo compiling apt32f102_initial.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/apt32f102_initial.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/apt32f102_initial$(ObjectSuffix) -MF$(IntermediateDirectory)/apt32f102_initial$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/apt32f102_initial$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/apt32f102_initial$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/apt32f102_initial.c
	@echo generating preprocess file of apt32f102_initial.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/apt32f102_initial$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/apt32f102_initial.c"

$(IntermediateDirectory)/apt32f102_interrupt$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/apt32f102_interrupt.c  
	@echo compiling apt32f102_interrupt.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/apt32f102_interrupt.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/apt32f102_interrupt$(ObjectSuffix) -MF$(IntermediateDirectory)/apt32f102_interrupt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/apt32f102_interrupt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/apt32f102_interrupt$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/apt32f102_interrupt.c
	@echo generating preprocess file of apt32f102_interrupt.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/apt32f102_interrupt$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/apt32f102_interrupt.c"

$(IntermediateDirectory)/main$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/main.c  
	@echo compiling main.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/main.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/main$(ObjectSuffix) -MF$(IntermediateDirectory)/main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/main$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/main.c
	@echo generating preprocess file of main.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/main$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/main.c"

$(IntermediateDirectory)/app_reset$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/app_reset.c  
	@echo compiling app_reset.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/app_reset.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/app_reset$(ObjectSuffix) -MF$(IntermediateDirectory)/app_reset$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/app_reset$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/app_reset$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/app_reset.c
	@echo generating preprocess file of app_reset.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/app_reset$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/app_reset.c"

$(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/apt32f102.c  
	@echo compiling apt32f102.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/apt32f102.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_apt32f102$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_apt32f102$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_apt32f102$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/apt32f102.c
	@echo generating preprocess file of apt32f102.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_apt32f102$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/apt32f102.c"

$(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/apt32f102_ck801.c  
	@echo compiling apt32f102_ck801.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/apt32f102_ck801.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_apt32f102_ck801$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_apt32f102_ck801$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_apt32f102_ck801$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/apt32f102_ck801.c
	@echo generating preprocess file of apt32f102_ck801.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_apt32f102_ck801$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/apt32f102_ck801.c"

$(IntermediateDirectory)/drivers_platform_driver$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/platform_driver.c  
	@echo compiling platform_driver.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/platform_driver.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_platform_driver$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_platform_driver$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_platform_driver$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_platform_driver$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/platform_driver.c
	@echo generating preprocess file of platform_driver.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_platform_driver$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/drivers/platform_driver.c"

$(IntermediateDirectory)/APP_app_communicate$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_communicate.c  
	@echo compiling app_communicate.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_communicate.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/APP_app_communicate$(ObjectSuffix) -MF$(IntermediateDirectory)/APP_app_communicate$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/APP_app_communicate$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/APP_app_communicate$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_communicate.c
	@echo generating preprocess file of app_communicate.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/APP_app_communicate$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_communicate.c"

$(IntermediateDirectory)/APP_app_battery$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_battery.c  
	@echo compiling app_battery.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_battery.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/APP_app_battery$(ObjectSuffix) -MF$(IntermediateDirectory)/APP_app_battery$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/APP_app_battery$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/APP_app_battery$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_battery.c
	@echo generating preprocess file of app_battery.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/APP_app_battery$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_battery.c"

$(IntermediateDirectory)/APP_app_status_ind$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_status_ind.c  
	@echo compiling app_status_ind.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_status_ind.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/APP_app_status_ind$(ObjectSuffix) -MF$(IntermediateDirectory)/APP_app_status_ind$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/APP_app_status_ind$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/APP_app_status_ind$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_status_ind.c
	@echo generating preprocess file of app_status_ind.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/APP_app_status_ind$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_status_ind.c"

$(IntermediateDirectory)/APP_app_state_machine$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_state_machine.c  
	@echo compiling app_state_machine.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_state_machine.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/APP_app_state_machine$(ObjectSuffix) -MF$(IntermediateDirectory)/APP_app_state_machine$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/APP_app_state_machine$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/APP_app_state_machine$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_state_machine.c
	@echo generating preprocess file of app_state_machine.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/APP_app_state_machine$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/APP/app_state_machine.c"

$(IntermediateDirectory)/app_app_delay$(ObjectSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/app/app_delay.c  
	@echo compiling app_delay.c...
	@$(CC) $(SourceSwitch) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/app/app_delay.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/app_app_delay$(ObjectSuffix) -MF$(IntermediateDirectory)/app_app_delay$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/app_app_delay$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/app_app_delay$(PreprocessSuffix): E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/app/app_delay.c
	@echo generating preprocess file of app_delay.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/app_app_delay$(PreprocessSuffix) "E:/Lewis/BT-013/SoftwareMaterial/SourceCode/Current_Verson/app_test/app/app_delay.c"


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
	@rm -rf $(IntermediateDirectory)/ $(ObjectsFileList) apt32f102.mk Lst/

clean_internal:
	@rm -rf $(IntermediateDirectory)/*.o $(IntermediateDirectory)/.d $(IntermediateDirectory)/*.d $(IntermediateDirectory)/*.a $(IntermediateDirectory)/*.elf $(IntermediateDirectory)/*.ihex

