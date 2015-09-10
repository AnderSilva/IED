{
Exercicio 5
Conversao de posfixa , convertendo para infixa 
completamente parentesiada

Posfixa?:ABC*+D-
Infixa CP: ((A+(B*C))-D)
}

program converte;
uses crt, pilhas_string;
var e: string;

function infixaCP(e: string): string;
var i: integer;
	s,x,y: string;
	p: pilha;
begin
	s:='';
	iniciap(p);	
	for i:= 1 to length(e) do
		case e[i] of
		'A'..'Z'       : empilha(e[i],p);
		'+','-','*','/': begin							
							x:=desempilha(p);y:=desempilha(p);
							empilha('('+y+e[i]+x+')',p);							
						 end;		
		end;
	while not vaziap(p) do
		s:=s+desempilha(p);	
	infixaCP := s;
end;

BEGIN
	clrscr;
	write('Posfixa?');
	readln(e);
	writeln('Infixa CP:', infixaCP(e));
	readln;
END.

