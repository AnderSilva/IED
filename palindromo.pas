Program palindromo;
uses pilhas;
var s: string;

function simetrica(s: string): boolean;
var i :integer;
    p: pilha;
begin
    iniciap(p);
    for i:=1 to length(s) do
        if s[i] <> ' ' then
            empilha(s[i],p);
    for i:=1 to length(s) do
        if (s[i]<> ' ') and (s[i] <> desempilha(p)) then
            begin
                simetrica := false;
                exit;
            end;
    simetrica:=true;
end;

BEGIN    
    write('frase?');
    readln(s);
    
    if simetrica(s) then
        writeln('É palindroma')
    else
        writeln('Não é palindroma');    
    readln;
END.