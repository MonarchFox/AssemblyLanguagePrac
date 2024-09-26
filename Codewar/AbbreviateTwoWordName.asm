section .text
global abbrev_name

abbrev_name:
  movzx rax, byte [rdi]   
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
  mov [rsi + 2], al      
  mov byte [rsi + 3], 0 

  ret                    
