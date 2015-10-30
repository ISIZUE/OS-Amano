TOOLPATH = ../z_tools/
MAKE     = $(TOOLPATH)make.exe -r
NASK     = $(TOOLPATH)nask.exe
EDIMG    = $(TOOLPATH)edimg.exe
IMGTOL   = $(TOOLPATH)imgtol.com
COPY     = copy
DEL      = del

# デフォルト動作

default :
	$(MAKE) run

# ファイル生成規則

ipl.bin : ipl.nas Makefile
	$(NASK) ipl.nas ipl.bin ipl.lst

RentOSAsenb.sys : RentOSAsenb.nas Makefile
	$(NASK) RentOSAsenb.nas RentOSAsenb.sys RentOSAsenb.lst

RentOSAsenb.img : ipl.bin RentOSAsenb.sys Makefile
	$(EDIMG)   imgin:../z_tools/fdimg0at.tek \
		wbinimg src:ipl.bin len:512 from:0 to:0 \
		copy from:RentOSAsenb.sys to:@: \
		imgout:RentOSAsenb.img

# コマンド

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
	-$(DEL) ipl.bin
	-$(DEL) ipl.lst
	-$(DEL) RentOSAsenb.sys
	-$(DEL) RentOSAsenb.lst

src_only :
	$(MAKE) clean
	-$(DEL) RentOSAsenb.img
