{Conversao de infixa completamente 
parentesiada para posfixa}
unit posfixa_lib;

interface
	function posfixa(e:string): string;

implementation
uses pilhas_char;

function posfixa(e: string): string;
var i: integer;
	s: string;
	p: pilha;
begin
	s:='';
	iniciap(p);
	for i:= 1 to length(e) do
		case e[i] of
		'0'..'9'       : s:=s+e[i];
		'+','-','*','/': empilha(e[i],p);
		')'            : s:=s+desempilha(p);
		end;
	posfixa := s;
end;

END.