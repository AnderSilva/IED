{Conversao de infixa não completamente 
parentesiada para posfixa
Nesta versao, quando o sinal de prioridade 
for menor ou igual não pode ser empilhado, 
sendo necessário desemplilhar antes.

Quando aparecer parenteses que abre, 
deve-se adiciona-lo na pilha, e 
quando aparecer parenteses que fecha,
deve-se desempilhar até que encontre o 
parenteses que abre
}
program converte;
uses crt, pilhas;
var s: string;

function prio(op:char) : integer;
begin
	case op of
	'('     : prio:=0;
	'+','-' : prio:=1;
	'*','/' : prio:=2;
	end;
end;

function posfixa_nova(e: string): string;
var	i:integer;
	s:string;
	p:pilha;
	x:char;
begin
	s:='';
	iniciap(p);
	for i:= 1 to length(e) do
		case e[i] of
		'('            : empilha('(',p);
		'0'..'9'       : s:=s+e[i];
		'+','-','*','/': begin
							while not vaziap(p) and (prio(e[i])<=prio(topo(p)) ) do
								s:=s+desempilha(p);
							empilha(e[i],p);
						 end;		
		')'            : begin
						 	while topo(p) <> '(' do
						 		s:=s+desempilha(p);
						 	x:=desempilha(p);
						 end;
		end;
	while not vaziap(p) do
		s:=s+desempilha(p);
	posfixa_nova:=s;
end;

BEGIN
	clrscr;
	write('infixa?');
	readln(s);
	writeln('Posfixa:', posfixa_nova(s));
	readln;
END.

