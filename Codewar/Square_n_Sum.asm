SECTION .text
global square_sum

; Squares every number in an array and sums it against an accumulator
; arg0         = (int32_t*) array
; arg1         = (size_t)   length of array
; return value = (int32_t)  squared sum
square_sum:
  xor eax, eax  ; return ;
  xor rcx, rcx  ; represent index ;

_loop:
  cmp rcx, rsi
  je _end
  
  mov edx, dword [rdi + rcx * 4]
  imul edx, edx
  add eax, edx
  
  inc rcx
  
  jmp _loop

_end:
  ret
