/* 他のファイルで作った関数がありますとCコンパイラに教える */
void io_hlt(void);

/* 関数宣言なのに、{}がなくていきなり;を書くと、
	他のファイルにあるからよろしくね、という意味になるのです。 */

void HariMain(void)
{
	int i; /* 32 bit整数型 */
	char *p; /* pという変数は、BYTE [...]用の番地 */


	for (i = 0xa0000; i <= 0xaffff; i++) {
		p = (char *) i; /* 番地を代入 */
	    /* 下位4bitのANDをとってしましま模様を出す */
		*p = i & 0x0f;
	}

	for (;;) {
		io_hlt(); /* これでnaskfunc.nasの_io_hltが実行されます */
	}
}
