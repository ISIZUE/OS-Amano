TOOLPATH = ../z_tools/
MAKE	= $(TOOLPATH)make.exe -r
NASK	= $(TOOLPATH)nask.exe
EDIMG	= $(TOOLPATH)edimg.exe
IMGTOL	= $(TOOLPATH)imgtol.com
COPY	= copy
DEL	= del

#デフォルト動作
default :
	$(MAKE) run

RentOSAsenb.bin : RentOSAsenb.nas Makefile
	$(NASK) RentOSAsenb.nas RentOSAsenb.bin RentOSAsenb.lst

RentOSAsenb.img : RentOSAsenb.bin Makefile
	$(EDIMG)   imgin:../z_tools/fdimg0at.tek \
		wbinimg src:RentOSAsenb.bin len:512 from:0 to:0   imgout:RentOSAsenb.img

#コマンド
asm :
	$(MAKE) RentOSAsenb.bin

img :
	$(MAKE) RentOSAsenb.img

run :
	$(MAKE) img
	$(COPY) RentOSAsenb.img ..\z_tools\qemu\fdimage0.bin
	$(MAKE) -C ../z_tools/qemu

install :
	$(MAKE) img
	$(IMGTOL) w a: RentOSAsenb.img

clean :
	-$(DEL) RentOSAsenb.bin
	-$(DEL) RentOSAsenb.lst

src_only:
	$(MAKE) clean
	-$(DEL) RentOSAsenb.img
