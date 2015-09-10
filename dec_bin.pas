Program dec_bin;
uses crt, pilhas;
var n: integer;
    p: pilha;
BEGIN
    clrscr;
    write('Dec?');
    readln(n);
    iniciap(p);
    
    Repeat
      empilha(n mod 2, p);
      n := n div 2;
    until n=0;

    write('Bin:');
    while not vaziap(p) do
          write(desempilha(p));
    readln;
END.