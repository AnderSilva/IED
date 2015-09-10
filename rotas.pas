{Calcula a rota dentro de um grafo aciclico}
program rotas;
uses crt, filas;
type grafo=array['A'..'E', 'A'..'E'] of integer;
const G:grafo=(	(0,1,0,0,0),
				(0,0,1,1,1),
			 	(0,0,0,1,1),
			 	(1,0,1,0,0),
			 	(0,0,1,0,0));

procedure busca_largura(x,y:char;var G:grafo);
var f:fila;
	r:string;
	i:char;
begin
	iniciaf(f);
	enfileira(x,f);
	while not vaziaf(f) do
		begin
			r:=desenfileira(f);
			x:=r[length(r)];
			if x=y then writeln(r);
			for i:='A' to 'E' do
				if (G[x,i]=1) and (pos(i,r)=0) then
					enfileira(r+i,f);					
		end;
end;


BEGIN
	clrscr;
	busca_largura('A','E',G);
	readln;
END.