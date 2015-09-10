Program stack_sort2;
uses crt, pilhas;
var n,i: integer;
    x: real;
    A,B: pilha;

BEGIN
    clrscr;
    write('Qtde?');
    readln(n);
    iniciap(A);
    iniciap(B);
    
    for i:=1 to n do
      begin
        write(i, '.o núm?');
        readln(x);
        while not vaziap(A) and (x <= topo(A)) do
            empilha(desempilha(A), B);
        empilha(x,A);
        while not vaziap(B) do empilha(desempilha(B),A);      
      end;

    write('Sequencia ordenada:');
    while not vaziap(A) do writeln(desempilha(A));
    readln;
END.