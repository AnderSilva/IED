{Avalia posfixa logica e calcula}
program avalia_logica;
uses crt, pilhas_bool;
var s: string;

function valor(e: string): boolean;
var	i:integer;
	x,y:boolean;	
	p:pilha;	
begin	
	iniciap(p);
	for i:= 1 to length(e) do
		if e[i] in ['V','F'] then
			empilha(e[i]='V',p)
		else
			if e[i] in ['~', '&', '|'] then
				begin
					y:=desempilha(p);
					case e[i] of
					'~': empilha(not y,p);
					'&': empilha(desempilha(p) and y,p);
					'|': empilha(desempilha(p) or  y,p);				
					end;
				end;
		valor:=desempilha(p);
end;

BEGIN
	clrscr;
	write('Posfixa logica?');
	readln(s);
	writeln('Valor logico:', valor(s));
	readln;
END.

