{
Exercicio 4
Conversao de infixa completamente 
parentesiada para prefixa
}

program converte;
uses crt, pilhas;
var e: string;

function prefixa(e: string): string;
var i: integer;
	s: string;
	p,p2: pilha;
begin
	s:='';
	iniciap(p);iniciap(p2);
	for i:= length(e) downto 1 do
		case e[i] of
		'A'..'Z'       : empilha(e[i],p);
		'+','-','*','/': empilha(e[i],p2);
		'('            : empilha(desempilha(p2),p);
		end;
	while not vaziap(p) do
		s:=s+desempilha(p);
	prefixa := s;
end;

BEGIN
	clrscr;
	write('infixa?');
	readln(e);
	writeln('Posfixa:', prefixa(e));
	readln;
END.

