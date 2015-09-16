	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 10
	.globl	_lowstr
	.align	4, 0x90
_lowstr:                                ## @lowstr
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0, %ecx
	je	LBB0_4
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	movq	-16(%rbp), %rax
	movsbl	(%rax), %edi
	callq	_tolower
	movb	%al, %cl
	movq	-16(%rbp), %rdx
	movb	%cl, (%rdx)
## BB#3:                                ##   in Loop: Header=BB0_1 Depth=1
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	LBB0_1
LBB0_4:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_menu
	.align	4, 0x90
_menu:                                  ## @menu
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str1(%rip), %rdi
	movl	%eax, -4(%rbp)          ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str2(%rip), %rdi
	movl	%eax, -8(%rbp)          ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str3(%rip), %rdi
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str4(%rip), %rdi
	movl	%eax, -16(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str5(%rip), %rdi
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str6(%rip), %rdi
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movq	___stdoutp@GOTPCREL(%rip), %rdi
	movq	(%rdi), %rdi
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	callq	_fflush
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_create
	.align	4, 0x90
_create:                                ## @create
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movl	$80, %eax
	movl	%eax, %edi
	callq	_malloc
	leaq	L_.str7(%rip), %rdi
	movq	%rax, -8(%rbp)
	movb	$0, %al
	callq	_printf
	leaq	L_.str8(%rip), %rdi
	movq	-8(%rbp), %rcx
	addq	$4, %rcx
	movq	%rcx, %rsi
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	cmpl	$0, %eax
	jge	LBB2_2
## BB#1:
	leaq	L_.str9(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_2:
	leaq	L_.str10(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str11(%rip), %rdi
	movq	-8(%rbp), %rcx
	addq	$36, %rcx
	movq	%rcx, %rsi
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	cmpl	$0, %eax
	jge	LBB2_4
## BB#3:
	leaq	L_.str9(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_4:
	leaq	L_.str12(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str8(%rip), %rdi
	movq	-8(%rbp), %rcx
	addq	$40, %rcx
	movq	%rcx, %rsi
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	cmpl	$0, %eax
	jge	LBB2_6
## BB#5:
	leaq	L_.str9(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_6:
	leaq	L_.str13(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str11(%rip), %rdi
	movq	-8(%rbp), %rcx
	addq	$56, %rcx
	movq	%rcx, %rsi
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	cmpl	$0, %eax
	jge	LBB2_8
## BB#7:
	leaq	L_.str9(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_8:
	leaq	L_.str14(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str15(%rip), %rdi
	movq	-8(%rbp), %rcx
	addq	$64, %rcx
	movq	%rcx, %rsi
	movl	%eax, -68(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	cmpl	$0, %eax
	jge	LBB2_10
## BB#9:
	leaq	L_.str9(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_10:
	leaq	L_.str16(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str17(%rip), %rdi
	movq	-8(%rbp), %rcx
	addq	$72, %rcx
	movq	%rcx, %rsi
	movl	%eax, -72(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	cmpl	$0, %eax
	jge	LBB2_12
## BB#11:
	leaq	L_.str9(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_12:
	leaq	L_.str18(%rip), %rdi
	leaq	L_.str19(%rip), %rsi
	callq	_fopen
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB2_16
## BB#13:
	leaq	L_.str18(%rip), %rdi
	leaq	L_.str20(%rip), %rsi
	callq	_fopen
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB2_15
## BB#14:
	leaq	L_.str21(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_15:
	jmp	LBB2_16
LBB2_16:
	movl	$80, %eax
	movl	%eax, %edi
	callq	_malloc
	movq	%rax, -32(%rbp)
	movq	$0, -40(%rbp)
LBB2_17:                                ## =>This Inner Loop Header: Depth=1
	movl	$80, %eax
	movl	%eax, %esi
	movl	$1, %eax
	movl	%eax, %edx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdi
	movq	%rdi, -80(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	callq	_fread
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movslq	(%rax), %rax
	cmpq	-40(%rbp), %rax
	jb	LBB2_19
## BB#18:                               ##   in Loop: Header=BB2_17 Depth=1
	movq	-32(%rbp), %rax
	movslq	(%rax), %rax
	movq	%rax, -40(%rbp)
LBB2_19:                                ##   in Loop: Header=BB2_17 Depth=1
	jmp	LBB2_20
LBB2_20:                                ##   in Loop: Header=BB2_17 Depth=1
	cmpq	$0, -16(%rbp)
	jne	LBB2_17
## BB#21:
	movq	-24(%rbp), %rdi
	callq	_feof
	cmpl	$0, %eax
	jne	LBB2_23
## BB#22:
	leaq	L_.str22(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_23:
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movl	%eax, %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	movq	-24(%rbp), %rdi
	callq	_fclose
	movslq	%eax, %rdi
	movq	%rdi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	LBB2_25
## BB#24:
	leaq	L_.str23(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_25:
	leaq	L_.str18(%rip), %rdi
	leaq	L_.str24(%rip), %rsi
	callq	_fopen
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	LBB2_27
## BB#26:
	leaq	L_.str21(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_27:
	movl	$80, %eax
	movl	%eax, %esi
	movl	$1, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rcx
	movq	-48(%rbp), %rdi
	movq	%rdi, -88(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	-88(%rbp), %rcx         ## 8-byte Reload
	callq	_fwrite
	movq	%rax, -16(%rbp)
	cmpq	$-1, -16(%rbp)
	jne	LBB2_29
## BB#28:
	leaq	L_.str25(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_29:
	movq	-48(%rbp), %rdi
	callq	_fclose
	movslq	%eax, %rdi
	movq	%rdi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	LBB2_31
## BB#30:
	leaq	L_.str23(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB2_31:
	leaq	L_.str26(%rip), %rdi
	movq	-8(%rbp), %rax
	movl	(%rax), %esi
	movb	$0, %al
	callq	_printf
	movq	-8(%rbp), %rdi
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	callq	_free
	movq	___stdoutp@GOTPCREL(%rip), %rdi
	movq	(%rdi), %rdi
	callq	_fflush
	movl	%eax, -96(%rbp)         ## 4-byte Spill
	addq	$96, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_list
	.align	4, 0x90
_list:                                  ## @list
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp9:
	.cfi_def_cfa_offset 16
Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp11:
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	leaq	L_.str18(%rip), %rdi
	leaq	L_.str19(%rip), %rsi
	callq	_fopen
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	LBB3_2
## BB#1:
	leaq	L_.str27(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	jmp	LBB3_28
LBB3_2:
	movl	$80, %eax
	movl	%eax, %edi
	callq	_malloc
	leaq	L_.str28(%rip), %rdi
	movq	%rax, -24(%rbp)
	movb	$0, %al
	callq	_printf
	movl	%eax, -48(%rbp)         ## 4-byte Spill
LBB3_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	$80, %eax
	movl	%eax, %esi
	movl	$1, %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdi
	movq	%rdi, -56(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	callq	_fread
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	LBB3_5
## BB#4:                                ##   in Loop: Header=BB3_3 Depth=1
	leaq	L_.str29(%rip), %rdi
	movq	-24(%rbp), %rax
	movl	(%rax), %esi
	movq	-24(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rdx
	movb	$0, %al
	callq	_printf
	movl	%eax, -60(%rbp)         ## 4-byte Spill
LBB3_5:                                 ##   in Loop: Header=BB3_3 Depth=1
	jmp	LBB3_6
LBB3_6:                                 ##   in Loop: Header=BB3_3 Depth=1
	cmpq	$0, -8(%rbp)
	jne	LBB3_3
## BB#7:
	movq	-16(%rbp), %rdi
	callq	_feof
	cmpl	$0, %eax
	jne	LBB3_9
## BB#8:
	leaq	L_.str22(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB3_9:
	movl	$4, %eax
	movl	%eax, %edi
	callq	_malloc
	leaq	L_.str30(%rip), %rdi
	movq	%rax, -32(%rbp)
	movb	$0, %al
	callq	_printf
	leaq	L_.str11(%rip), %rdi
	movq	-32(%rbp), %rsi
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	cmpl	$0, %eax
	jge	LBB3_11
## BB#10:
	leaq	L_.str9(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB3_11:
	leaq	L_.str18(%rip), %rdi
	leaq	L_.str19(%rip), %rsi
	callq	_fopen
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	LBB3_13
## BB#12:
	leaq	L_.str21(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB3_13:
	jmp	LBB3_14
LBB3_14:                                ## =>This Inner Loop Header: Depth=1
	movl	$80, %eax
	movl	%eax, %esi
	movl	$1, %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rdi
	movq	%rdi, -72(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	callq	_fread
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %r8d
	movq	-32(%rbp), %rax
	cmpl	(%rax), %r8d
	jle	LBB3_16
## BB#15:
	leaq	L_.str31(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	jmp	LBB3_21
LBB3_16:                                ##   in Loop: Header=BB3_14 Depth=1
	movq	-24(%rbp), %rax
	movl	(%rax), %ecx
	movq	-32(%rbp), %rax
	cmpl	(%rax), %ecx
	jne	LBB3_18
## BB#17:
	leaq	L_.str32(%rip), %rdi
	movq	-24(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	leaq	L_.str33(%rip), %rdi
	movq	-24(%rbp), %rsi
	movl	36(%rsi), %esi
	movl	%eax, -80(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str34(%rip), %rdi
	movq	-24(%rbp), %rcx
	addq	$40, %rcx
	movq	%rcx, %rsi
	movl	%eax, -84(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str35(%rip), %rdi
	movq	-24(%rbp), %rcx
	movl	56(%rcx), %esi
	movl	%eax, -88(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str36(%rip), %rdi
	movq	-24(%rbp), %rcx
	movsd	64(%rcx), %xmm0
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	movb	$1, %al
	callq	_printf
	leaq	L_.str37(%rip), %rdi
	movq	-24(%rbp), %rcx
	movsbl	72(%rcx), %esi
	movl	%eax, -96(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	%eax, -100(%rbp)        ## 4-byte Spill
	jmp	LBB3_21
LBB3_18:                                ##   in Loop: Header=BB3_14 Depth=1
	jmp	LBB3_19
LBB3_19:                                ##   in Loop: Header=BB3_14 Depth=1
	jmp	LBB3_20
LBB3_20:                                ##   in Loop: Header=BB3_14 Depth=1
	cmpq	$0, -8(%rbp)
	jne	LBB3_14
LBB3_21:
	movq	-40(%rbp), %rdi
	callq	_feof
	cmpl	$0, %eax
	jne	LBB3_24
## BB#22:
	movq	-24(%rbp), %rax
	movl	(%rax), %ecx
	movq	-32(%rbp), %rax
	cmpl	(%rax), %ecx
	jge	LBB3_24
## BB#23:
	leaq	L_.str38(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB3_24:
	movq	-24(%rbp), %rax
	movl	(%rax), %ecx
	movq	-32(%rbp), %rax
	cmpl	(%rax), %ecx
	je	LBB3_26
## BB#25:
	leaq	L_.str31(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -104(%rbp)        ## 4-byte Spill
LBB3_26:
	jmp	LBB3_27
LBB3_27:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	movq	___stdoutp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	_fflush
	movl	%eax, -108(%rbp)        ## 4-byte Spill
LBB3_28:
	movq	-16(%rbp), %rdi
	callq	_fclose
	movslq	%eax, %rdi
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	LBB3_30
## BB#29:
	leaq	L_.str23(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB3_30:
	movq	___stdoutp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	_fflush
	movl	%eax, -112(%rbp)        ## 4-byte Spill
	addq	$112, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_erase
	.align	4, 0x90
_erase:                                 ## @erase
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp14:
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	leaq	L_.str30(%rip), %rdi
	leaq	L_.str39(%rip), %rax
	movq	%rax, -16(%rbp)
	movb	$0, %al
	callq	_printf
	leaq	L_.str11(%rip), %rdi
	leaq	-4(%rbp), %rsi
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	cmpl	$0, %eax
	jge	LBB4_2
## BB#1:
	leaq	L_.str9(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB4_2:
	movl	$80, %eax
	movl	%eax, %edi
	movl	$0, -36(%rbp)
	callq	_malloc
	leaq	L_.str18(%rip), %rdi
	leaq	L_.str19(%rip), %rsi
	movq	%rax, -48(%rbp)
	callq	_fopen
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB4_4
## BB#3:
	leaq	L_.str18(%rip), %rdi
	callq	_perror
	movl	$1, %edi
	callq	_exit
LBB4_4:
	leaq	L_.str40(%rip), %rsi
	movq	-16(%rbp), %rdi
	callq	_fopen
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	LBB4_6
## BB#5:
	leaq	L_.str41(%rip), %rdi
	callq	_perror
	movl	$1, %edi
	callq	_exit
LBB4_6:
	movl	$0, -60(%rbp)
LBB4_7:                                 ## =>This Inner Loop Header: Depth=1
	movl	$80, %eax
	movl	%eax, %esi
	movl	$1, %eax
	movl	%eax, %edx
	movq	-48(%rbp), %rcx
	movq	-24(%rbp), %rdi
	movq	%rdi, -72(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	callq	_fread
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rax
	movl	(%rax), %r8d
	cmpl	-4(%rbp), %r8d
	je	LBB4_12
## BB#8:                                ##   in Loop: Header=BB4_7 Depth=1
	cmpq	$0, -56(%rbp)
	je	LBB4_12
## BB#9:                                ##   in Loop: Header=BB4_7 Depth=1
	movl	$80, %eax
	movl	%eax, %esi
	movl	$1, %eax
	movl	%eax, %edx
	movq	-48(%rbp), %rcx
	movq	-32(%rbp), %rdi
	movq	%rdi, -80(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	callq	_fwrite
	movq	%rax, -56(%rbp)
	cmpq	$-1, -56(%rbp)
	jne	LBB4_11
## BB#10:
	leaq	L_.str25(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB4_11:                                ##   in Loop: Header=BB4_7 Depth=1
	jmp	LBB4_15
LBB4_12:                                ##   in Loop: Header=BB4_7 Depth=1
	movq	-48(%rbp), %rax
	movl	(%rax), %ecx
	cmpl	-4(%rbp), %ecx
	jne	LBB4_14
## BB#13:                               ##   in Loop: Header=BB4_7 Depth=1
	movl	$1, -36(%rbp)
LBB4_14:                                ##   in Loop: Header=BB4_7 Depth=1
	jmp	LBB4_15
LBB4_15:                                ##   in Loop: Header=BB4_7 Depth=1
	jmp	LBB4_16
LBB4_16:                                ##   in Loop: Header=BB4_7 Depth=1
	cmpq	$0, -56(%rbp)
	jne	LBB4_7
## BB#17:
	movq	-24(%rbp), %rdi
	callq	_feof
	cmpl	$0, %eax
	jne	LBB4_19
## BB#18:
	leaq	L_.str22(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB4_19:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	movq	-24(%rbp), %rdi
	callq	_fclose
	movq	-32(%rbp), %rdi
	movl	%eax, -84(%rbp)         ## 4-byte Spill
	callq	_fclose
	cmpl	$0, -36(%rbp)
	movl	%eax, -88(%rbp)         ## 4-byte Spill
	je	LBB4_23
## BB#20:
	leaq	L_.str18(%rip), %rsi
	movq	-16(%rbp), %rdi
	callq	_rename
	movslq	%eax, %rsi
	movq	%rsi, -56(%rbp)
	cmpq	$-1, -56(%rbp)
	jne	LBB4_22
## BB#21:
	leaq	L_.str42(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB4_22:
	leaq	L_.str43(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	jmp	LBB4_26
LBB4_23:
	movq	-16(%rbp), %rdi
	callq	_remove
	movslq	%eax, %rdi
	movq	%rdi, -56(%rbp)
	cmpq	$-1, -56(%rbp)
	jne	LBB4_25
## BB#24:
	leaq	L_.str42(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB4_25:
	leaq	L_.str44(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -96(%rbp)         ## 4-byte Spill
LBB4_26:
	addq	$96, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_search
	.align	4, 0x90
_search:                                ## @search
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp15:
	.cfi_def_cfa_offset 16
Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp17:
	.cfi_def_cfa_register %rbp
	subq	$144, %rsp
	movl	$80, %eax
	movl	%eax, %edi
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -8(%rbp)
	movl	$0, -60(%rbp)
	callq	_malloc
	leaq	L_.str18(%rip), %rdi
	leaq	L_.str19(%rip), %rsi
	movq	%rax, -72(%rbp)
	callq	_fopen
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	LBB5_2
## BB#1:
	leaq	L_.str27(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -108(%rbp)        ## 4-byte Spill
	jmp	LBB5_17
LBB5_2:
	leaq	L_.str45(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str8(%rip), %rdi
	leaq	-48(%rbp), %rsi
	movl	%eax, -112(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	cmpl	$0, %eax
	jge	LBB5_4
## BB#3:
	leaq	L_.str9(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB5_4:
	leaq	L_.str18(%rip), %rdi
	leaq	L_.str19(%rip), %rsi
	callq	_fopen
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	LBB5_6
## BB#5:
	leaq	L_.str21(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB5_6:
	movl	$1, %eax
	movl	%eax, %edi
	callq	_malloc
	movl	$1, %ecx
	movl	%ecx, %edi
	movq	%rax, -96(%rbp)
	callq	_malloc
	movq	%rax, -104(%rbp)
LBB5_7:                                 ## =>This Inner Loop Header: Depth=1
	movl	$80, %eax
	movl	%eax, %esi
	movl	$1, %eax
	movl	%eax, %edx
	movq	-72(%rbp), %rcx
	movq	-88(%rbp), %rdi
	movq	%rdi, -120(%rbp)        ## 8-byte Spill
	movq	%rcx, %rdi
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	callq	_fread
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	LBB5_9
## BB#8:
	jmp	LBB5_12
LBB5_9:                                 ##   in Loop: Header=BB5_7 Depth=1
	movq	-72(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rdi
	callq	_lowstr
	leaq	-48(%rbp), %rdi
	callq	_lowstr
	leaq	-48(%rbp), %rsi
	movq	-72(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rdi
	callq	_strstr
	cmpq	$0, %rax
	je	LBB5_11
## BB#10:                               ##   in Loop: Header=BB5_7 Depth=1
	leaq	L_.str46(%rip), %rdi
	movq	-72(%rbp), %rax
	movl	(%rax), %esi
	movq	-72(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rdx
	movb	$0, %al
	callq	_printf
	movl	$1, -60(%rbp)
	movl	%eax, -124(%rbp)        ## 4-byte Spill
LBB5_11:                                ##   in Loop: Header=BB5_7 Depth=1
	jmp	LBB5_7
LBB5_12:
	movq	-88(%rbp), %rdi
	callq	_feof
	cmpl	$0, %eax
	jne	LBB5_14
## BB#13:
	leaq	L_.str38(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB5_14:
	cmpl	$0, -60(%rbp)
	jne	LBB5_16
## BB#15:
	leaq	L_.str47(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -128(%rbp)        ## 4-byte Spill
LBB5_16:
	movq	-96(%rbp), %rdi
	callq	_free
	movq	-104(%rbp), %rdi
	callq	_free
	movq	-72(%rbp), %rdi
	callq	_free
	movq	___stdoutp@GOTPCREL(%rip), %rdi
	movq	(%rdi), %rdi
	callq	_fflush
	movl	%eax, -132(%rbp)        ## 4-byte Spill
LBB5_17:
	movq	-80(%rbp), %rdi
	callq	_fclose
	movslq	%eax, %rdi
	movq	%rdi, -56(%rbp)
	cmpq	$0, -56(%rbp)
	je	LBB5_19
## BB#18:
	leaq	L_.str23(%rip), %rdi
	callq	_perror
	movl	$4294967295, %edi       ## imm = 0xFFFFFFFF
	callq	_exit
LBB5_19:
	movq	___stdoutp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	callq	_fflush
	movq	___stack_chk_guard@GOTPCREL(%rip), %rdi
	movq	(%rdi), %rdi
	cmpq	-8(%rbp), %rdi
	movl	%eax, -136(%rbp)        ## 4-byte Spill
	jne	LBB5_21
## BB#20:                               ## %SP_return
	addq	$144, %rsp
	popq	%rbp
	retq
LBB5_21:                                ## %CallStackCheckFailBlk
	callq	___stack_chk_fail
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp18:
	.cfi_def_cfa_offset 16
Ltmp19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp20:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movb	$99, -17(%rbp)
LBB6_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB6_3 Depth 2
	movsbl	-17(%rbp), %eax
	cmpl	$115, %eax
	je	LBB6_13
## BB#2:                                ##   in Loop: Header=BB6_1 Depth=1
	callq	_menu
	leaq	L_.str48(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -24(%rbp)         ## 4-byte Spill
LBB6_3:                                 ##   Parent Loop BB6_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	callq	_getchar
	movb	%al, %cl
	movb	%cl, -17(%rbp)
## BB#4:                                ##   in Loop: Header=BB6_3 Depth=2
	movsbl	-17(%rbp), %edi
	callq	_isspace
	cmpl	$0, %eax
	jne	LBB6_3
## BB#5:                                ##   in Loop: Header=BB6_1 Depth=1
	movsbl	-17(%rbp), %edi
	callq	_tolower
	movl	%eax, %edi
	subl	$110, %eax
	movl	%edi, -28(%rbp)         ## 4-byte Spill
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	jg	LBB6_15
	jmp	LBB6_14
LBB6_14:                                ##   in Loop: Header=BB6_1 Depth=1
	movl	-28(%rbp), %eax         ## 4-byte Reload
	subl	$105, %eax
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	je	LBB6_6
	jmp	LBB6_11
LBB6_15:                                ##   in Loop: Header=BB6_1 Depth=1
	movl	-28(%rbp), %eax         ## 4-byte Reload
	addl	$-111, %eax
	movl	%eax, %ecx
	subl	$7, %eax
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	ja	LBB6_11
## BB#16:                               ##   in Loop: Header=BB6_1 Depth=1
	leaq	LJTI6_0(%rip), %rax
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB6_6:                                 ##   in Loop: Header=BB6_1 Depth=1
	callq	_create
	jmp	LBB6_12
LBB6_7:                                 ##   in Loop: Header=BB6_1 Depth=1
	callq	_list
	jmp	LBB6_12
LBB6_8:                                 ##   in Loop: Header=BB6_1 Depth=1
	callq	_erase
	jmp	LBB6_12
LBB6_9:                                 ##   in Loop: Header=BB6_1 Depth=1
	callq	_search
	jmp	LBB6_12
LBB6_10:                                ##   in Loop: Header=BB6_1 Depth=1
	leaq	L_.str49(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	jmp	LBB6_12
LBB6_11:                                ##   in Loop: Header=BB6_1 Depth=1
	leaq	L_.str50(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -60(%rbp)         ## 4-byte Spill
LBB6_12:                                ##   in Loop: Header=BB6_1 Depth=1
	jmp	LBB6_1
LBB6_13:
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
	.align	2, 0x90
L6_0_set_8 = LBB6_8-LJTI6_0
L6_0_set_11 = LBB6_11-LJTI6_0
L6_0_set_10 = LBB6_10-LJTI6_0
L6_0_set_9 = LBB6_9-LJTI6_0
L6_0_set_7 = LBB6_7-LJTI6_0
LJTI6_0:
	.long	L6_0_set_8
	.long	L6_0_set_11
	.long	L6_0_set_11
	.long	L6_0_set_11
	.long	L6_0_set_10
	.long	L6_0_set_11
	.long	L6_0_set_9
	.long	L6_0_set_7

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"\n"

L_.str1:                                ## @.str1
	.asciz	"MENU: \n"

L_.str2:                                ## @.str2
	.asciz	"[i]: Ingresar registro\n"

L_.str3:                                ## @.str3
	.asciz	"[v]: Ver registro\n"

L_.str4:                                ## @.str4
	.asciz	"[o]: Borrar registro\n"

L_.str5:                                ## @.str5
	.asciz	"[u]: Buscar registro\n"

L_.str6:                                ## @.str6
	.asciz	"[s]: Salir\n"

L_.str7:                                ## @.str7
	.asciz	"Ingrese el nombre: "

L_.str8:                                ## @.str8
	.asciz	"%s"

L_.str9:                                ## @.str9
	.asciz	"Couldn't read the string"

L_.str10:                               ## @.str10
	.asciz	"Ingrese la edad: "

L_.str11:                               ## @.str11
	.asciz	"%u"

L_.str12:                               ## @.str12
	.asciz	"Ingrese la raza: "

L_.str13:                               ## @.str13
	.asciz	"Ingrese la estatura: "

L_.str14:                               ## @.str14
	.asciz	"Ingrese el peso: "

L_.str15:                               ## @.str15
	.asciz	"%lf"

L_.str16:                               ## @.str16
	.asciz	"Ingrese el sexo[m/f]: "

L_.str17:                               ## @.str17
	.asciz	" %c"

L_.str18:                               ## @.str18
	.asciz	"dataDogs.dat"

L_.str19:                               ## @.str19
	.asciz	"r"

L_.str20:                               ## @.str20
	.asciz	"w+"

L_.str21:                               ## @.str21
	.asciz	"Couldn't open the file"

L_.str22:                               ## @.str22
	.asciz	"Couldn't read the file"

L_.str23:                               ## @.str23
	.asciz	"Couldn't close the file"

L_.str24:                               ## @.str24
	.asciz	"a"

L_.str25:                               ## @.str25
	.asciz	"Couldn't write in the file"

L_.str26:                               ## @.str26
	.asciz	"\nDatos guardados con id: %d\n"

L_.str27:                               ## @.str27
	.asciz	"El archivo no existe"

L_.str28:                               ## @.str28
	.asciz	"Lista de animales:\n"

L_.str29:                               ## @.str29
	.asciz	"Id: %d Nombre: %s\n"

L_.str30:                               ## @.str30
	.asciz	"\nSeleccione el id: "

L_.str31:                               ## @.str31
	.asciz	"Id no encontrado\n"

L_.str32:                               ## @.str32
	.asciz	"Nombre: %s\n"

L_.str33:                               ## @.str33
	.asciz	"Edad: %u\n"

L_.str34:                               ## @.str34
	.asciz	"Raza: %s\n"

L_.str35:                               ## @.str35
	.asciz	"Estatura: %u\n"

L_.str36:                               ## @.str36
	.asciz	"Peso: %le\n"

L_.str37:                               ## @.str37
	.asciz	"Sexo: %c\n"

L_.str38:                               ## @.str38
	.asciz	"Couldn't list the file"

L_.str39:                               ## @.str39
	.asciz	"result.dat"

L_.str40:                               ## @.str40
	.asciz	"w"

L_.str41:                               ## @.str41
	.asciz	"temp.dat"

L_.str42:                               ## @.str42
	.asciz	"Couldn't delete the file"

L_.str43:                               ## @.str43
	.asciz	"El elemento ha sido borrado\n"

L_.str44:                               ## @.str44
	.asciz	"Elemento no encontrado\n"

L_.str45:                               ## @.str45
	.asciz	"\nSeleccione el nombre: "

L_.str46:                               ## @.str46
	.asciz	"Id: %d, Nombre: %s\n"

L_.str47:                               ## @.str47
	.asciz	"Nombre no encontrado\n"

L_.str48:                               ## @.str48
	.asciz	"Comando>> "

L_.str49:                               ## @.str49
	.asciz	"\nGracias y hasta la vista!!!\n"

L_.str50:                               ## @.str50
	.asciz	"Comando desconocido!\n"


.subsections_via_symbols
