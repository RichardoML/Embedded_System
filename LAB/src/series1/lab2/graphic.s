	.arch armv7-a
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"graphic.c"
	.text
	.align	2
	.type	abs, %function
abs:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	abs, .-abs
	.local	LCD_MEM_BUFFER
	.comm	LCD_MEM_BUFFER,2457600,4
	.local	LCD_FRAME_BUFFER
	.comm	LCD_FRAME_BUFFER,4,4
	.local	update_area
	.comm	update_area,16,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Unable to open framebuffer %s, errno = %d\012\000"
	.align	2
.LC1:
	.ascii	"Unable to FBIOGET_FSCREENINFO %s\012\000"
	.align	2
.LC2:
	.ascii	"Unable to FBIOGET_VSCREENINFO %s\012\000"
	.align	2
.LC3:
	.ascii	"framebuffer info: bits_per_pixel=%u  width=%u  heig"
	.ascii	"ht=%u  line_length=%u  smem_len=%u\012\000"
	.align	2
.LC4:
	.ascii	"failed to mmap memory for framebuffer.\000"
	.text
	.align	2
	.global	fb_init
	.type	fb_init, %function
fb_init:
	@ args = 0, pretend = 0, frame = 248
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #256
	str	r0, [fp, #-248]
	ldr	r3, .L10
.LPIC0:
	add	r3, pc, r3
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L9
.L3:
	ldr	r0, [fp, #-248]
	mov	r1, #2
	bl	open(PLT)
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L5
	bl	__errno(PLT)
	mov	r3, r0
	ldr	r2, [r3, #0]
	ldr	r3, .L10+4
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	ldr	r1, [fp, #-248]
	bl	printf(PLT)
	b	.L2
.L5:
	sub	r3, fp, #84
	ldr	r0, [fp, #-8]
	movw	r1, #17922
	mov	r2, r3
	bl	ioctl(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L6
	ldr	r3, .L10+8
.LPIC2:
	add	r3, pc, r3
	mov	r0, r3
	ldr	r1, [fp, #-248]
	bl	printf(PLT)
	b	.L2
.L6:
	sub	r3, fp, #244
	ldr	r0, [fp, #-8]
	mov	r1, #17920
	mov	r2, r3
	bl	ioctl(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L7
	ldr	r3, .L10+12
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	ldr	r1, [fp, #-248]
	bl	printf(PLT)
	b	.L2
.L7:
	ldr	r1, [fp, #-220]
	ldr	r2, [fp, #-244]
	ldr	ip, [fp, #-240]
	ldr	r0, [fp, #-40]
	ldr	r3, [fp, #-64]
	str	r0, [sp, #0]
	str	r3, [sp, #4]
	ldr	r3, .L10+16
.LPIC4:
	add	r3, pc, r3
	mov	r0, r3
	mov	r3, ip
	bl	printf(PLT)
	ldr	r3, [fp, #-244]
	ldr	r2, [fp, #-240]
	mul	r3, r2, r3
	ldr	r2, [fp, #-220]
	mul	r3, r2, r3
	mov	r3, r3, lsr #3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	str	r3, [sp, #0]
	mov	r3, #0
	str	r3, [sp, #4]
	mov	r0, #0
	ldr	r1, [fp, #-12]
	mov	r2, #3
	mov	r3, #1
	bl	mmap(PLT)
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmn	r3, #1
	bne	.L8
	ldr	r3, .L10+20
.LPIC5:
	add	r3, pc, r3
	mov	r0, r3
	bl	puts(PLT)
	b	.L2
.L8:
	ldr	r3, .L10+24
.LPIC6:
	add	r3, pc, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #0]
	mov	r0, r0	@ nop
	b	.L2
.L9:
	mov	r0, r0	@ nop
.L2:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L11:
	.align	2
.L10:
	.word	LCD_FRAME_BUFFER-(.LPIC0+8)
	.word	.LC0-(.LPIC1+8)
	.word	.LC1-(.LPIC2+8)
	.word	.LC2-(.LPIC3+8)
	.word	.LC3-(.LPIC4+8)
	.word	.LC4-(.LPIC5+8)
	.word	LCD_FRAME_BUFFER-(.LPIC6+8)
	.size	fb_init, .-fb_init
	.section	.rodata
	.align	2
.LC5:
	.ascii	"error: not allocate space for frame buffer\000"
	.text
	.align	2
	.global	fb_update
	.type	fb_update, %function
fb_update:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	ldr	r3, .L24
.LPIC7:
	add	r3, pc, r3
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L13
	ldr	r3, .L24+4
.LPIC8:
	add	r3, pc, r3
	mov	r0, r3
	bl	puts(PLT)
	b	.L12
.L13:
	ldr	r3, .L24+8
.LPIC9:
	add	r3, pc, r3
	ldr	r2, [r3, #0]
	movw	r3, #1023
	cmp	r2, r3
	bgt	.L23
	ldr	r3, .L24+12
.LPIC10:
	add	r3, pc, r3
	ldr	r3, [r3, #8]
	cmp	r3, #0
	ble	.L23
	ldr	r3, .L24+16
.LPIC11:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	movw	r3, #599
	cmp	r2, r3
	bgt	.L23
	ldr	r3, .L24+20
.LPIC12:
	add	r3, pc, r3
	ldr	r3, [r3, #12]
	cmp	r3, #0
	ble	.L23
.L16:
	ldr	r3, .L24+24
.LPIC13:
	add	r3, pc, r3
	ldr	r3, [r3, #0]
	bic	r3, r3, r3, asr #31
	str	r3, [fp, #-20]
	ldr	r3, .L24+28
.LPIC14:
	add	r3, pc, r3
	ldr	r3, [r3, #4]
	bic	r3, r3, r3, asr #31
	str	r3, [fp, #-24]
	ldr	r3, .L24+32
.LPIC15:
	add	r3, pc, r3
	ldr	r3, [r3, #8]
	cmp	r3, #1024
	ble	.L17
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #1024
	b	.L18
.L17:
	ldr	r3, .L24+36
.LPIC16:
	add	r3, pc, r3
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, r2
.L18:
	str	r3, [fp, #-28]
	ldr	r3, .L24+40
.LPIC17:
	add	r3, pc, r3
	ldr	r3, [r3, #12]
	cmp	r3, #600
	ble	.L19
	ldr	r3, [fp, #-24]
	rsb	r3, r3, #600
	b	.L20
.L19:
	ldr	r3, .L24+44
.LPIC18:
	add	r3, pc, r3
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	rsb	r3, r3, r2
.L20:
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #10
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #2
	ldr	r3, .L24+48
.LPIC19:
	add	r3, pc, r3
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, .L24+52
.LPIC20:
	add	r3, pc, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #10
	mov	r1, r3
	ldr	r3, [fp, #-20]
	add	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r2, r3
	str	r3, [fp, #-16]
	b	.L21
.L22:
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-12]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy(PLT)
	ldr	r3, [fp, #-12]
	add	r3, r3, #4096
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4096
	str	r3, [fp, #-16]
.L21:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	ldr	r2, [fp, #-8]
	sub	r2, r2, #1
	str	r2, [fp, #-8]
	cmp	r3, #0
	bne	.L22
	ldr	r3, .L24+56
.LPIC21:
	add	r3, pc, r3
	mov	r2, #0
	str	r2, [r3, #8]
	mov	r0, r0	@ nop
	b	.L12
.L23:
	mov	r0, r0	@ nop
.L12:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L25:
	.align	2
.L24:
	.word	LCD_FRAME_BUFFER-(.LPIC7+8)
	.word	.LC5-(.LPIC8+8)
	.word	update_area-(.LPIC9+8)
	.word	update_area-(.LPIC10+8)
	.word	update_area-(.LPIC11+8)
	.word	update_area-(.LPIC12+8)
	.word	update_area-(.LPIC13+8)
	.word	update_area-(.LPIC14+8)
	.word	update_area-(.LPIC15+8)
	.word	update_area-(.LPIC16+8)
	.word	update_area-(.LPIC17+8)
	.word	update_area-(.LPIC18+8)
	.word	LCD_MEM_BUFFER-(.LPIC19+8)
	.word	LCD_FRAME_BUFFER-(.LPIC20+8)
	.word	update_area-(.LPIC21+8)
	.size	fb_update, .-fb_update
	.align	2
	.type	_update_area, %function
_update_area:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, .L33
.LPIC22:
	add	r3, pc, r3
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L27
	ldr	r3, .L33+4
.LPIC23:
	add	r3, pc, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, .L33+8
.LPIC24:
	add	r3, pc, r3
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, .L33+12
.LPIC25:
	add	r3, pc, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3, #8]
	ldr	r3, .L33+16
.LPIC26:
	add	r3, pc, r3
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
	b	.L32
.L27:
	ldr	r3, .L33+20
.LPIC27:
	add	r3, pc, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	ble	.L29
	ldr	r3, .L33+24
.LPIC28:
	add	r3, pc, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #0]
.L29:
	ldr	r3, .L33+28
.LPIC29:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L30
	ldr	r3, .L33+32
.LPIC30:
	add	r3, pc, r3
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
.L30:
	ldr	r3, .L33+36
.LPIC31:
	add	r3, pc, r3
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bge	.L31
	ldr	r3, .L33+40
.LPIC32:
	add	r3, pc, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3, #8]
.L31:
	ldr	r3, .L33+44
.LPIC33:
	add	r3, pc, r3
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L32
	ldr	r3, .L33+48
.LPIC34:
	add	r3, pc, r3
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
.L32:
	mov	r0, r0	@ nop
.L26:
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L34:
	.align	2
.L33:
	.word	update_area-(.LPIC22+8)
	.word	update_area-(.LPIC23+8)
	.word	update_area-(.LPIC24+8)
	.word	update_area-(.LPIC25+8)
	.word	update_area-(.LPIC26+8)
	.word	update_area-(.LPIC27+8)
	.word	update_area-(.LPIC28+8)
	.word	update_area-(.LPIC29+8)
	.word	update_area-(.LPIC30+8)
	.word	update_area-(.LPIC31+8)
	.word	update_area-(.LPIC32+8)
	.word	update_area-(.LPIC33+8)
	.word	update_area-(.LPIC34+8)
	.size	_update_area, .-_update_area
	.align	2
	.global	fb_draw_pixel
	.type	fb_draw_pixel, %function
fb_draw_pixel:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L39
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	blt	.L39
	ldr	r2, [fp, #-16]
	movw	r3, #1023
	cmp	r2, r3
	bgt	.L39
	ldr	r2, [fp, #-20]
	movw	r3, #599
	cmp	r2, r3
	bgt	.L39
.L37:
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r2, #1
	mov	r3, #1
	bl	_update_area(PLT)
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #10
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	mov	r2, r3, asl #2
	ldr	r3, .L40
.LPIC35:
	add	r3, pc, r3
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #0]
	mov	r0, r0	@ nop
	b	.L35
.L39:
	mov	r0, r0	@ nop
.L35:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L41:
	.align	2
.L40:
	.word	LCD_MEM_BUFFER-(.LPIC35+8)
	.size	fb_draw_pixel, .-fb_draw_pixel
	.align	2
	.global	fb_draw_rect
	.type	fb_draw_rect, %function
fb_draw_rect:
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	bl	_update_area(PLT)
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L43
.L46:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L44
.L45:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r1, r3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #4]
	bl	fb_draw_pixel(PLT)
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L44:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L45
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L43:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L46
	mov	r0, r0	@ nop
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	fb_draw_rect, .-fb_draw_rect
	.global	__aeabi_idiv
	.align	2
	.global	fb_draw_line
	.type	fb_draw_line, %function
fb_draw_line:
	@ args = 4, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #76
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	str	r2, [fp, #-88]
	str	r3, [fp, #-92]
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #-80]
	cmp	r2, r3
	movlt	r6, r2
	movge	r6, r3
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	movlt	r5, r2
	movge	r5, r3
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #-80]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	abs(PLT)
	mov	r4, r0
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-84]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	abs(PLT)
	mov	r3, r0
	mov	r0, r6
	mov	r1, r5
	mov	r2, r4
	bl	_update_area(PLT)
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-88]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	abs(PLT)
	str	r0, [fp, #-32]
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-92]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	abs(PLT)
	str	r0, [fp, #-36]
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #-80]
	rsb	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-84]
	rsb	r3, r3, r2
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #-80]
	cmp	r2, r3
	movge	r3, r2
	movlt	r3, r3
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	movge	r3, r2
	movlt	r3, r3
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #-80]
	cmp	r2, r3
	movlt	r3, r2
	movge	r3, r3
	str	r3, [fp, #-56]
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	movlt	r3, r2
	movge	r3, r3
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-44]
	fmsr	s15, r3	@ int
	fsitod	d17, s15
	ldr	r3, [fp, #-40]
	fmsr	s15, r3	@ int
	fsitod	d16, s15
	fdivd	d16, d17, d16
	fstd	d16, [fp, #-68]
	ldr	r3, [fp, #-40]
	fmsr	s15, r3	@ int
	fsitod	d17, s15
	ldr	r3, [fp, #-44]
	fmsr	s15, r3	@ int
	fsitod	d16, s15
	fdivd	d16, d17, d16
	fstd	d16, [fp, #-76]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-24]
	b	.L48
.L49:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-80]
	rsb	r3, r3, r2
	ldr	r2, [fp, #-44]
	mul	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-40]
	bl	__aeabi_idiv(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #4]
	bl	fb_draw_pixel(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L48:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L49
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-28]
	b	.L50
.L51:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-84]
	rsb	r3, r3, r2
	fmsr	s15, r3	@ int
	fsitod	d17, s15
	fldd	d16, [fp, #-76]
	fmuld	d16, d17, d16
	ldr	r3, [fp, #-80]
	fmsr	s15, r3	@ int
	fsitod	d17, s15
	faddd	d16, d16, d17
	ftosizd	s15, d16
	fmrs	r3, s15	@ int
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #4]
	bl	fb_draw_pixel(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L50:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	ble	.L51
	mov	r0, r0	@ nop
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, pc}
	.size	fb_draw_line, .-fb_draw_line
	.align	2
	.global	fb_draw_image
	.type	fb_draw_image, %function
fb_draw_image:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #72
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	str	r2, [fp, #-72]
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	beq	.L82
.L53:
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	bge	.L55
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-64]
	rsb	r3, r3, r2
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-64]
.L55:
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	bge	.L56
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-68]
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-68]
.L56:
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	cmp	r3, #1024
	ble	.L57
	ldr	r3, [fp, #-64]
	rsb	r3, r3, #1024
	str	r3, [fp, #-16]
.L57:
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	cmp	r3, #600
	ble	.L58
	ldr	r3, [fp, #-68]
	rsb	r3, r3, #600
	str	r3, [fp, #-20]
.L58:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	ble	.L83
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L83
.L60:
	ldr	r0, [fp, #-64]
	ldr	r1, [fp, #-68]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	bl	_update_area(PLT)
	ldr	r3, [fp, #-68]
	mov	r3, r3, asl #10
	mov	r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	mov	r2, r3, asl #2
	ldr	r3, .L87
.LPIC36:
	add	r3, pc, r3
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-72]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #12]
	ldr	r1, [fp, #-12]
	mul	r3, r1, r3
	mov	r1, r3
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	add	r3, r1, r3
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bne	.L61
	b	.L62
.L63:
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #12
	ldr	r2, [fp, #-32]
	add	r1, r2, r3
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #12]
	ldr	r2, [fp, #-24]
	mul	r3, r2, r3
	ldr	r2, [fp, #-36]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L62:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L63
	b	.L52
.L61:
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #0]
	cmp	r3, #2
	bne	.L64
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L65
.L72:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L66
.L71:
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #12]
	ldr	r2, [fp, #-24]
	mul	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	add	r3, r3, #3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #10
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L84
	cmp	r3, #255
	bne	.L67
.L69:
	ldr	r3, [fp, #-40]
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-48]
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	ldr	r2, [fp, #-40]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	add	r3, r3, #2
	ldr	r2, [fp, #-40]
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	strb	r2, [r3, #0]
.L67:
	ldr	r3, [fp, #-48]
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [fp, #-48]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r1
	ldr	r1, [fp, #-44]
	mul	r3, r1, r3
	mov	r3, r3, asr #8
	uxtb	r3, r3
	add	r3, r2, r3
	uxtb	r2, r3
	ldr	r3, [fp, #-48]
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	ldr	r2, [fp, #-48]
	add	r2, r2, #1
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-40]
	add	r2, r2, #1
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r0, r2
	ldr	r2, [fp, #-48]
	add	r2, r2, #1
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	rsb	r2, r2, r0
	ldr	r0, [fp, #-44]
	mul	r2, r0, r2
	mov	r2, r2, asr #8
	uxtb	r2, r2
	add	r2, r1, r2
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	add	r3, r3, #2
	ldr	r2, [fp, #-48]
	add	r2, r2, #2
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-40]
	add	r2, r2, #2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r0, r2
	ldr	r2, [fp, #-48]
	add	r2, r2, #2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	rsb	r2, r2, r0
	ldr	r0, [fp, #-44]
	mul	r2, r0, r2
	mov	r2, r2, asr #8
	uxtb	r2, r2
	add	r2, r1, r2
	uxtb	r2, r2
	strb	r2, [r3, #0]
	b	.L70
.L84:
	mov	r0, r0	@ nop
.L70:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L66:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L71
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L65:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L72
	b	.L52
.L64:
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bne	.L85
	ldr	r3, [fp, #-76]
	mov	r3, r3, asr #16
	strb	r3, [fp, #-49]
	ldr	r3, [fp, #-76]
	mov	r3, r3, asr #8
	strb	r3, [fp, #-50]
	ldr	r3, [fp, #-76]
	strb	r3, [fp, #-51]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L74
.L81:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L75
.L80:
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #12]
	ldr	r2, [fp, #-24]
	mul	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #10
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L86
	cmp	r3, #255
	bne	.L76
.L78:
	ldr	r3, [fp, #-60]
	add	r3, r3, #2
	ldrb	r2, [fp, #-49]
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	ldrb	r2, [fp, #-50]
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-60]
	ldrb	r2, [fp, #-51]
	strb	r2, [r3, #0]
.L76:
	ldr	r3, [fp, #-60]
	add	r3, r3, #2
	ldr	r2, [fp, #-60]
	add	r2, r2, #2
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	ldrb	r0, [fp, #-49]	@ zero_extendqisi2
	ldr	r2, [fp, #-60]
	add	r2, r2, #2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	rsb	r2, r2, r0
	ldr	r0, [fp, #-44]
	mul	r2, r0, r2
	mov	r2, r2, asr #8
	uxtb	r2, r2
	add	r2, r1, r2
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	ldr	r2, [fp, #-60]
	add	r2, r2, #1
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	ldrb	r0, [fp, #-50]	@ zero_extendqisi2
	ldr	r2, [fp, #-60]
	add	r2, r2, #1
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	rsb	r2, r2, r0
	ldr	r0, [fp, #-44]
	mul	r2, r0, r2
	mov	r2, r2, asr #8
	uxtb	r2, r2
	add	r2, r1, r2
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-60]
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldrb	r1, [fp, #-51]	@ zero_extendqisi2
	ldr	r3, [fp, #-60]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r1
	ldr	r1, [fp, #-44]
	mul	r3, r1, r3
	mov	r3, r3, asr #8
	uxtb	r3, r3
	add	r3, r2, r3
	uxtb	r2, r3
	ldr	r3, [fp, #-60]
	strb	r2, [r3, #0]
	b	.L79
.L86:
	mov	r0, r0	@ nop
.L79:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L75:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L80
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L74:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L81
	b	.L52
.L82:
	mov	r0, r0	@ nop
	b	.L52
.L83:
	mov	r0, r0	@ nop
	b	.L52
.L85:
	mov	r0, r0	@ nop
.L52:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L88:
	.align	2
.L87:
	.word	LCD_MEM_BUFFER-(.LPIC36+8)
	.size	fb_draw_image, .-fb_draw_image
	.align	2
	.global	fb_draw_text
	.type	fb_draw_text, %function
fb_draw_text:
	@ args = 4, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-48]
	bl	strlen(PLT)
	mov	r3, r0
	str	r3, [fp, #-12]
	b	.L90
.L93:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-48]
	add	r2, r2, r3
	sub	r3, fp, #32
	mov	r0, r2
	ldr	r1, [fp, #-52]
	mov	r2, r3
	bl	fb_read_font_image(PLT)
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L95
.L91:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	ldr	r1, [fp, #-44]
	rsb	r3, r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #4]
	bl	fb_draw_image(PLT)
	ldr	r0, [fp, #-16]
	bl	fb_free_image(PLT)
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
.L90:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	blt	.L93
	b	.L89
.L95:
	mov	r0, r0	@ nop
.L94:
	mov	r0, r0	@ nop
.L89:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	fb_draw_text, .-fb_draw_text
	.ident	"GCC: (GNU) 4.6 20120106 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
