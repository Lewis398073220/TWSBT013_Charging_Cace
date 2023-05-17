.PHONY: clean All

All:
	@echo "----------Building project:[ 102bootloader - BuildSet ]----------"
	@
	@make -f "102bootloader.mk" MakeIntermediateDirs && make -f "102bootloader.mk" -j 4
clean:
	@echo "----------Cleaning project:[ 102bootloader - BuildSet ]----------"
	@make -f  "102bootloader.mk" clean
