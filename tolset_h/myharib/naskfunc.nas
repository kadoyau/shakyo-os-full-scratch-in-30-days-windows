; naskfunc
; TAB=4
; アセンブラで関数を作る

[FORMAT "WCOFF"]				; オブジェクトファイルを作るモード	
[INSTRSET "i486p"]				; 486の命令まで使いたいという記述。これがないと8086用のプログラムとして処理される
[BITS 32]						; 32ビットモード用の機械語を作らせる
[FILE "naskfunc.nas"]			; ソースファイル名情報


; naskのオブジェクトファイルのための情報

[FILE "naskfunc.nas"]			; ソースファイル名情報。naskのオブジェクトファイルモードでは必須。

		GLOBAL	_io_hlt,_write_mem8			; このプログラムに含まれる関数名。prefixの_は命名規則


; 以下は実際の関数

[SECTION .text]		; オブジェクトファイルではこれを書いてからプログラムを書く

_io_hlt:	; void io_hlt(void); HLT命令はI/O命令に属する
		HLT
		RET

; C言語に直接メモリ番地を指定して書くための関数
_write_mem8:	; void write_mem8(int addr, int data);
		MOV		ECX,[ESP+4]		; [ESP+4]にaddrが入っているのでそれをECXに読み込む
		MOV		AL,[ESP+8]		; [ESP+8]にdataが入っているのでそれをALに読み込む
		MOV		[ECX],AL
		RET