section .text
global enough

; int enough(int cap, int on, int wait);
; cap := edi
; on := esi
; wait = edx
enough:
  xor eax, eax ; eax the result
  xor ecx, ecx
  add ecx, esi
  add ecx, edx
  cmp edi, ecx
  jl _set
  ret

_set:
  sub ecx, edi
  mov eax, ecx
  ret
