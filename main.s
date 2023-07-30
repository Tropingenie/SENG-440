	.cpu arm920t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	imagePreprocessing
	.type	imagePreprocessing, %function
imagePreprocessing:
	@ Function supports interworking.
	@ args = 12, pretend = 8, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	sub	sp, sp, #8
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	mov	r4, r0
	str	r1, [fp, #-32]
	add	r1, fp, #4
	stmia	r1, {r2, r3}
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-32]
	mov	r1, #10
	mov	r2, #0
	bl	fseek
	sub	r3, fp, #16
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-32]
	bl	fread
	ldr	r0, [fp, #-32]
	mov	r1, #4
	mov	r2, #1
	bl	fseek
	sub	r3, fp, #20
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-32]
	bl	fread
	sub	r3, fp, #24
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-32]
	bl	fread
	ldr	r0, [fp, #-32]
	mov	r1, #2
	mov	r2, #1
	bl	fseek
	sub	r3, fp, #28
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-32]
	bl	fread
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-32]
	mov	r1, r3
	mov	r2, #0
	bl	fseek
	ldr	r3, [fp, #-16]
	str	r3, [fp, #12]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #8]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #4]
	mov	ip, r4
	add	r3, fp, #4
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	mov	r0, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	add	sp, sp, #8
	bx	lr
	.size	imagePreprocessing, .-imagePreprocessing
	.align	2
	.global	convertRGBtoYCC
	.type	convertRGBtoYCC, %function
convertRGBtoYCC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	ldrb	r1, [fp, #-24]	@ zero_extendqisi2
	ldrb	r0, [fp, #-23]	@ zero_extendqisi2
	ldrb	ip, [fp, #-22]	@ zero_extendqisi2
	mov	r3, r1
	mov	r2, r3, asl #6
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r2, r2, r3
	mov	r3, r0
	mov	r3, r3, asl #7
	add	r2, r2, r3
	mov	r3, r0
	add	r2, r2, r3
	mov	r3, ip
	mov	r3, r3, asl #4
	add	r2, r2, r3
	mov	r3, ip
	mov	r3, r3, asl #3
	add	r2, r2, r3
	mov	r3, ip
	add	r3, r2, r3
	mov	r3, r3, asr #8
	and	r3, r3, #255
	add	r3, r3, #16
	and	r4, r3, #255
	mov	r3, r1
	mov	r2, r3, asl #5
	mov	r3, r1
	mov	r3, r3, asl #2
	add	r2, r2, r3
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r2, r3
	rsb	lr, r3, #0
	mov	r3, r0
	mov	r2, r3, asl #6
	mov	r3, r0
	mov	r3, r3, asl #3
	add	r2, r2, r3
	mov	r3, r0
	mov	r3, r3, asl #1
	add	r3, r2, r3
	rsb	r2, r3, lr
	mov	r3, ip
	mov	r3, r3, asl #7
	add	r2, r2, r3
	mov	r3, ip
	mov	r3, r3, asl #4
	rsb	r3, r3, r2
	mov	r3, r3, asr #8
	and	r3, r3, #255
	sub	r3, r3, #128
	and	r5, r3, #255
	mov	r3, r1
	mov	r2, r3, asl #7
	mov	r3, r1
	mov	r3, r3, asl #4
	rsb	r1, r3, r2
	mov	r3, r0
	mov	lr, r3, asl #1
	mov	r3, r0
	mov	r2, r3, asl #6
	mov	r3, r0
	mov	r3, r3, asl #5
	add	r3, r2, r3
	rsb	r3, r3, lr
	add	r1, r1, r3
	mov	r3, ip
	mov	r2, r3, asl #4
	mov	r3, ip
	mov	r3, r3, asl #1
	add	r3, r2, r3
	rsb	r3, r3, r1
	mov	r3, r3, asr #8
	and	r3, r3, #255
	sub	r3, r3, #128
	and	r2, r3, #255
	mov	r3, r4
	strb	r3, [fp, #-18]
	mov	r3, r5
	strb	r3, [fp, #-17]
	mov	r3, r2
	strb	r3, [fp, #-16]
	sub	r3, fp, #15
	sub	r2, fp, #18
	mov	ip, #3
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	memcpy
	mov	r1, #0
	str	r1, [fp, #-28]
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	and	r2, r3, #255
	ldr	r1, [fp, #-28]
	bic	r3, r1, #255
	orr	r3, r2, r3
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	and	r3, r3, #255
	ldr	r1, [fp, #-28]
	bic	r2, r1, #65280
	mov	r3, r3, asl #8
	orr	r2, r3, r2
	str	r2, [fp, #-28]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #255
	ldr	r1, [fp, #-28]
	bic	r2, r1, #16711680
	mov	r3, r3, asl #16
	orr	r2, r3, r2
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
	.size	convertRGBtoYCC, .-convertRGBtoYCC
	.section	.rodata
	.align	2
.LC0:
	.ascii	"./ycc_hills.bmp\000"
	.align	2
.LC1:
	.ascii	"wb\000"
	.align	2
.LC2:
	.ascii	"./hills.bmp\000"
	.align	2
.LC3:
	.ascii	"rb\000"
	.align	2
.LC4:
	.ascii	"Cannot open file.\012\000"
	.global	__aeabi_i2f
	.global	__aeabi_fdiv
	.global	__aeabi_f2d
	.align	2
.LC5:
	.ascii	"Conversion time (Clock Cycles): %f\012\000"
	.align	2
.LC6:
	.ascii	"Total time (Clock Cycles): %f\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 224
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #236
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-44]
	ldr	r0, .L14
	ldr	r1, .L14+4
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r0, .L14+8
	ldr	r1, .L14+12
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L6
	ldr	r0, .L14+16
	bl	printf
	mvn	r3, #0
	str	r3, [fp, #-228]
	ldr	r0, [fp, #-228]
	b	.L13
.L6:
	sub	r1, fp, #56
	ldr	r3, [fp, #-48]
	str	r3, [sp, #0]
	sub	r3, fp, #56
	ldmia	r3, {r2, r3}
	mov	r0, r1
	ldr	r1, [fp, #-36]
	bl	imagePreprocessing
	ldr	r0, [fp, #-36]
	mov	r1, #0
	mov	r2, #0
	bl	fseek
	mov	r1, #0
	ldr	r3, [fp, #-48]
	mov	r2, r3
	sub	r3, fp, #112
	mov	r0, r3
	mov	r1, #1
	ldr	r3, [fp, #-36]
	bl	fread
	ldr	r3, [fp, #-48]
	mov	r2, r3
	sub	r3, fp, #112
	mov	r0, r3
	mov	r1, #1
	ldr	r3, [fp, #-40]
	bl	fwrite
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r2, #0
	mov	r3, #0
	mov	r1, #0
	str	r1, [fp, #-224]
	b	.L7
.L12:
	mov	r2, #0
	str	r2, [fp, #-220]
	b	.L8
.L11:
	sub	r3, fp, #160
	mov	r0, r3
	mov	r1, #3
	mov	r2, #16
	ldr	r3, [fp, #-36]
	bl	fread
	mov	r3, #0
	str	r3, [fp, #-216]
	b	.L9
.L10:
	ldr	r2, [fp, #-216]
	ldr	r0, [fp, #-216]
	mvn	r1, #195
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	sub	r2, fp, #12
	add	r3, r2, r3
	add	r4, r3, r1
	mvn	r2, #147
	mov	r3, r0
	mov	r3, r3, asl #1
	add	r3, r3, r0
	sub	r1, fp, #12
	add	r3, r1, r3
	add	r2, r3, r2
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	orr	r1, r3, r1
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	orr	r3, r3, r1
	mov	r2, #0
	str	r2, [fp, #-232]
	bic	r2, r3, #-16777216
	ldr	r1, [fp, #-232]
	and	r3, r1, #-16777216
	orr	r3, r2, r3
	str	r3, [fp, #-232]
	ldr	r0, [fp, #-232]
	bl	convertRGBtoYCC
	strb	r0, [r4, #0]
	mov	r3, r0, lsr #8
	strb	r3, [r4, #1]
	mov	r3, r0, lsr #16
	strb	r3, [r4, #2]
	ldr	r2, [fp, #-216]
	add	r2, r2, #1
	str	r2, [fp, #-216]
.L9:
	ldr	r3, [fp, #-216]
	cmp	r3, #15
	ble	.L10
	sub	r3, fp, #208
	mov	r0, r3
	mov	r1, #3
	mov	r2, #16
	ldr	r3, [fp, #-40]
	bl	fwrite
	ldr	r1, [fp, #-220]
	add	r1, r1, #16
	str	r1, [fp, #-220]
.L8:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-220]
	cmp	r3, r2
	bgt	.L11
	ldr	r3, [fp, #-224]
	add	r3, r3, #1
	str	r3, [fp, #-224]
.L7:
	ldr	r3, [fp, #-52]
	ldr	r1, [fp, #-224]
	cmp	r3, r1
	bgt	.L12
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-36]
	bl	fclose
	ldr	r0, [fp, #-40]
	bl	fclose
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	ldr	r2, .L14+20	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-44]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	ldr	r2, .L14+20	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	ldr	r0, .L14+24
	mov	r2, r3
	mov	r3, r4
	bl	printf
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	ldr	r0, .L14+28
	mov	r2, r3
	mov	r3, r4
	bl	printf
.L13:
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	1232348160
	.word	.LC5
	.word	.LC6
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
