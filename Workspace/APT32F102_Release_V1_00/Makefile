.PHONY: clean All

All:
	@echo "----------Building project:[ apt32f102 - BuildSet ]----------"
	@
	@cd "F:\APTMCU_IC\Demo_code\APT32F102\APT32F102_Bootloader\app_test" && make -f "apt32f102.mk" MakeIntermediateDirs && make -f "apt32f102.mk" -j 6
clean:
	@echo "----------Cleaning project:[ apt32f102 - BuildSet ]----------"
	@cd "F:\APTMCU_IC\Demo_code\APT32F102\APT32F102_Bootloader\app_test" && make -f  "apt32f102.mk" clean
