{
Exercicio 3
Conversao de infixa completamente 
parentesiada para posfixa
}

program converte;
uses crt, pilhas;
var e: string;

function posfixa(e: string): string;
var i: integer;
	s: string;
	p: pilha;
begin
	s:='';
	iniciap(p);
	for i:= 1 to length(e) do
		case e[i] of
		'A'..'Z'       : s:=s+e[i];
		'+','-','*','/': empilha(e[i],p);
		')'            : s:=s+desempilha(p);
		end;
	posfixa := s;
end;

BEGIN
	clrscr;
	write('infixa?');
	readln(e);
	writeln('Posfixa:', posfixa(e));
	readln;
END.

