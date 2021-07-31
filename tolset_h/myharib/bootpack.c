/* 他のファイルで作った関数がありますとCコンパイラに教える */
void io_hlt(void);
void write_mem8(int addr, int data);

/* 関数宣言なのに、{}がなくていきなり;を書くと、
	他のファイルにあるからよろしくね、という意味になるのです。 */

void HariMain(void)
{
	int i; /* 32 bit整数型 */

	for (i = 0xa0000; i <= 0xaffff; i++) {
	    /* 下位4bitのANDをとってしましま模様を出す */
		write_mem8(i, i & 0x0f); /* MOV BYTE [i], i & 0x0f */
	}

	for (;;) {
		io_hlt(); /* これでnaskfunc.nasの_io_hltが実行されます */
	}
}
