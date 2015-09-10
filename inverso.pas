Program inverso;
uses pilhas;
var s: string;
    i: integer;
    p: pilha;

BEGIN    
    write('Palavra?');
    readln(s);
    iniciap(p);    
    
    for i:=1 to length(s) do      
        empilha(s[i],p);
    write('Inversa:');
    while not vaziap(p) do writeln(desempilha(p));
    readln;
END.