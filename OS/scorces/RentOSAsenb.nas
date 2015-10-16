; hello-os
; TAB=4

		ORG		0x7c00			;���̃v���O�������ǂ��ɓǂݍ��܂�邩

; �ȉ��͕W���I��FAT12�t�H�[�}�b�g�t���b�s�[�f�B�X�N�̂��߂̋L�q

		JMP		entry
		DB		0x90
		DB		"HELLOIPL"		; �u�[�g�Z���N�^�̖��O���D���ɏ����Ă悢
		DW		512			;�P�Z���N�^�̑傫���i�K��512�j
		DB		1			; �N���X�^�̑傫���i�K���P�Z���N�^�j
		DW		1			; FAT���ǂ�����n�܂邩�i�ӂ��P�Z���N�^�ځj
		DB		2			; FAT�̐��i�Q�ȏ�j
		DW		224			; ���[�g�f�B���N�g���̈�̑傫���i�ӂ�224�G���g���j
		DW		2880			; �h���C�u�̑傫��(�K��2880�Z���N�^)
		DB		0xf0			; ���f�B�A�̃^�C�v�i�K��0xf0�j
		DW		9			; FAT�̈�̒����i�K��9�Z���N�^)
		DW		18			; �P�g���b�N�ɂ����̃Z���N�^�����邩�i�K��18�j
		DW		2			; �w�b�h���̐��i�K��2�j
		DD		0			; �p�[�e�B�V�������g���Ă��Ȃ��ꍇ0
		DD		2880			; ���̃h���C�u�̑傫����������x
		DB		0,0,0x29		
		DD		0xffffffff		
		DB		"Rent-OS    "	; �f�B�X�N�̖��O�i�P�P�o�C�g�j
		DB		"FAT12   "			; �Ƃ肠�����P�W�o�C�g�J����
		RESB	18

; �v���O�����{��

entry:
		MOV		AX,0			;���W�X�^������
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX
		MOV		ES,AX

		MOV		SI,msg
putloop:
		MOV		AL,[SI]
		ADD		SI,1			;SI��1����
		CMP		AL,0
		JE		fin
		MOV		AH,0x0e			;1�����\���t�@���N�V����
		MOV		BX,15			:�J���[�R�[�h
		INT		0x10			;�r�f�IBIOS�Ăяo��
		JMP		putloop
fin:
		HLT						;��������܂�CPU���~
		JMP		fin				;�������[�v

msg:
		DB		0x0a, 0x0a		; ���s2��
		DB		"hello, world"
		DB		0x0a			; ���s
		DB		0

		RESB	0x7dfe-$			; 0x001fe�܂�0x00�Ŗ��߂閽��

		DB		0x55, 0xaa

; �ȉ��̓u�[�g�Z���N�^�ȊO�̕����̋L�q

		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	4600	
		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	1469432
