Program balanceada;
uses crt,pilhas;
var e: string;

function bal(e: string): boolean;
var i :integer;
    p: pilha;
begin
    iniciap(p);
    for i:=1 to length(e) do
        case e[i] of
            '{' : empilha('}',p);
            '[' : empilha(']',p);
            '(' : empilha(')',p);
            else if vaziap(p) or (e[i]<> desempilha(p)) then
                begin
                    bal:=false;
                    exit;
                end;                
        end;
    bal:=vaziap(p);
end;

BEGIN
    clrscr;
    write('Exp?');
    readln(e);
    writeln('balanceada:', bal(e));
    readln;
END.


