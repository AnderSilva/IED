{Avalia posfixa e calcula}
program avalia;
uses crt, pilhas_int;
var s: string;

function valor(e: string): integer;
var	i,x,y:integer;	
	p:pilha;	
begin	
	iniciap(p);
	for i:= 1 to length(e) do
		if e[i] in ['0'..'9'] then
			empilha( ord(e[i]) - ord('0') ,p)
		else
			begin
				y:=desempilha(p);x:=desempilha(p);
				case e[i] of
				'+': empilha(x+y    ,p);
				'-': empilha(x-y    ,p);
				'*': empilha(x*y    ,p);
				'/': empilha(x div y,p);
				end;
			end;
		valor:=desempilha(p);
end;

BEGIN
	clrscr;
	write('Posfixa?');
	readln(s);
	writeln('Valor:', valor(s));
	readln;
END.

