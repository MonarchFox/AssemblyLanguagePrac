section .text

global abbrev_name

abbrev_name:
  movzx rax, byte [rdi]
  call to_uppercase
  mov [rsi], al
  mov byte [rsi + 1], '.'

  mov rcx, 0

find_space:
  inc rcx
  mov bl, [rdi + rcx]
  cmp bl, 32
  jne find_space
  
  inc rcx
  movzx rax, byte [rdi + rcx]
  call to_uppercase
  mov [rsi + 2], al

  mov byte [rsi + 3], 0
  ret

to_uppercase:
  cmp al, 'a'
  jl  end_uppercase
  cmp al, 'z'
  jg  end_uppercase
  sub al, 32
end_uppercase:
  ret
