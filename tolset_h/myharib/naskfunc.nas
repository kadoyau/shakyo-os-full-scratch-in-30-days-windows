; naskfunc
; TAB=4
; アセンブラで関数を作る

[FORMAT "WCOFF"]				; オブジェクトファイルを作るモード	
[BITS 32]						; 32ビットモード用の機械語を作らせる


; naskのオブジェクトファイルのための情報

[FILE "naskfunc.nas"]			; ソースファイル名情報。naskのオブジェクトファイルモードでは必須。

		GLOBAL	_io_hlt			; このプログラムに含まれる関数名。prefixの_は命名規則


; 以下は実際の関数

[SECTION .text]		; オブジェクトファイルではこれを書いてからプログラムを書く

_io_hlt:	; void io_hlt(void); HLT命令はI/O命令に属する
		HLT
		RET
