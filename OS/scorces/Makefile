default :
	../z_tools/make.exe run

RentOSAsenb.bin : RentOSAsenb.nas Makefile
	../z_tools/nask.exe RentOSAsenb.nas RentOSAsenb.bin RentOSAsenb.lst

RentOSAsenb.img : RentOSAsenb.bin Makefile
	../z_tools/edimg.exe   imgin:../z_tools/fdimg0at.tek \
		wbinimg src:RentOSAsenb.bin len:512 from:0 to:0   imgout:RentOSAsenb.img


asm :
	../z_tools/make.exe -r RentOSAsenb.bin

img :
	../z_tools/make.exe -r RentOSAsenb.img

run :
	../z_tools/make.exe img
	copy RentOSAsenb.img ..\z_tools\qemu\fdimage0.bin
	../z_tools/make.exe -C ../z_tools/qemu

install :
	../z_tools/make.exe img
	../z_tools/imgtol.com w a: RentOSAsenb.img

clean :
	-del RentOSAsenb.bin
	-del RentOSAsenb.lst

src_only:
	../z_tools/make.exe clean
	-del RentOSAsenb.img
