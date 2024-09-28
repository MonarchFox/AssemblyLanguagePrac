SECTION .text
global hero

; Returns true if the hero will survive an encounter given a specific number of bullets and dragons.
; arg0         = (uint32_t) The number of bullets.
; arg1         = (uint32_t) The number of dragons.
; return value = (bool)     True if the hero survives, false otherwise.
hero:
  xor eax, eax
  mov ebx, edi
  mov ecx, esi
  imul ecx, 2
  cmp ebx, ecx
  jge _win
  ret


_win:
  mov eax, 1
  ret
