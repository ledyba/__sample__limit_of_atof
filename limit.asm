	global  _main
	extern  _printf

	section .text
_main:
;fpuのスタックに1をロード（st1=1.0f）
	fld1
;fpuのスタックに問題の値をロード（st0=問題の値）
	push 0x010f074f
	push 0x31424000
	fild qword [esp]
	add esp, 8
;ちょっと四則演算をしてみる
	fadd st0, st1
	fsub st0, st1
	fmul st0, st1
	fdiv st0, st1
;浮動小数点から整数へ変換。
	sub esp, 8
	fistp qword [esp]
;表示
	push    messaged
	call    _printf
	add     esp, 12

;再度問題の値を読み込む
	push 0x010f074f
	push 0x31424000
	fild qword [esp]
;64ビット浮動小数点としてスタックに保存←おそらくここで下位ビットが失われる
	fstp qword [esp]
;表示
	push    messagef
	call    _printf
	add     esp, 4

;保存した64ビット浮動小数点を再度読み込み
	fld qword [esp]
;最後に64ビット整数として保存
	fistp qword [esp]
;表示
	push    messaged
	call    _printf
	add     esp, 12

	ret
messagef:
	db      "%f", 0x0a, 0
messaged:
	db      "%llu", 0x0a, 0
