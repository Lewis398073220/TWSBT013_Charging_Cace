.PHONY: clean All

All:
	@echo "----------Building project:[ apt32f102 - BuildSet ]----------"
	@
	@make -f "apt32f102.mk" MakeIntermediateDirs && make -f "apt32f102.mk" -j 8
clean:
	@echo "----------Cleaning project:[ apt32f102 - BuildSet ]----------"
	@make -f  "apt32f102.mk" clean
