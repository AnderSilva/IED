unit pilhas;

interface

   const max   = 100;    {maximo de itens na pilha}
   type  titem = integer;   {tipo dos itens da pilha}
         pilha = record
                    topo: integer;
                    memo: array[1..max] of titem;
                 end;

   procedure iniciap(var p:pilha);
   function  vaziap(var p:pilha) : boolean;
   function  cheiap(var p:pilha) : boolean;
   procedure empilha(x:titem; var p:pilha);
   function  desempilha(var p:pilha) : titem;
   function  topo(var p:pilha) : titem;

implementation

   procedure erro(m:string);
   begin
      writeln('erro fatal: ', m);
      halt;
   end;

   procedure iniciap(var p:pilha);
   begin
        p.topo := 0;
   end;

   function vaziap(var p:pilha) : boolean;
   begin
      vaziap := (p.topo = 0);
   end;

   function cheiap(var p:pilha) : boolean;
   begin
        cheiap := (p.topo = max);
   end;

   procedure empilha(x:titem; var p:pilha);
   begin
      if cheiap(p) then erro('pilha cheia!');
      inc(p.topo);
      p.memo[p.topo] := x;
   end;

   function desempilha(var p:pilha) : titem;
   begin
      if vaziap(p) then erro('pilha vazia!');
      desempilha := p.memo[p.topo];
      dec(p.topo);
   end;

   function topo(var p:pilha) : titem;
   begin
      if vaziap(p) then erro('pilha vazia!');
      topo := p.memo[p.topo]
   end;

end.