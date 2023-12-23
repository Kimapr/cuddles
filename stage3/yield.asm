extern thread_sched, thread_sched_stack
global yield, resume

extern print_num, halt

yield:
	; push rip (done using call)
	push rbx
	push rbp
	push rdi
	push rsi
	push r12
	push r13
	push r14
	push r15

	cld
	; mov rdi, rdi
	mov rsi, rsp
	mov rsp, [thread_sched_stack]
	jmp thread_sched

; stack in rdi
; return in rsi
; first? in rdx
resume:
	mov rsp, rdi
	test rdx, rdx
	jnz first
normal:
	mov rax, rsi

	pop r15
	pop r14
	pop r13
	pop r12
	pop rsi
	pop rdi
	pop rbp
	pop rbx
	
	jmp after
first:
	mov rdi, rsi
	add rsp, 64
after:

	;mov rdi, [rsp]
	;mov rsi, 16
	;mov rdx, 0
	;call print_num
	;cli
	;call halt

	ret ; pop rip
