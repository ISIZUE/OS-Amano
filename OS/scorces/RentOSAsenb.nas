; hello-os
; TAB=4

		ORG		0x7c00			;このプログラムがどこに読み込まれるか

; 以下は標準的なFAT12フォーマットフロッピーディスクのための記述

		JMP		entry
		DB		0x90
		DB		"HELLOIPL"		; ブートセレクタの名前を好きに書いてよい
		DW		512			;１セレクタの大きさ（必ず512）
		DB		1			; クラスタの大きさ（必ず１セレクタ）
		DW		1			; FATがどこから始まるか（ふつう１セレクタ目）
		DB		2			; FATの数（２以上）
		DW		224			; ルートディレクトリ領域の大きさ（ふつう224エントリ）
		DW		2880			; ドライブの大きさ(必ず2880セレクタ)
		DB		0xf0			; メディアのタイプ（必ず0xf0）
		DW		9			; FAT領域の長さ（必ず9セレクタ)
		DW		18			; １トラックにいくつのセレクタがあるか（必ず18）
		DW		2			; ヘッド数の数（必ず2）
		DD		0			; パーティションを使っていない場合0
		DD		2880			; このドライブの大きさをもう一度
		DB		0,0,0x29		
		DD		0xffffffff		
		DB		"Rent-OS    "	; ディスクの名前（１１バイト）
		DB		"FAT12   "			; とりあえず１８バイト開ける
		RESB	18

; プログラム本体

entry:
		MOV		AX,0			;レジスタ初期化
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX
		MOV		ES,AX

		MOV		SI,msg
putloop:
		MOV		AL,[SI]
		ADD		SI,1			;SIに1足す
		CMP		AL,0
		JE		fin
		MOV		AH,0x0e			;1文字表示ファンクション
		MOV		BX,15			:カラーコード
		INT		0x10			;ビデオBIOS呼び出し
		JMP		putloop
fin:
		HLT						;何かあるまでCPUを停止
		JMP		fin				;無限ループ

msg:
		DB		0x0a, 0x0a		; 改行2つ
		DB		"hello, world"
		DB		0x0a			; 改行
		DB		0

		RESB	0x7dfe-$			; 0x001feまで0x00で埋める命令

		DB		0x55, 0xaa

; 以下はブートセレクタ以外の部分の記述

		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	4600	
		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	1469432
