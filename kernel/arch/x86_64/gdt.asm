gdtr DW 0 ; For limit storage
     DD 0 ; For base storage

setGdt:
   MOV   EAX, [esp + 4]
   MOV   [gdtr], EAX
   MOV   EAX, [ESP + 8]
   ADD   EAX, [ESP + 12]
   MOV   [gdtr + 2], EAX
   LGDT  [gdtr]
   RET

