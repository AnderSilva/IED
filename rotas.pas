{Calcula a rota dentro de um grafo aciclico}
program rotas;
uses crt, filas, pilhas_string;
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
			//if x=y then writeln('fechou no : '+r);
			for i:='A' to 'E' do
				if (G[x,i]=1) and (pos(i,r)=0) then
					begin
				    	writeln('fila '+r+i );
						enfileira(r+i,f);					
					end;
		end;
end;

procedure busca_profundidade(x,y:char;var G:grafo);
var p:pilha;
	r:string;
	i:char;
begin
	iniciap(p);
	empilha(x,p);
	while not vaziap(p) do
		begin
			r:=topo(p);
			x:=r[length(r)];
			if x=y then
				begin
					writeln('fechou ' + r);
					r:=desempilha(p);
					while not length(r)<2 do
						r:=desempilha(p);
					x:=r[length(r)];
				end;
			for i:='A' to 'E' do
				if (G[x,i]=1) and (pos(i,r)=0) then
				    begin
				    	writeln('pilha+ '+r+i);
						empilha(r+i,p);					
					end;
		end;
end;


BEGIN
	clrscr;
	//busca_largura('A','E',G); {varre o grafo horizontalmente}

	busca_profundidade('A','E',G); {varre o grafo verticalmente}
	readln;
END.
