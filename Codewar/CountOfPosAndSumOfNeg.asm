global count_positives_sum_negatives
section .text
; <--- void count_positives_sum_negatives(int *vec, size_t sz, unsigned *poscnt, int *negsum) --->
; params:
;   RDI <- vec
;   RSI <- sz
;   EDX <- poscnt
;   ECX <- negsum
count_positives_sum_negatives:        
    mov dword [rdx], 0      ; resetting <*poscnt>
    mov dword [rcx], 0      ; resetting <*negsum>

_loop:
  cmp rsi, 0
  jle _end
  mov eax, dword [rdi + rsi * 4 - 4]
  cmp eax, 0
  jg _add_pos
  je _update_counter

_add_neg:
  add [rcx], eax
  jmp _update_counter

_add_pos:
  inc dword [rdx]

_update_counter:
  dec rsi
  jmp _loop

_end:
  ret
; ---------> end of cnt_pos_sum_neg <---------
