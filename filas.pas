unit filas;

interface

   const max   = 40;     {maximo de itens na fila}
   type  titem = string[80];    {tipo dos itens da fila}
         fila  = record
                   total : integer;
                   comeco: integer;
                   final : integer;
                   item  : array[1..max] of titem;
                end;

   procedure iniciaf(var F:fila);
   function  vaziaf(var F:fila): boolean;
   function  cheiaf(var F:fila) : boolean;
   procedure enfileira(x:titem; var F:fila);
   function  desenfileira(var F:fila) : titem;

implementation

   procedure erro(m:string);
   begin
      writeln('erro fatal: ', m);
      halt;
   end;

   procedure adc(var i:integer);
   begin
      if i<max then inc(i) else i := 1;
   end;

   procedure iniciaf(var F:fila);
   begin
      F.total  := 0;
      F.comeco := 1;
      F.final  := 1;
   end;

   function vaziaf(var F:fila) : boolean;
   begin
      vaziaf := (F.total = 0);
   end;

   function cheiaf(var F:fila) : boolean;
   begin
      cheiaf := (F.total = max);
   end;

   procedure enfileira(x:titem; var F:fila);
   begin
       if cheiaf(F) then erro('fila cheia!');
       F.item[F.final] := x;
       adc(F.final);
       inc(F.total);
   end;

   function desenfileira(var F:fila) : titem;
   begin
      if vaziaf(F) then erro('fila vazia!');
      desenfileira := F.item[F.comeco];
      adc(F.comeco);
      dec(F.total);
   end;

end.