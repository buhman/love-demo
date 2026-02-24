IMAGES += image/0_logOnly.DDS
image/0_logOnly.DDS: ./images/0_logOnly.png
	@mkdir -p image
	texconv10.exe -f BC1_UNORM -nologo "$<"
	mv "$(<:.png=.DDS)" "$@"

