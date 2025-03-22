Program encomiendas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;

  // Lista de codigos
  lisCodigos = ^nodoC;
  nodoC = record
    codigo: integer;
    sig: lisCodigos;
  end;

  // Arbol de encomiendas
  regArbol = record
    peso: integer;
    lista: lisCodigos;
  end;

  arbol = ^nodoE;
  nodoE = record
    dato: regArbol;
    HI: arbol;
    HD: arbol;
  end;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;

procedure agregarAdelanteCod(var l: lisCodigos; cod: integer);
var
  aux: lisCodigos;
begin
  new(aux);
  aux^.codigo := cod;
  aux^.sig := l;
  l:= aux;
end;

procedure agregarEnArbol(var a: arbol; e: encomienda);
begin
  if (a = nil) then
    begin
      new(a);
      a^.dato.peso:= e.peso;
      a^.dato.lista:= nil;
      agregarAdelanteCod(a^.dato.lista, e.codigo);
      a^.HI:= nil;
      a^.HD:= nil;
    end
  else
    begin
      if (a^.dato.peso = e.peso) then
        agregarAdelanteCod(a^.dato.lista, e.codigo)
      else
        if (e.peso < a^.dato.peso) then
          agregarEnArbol(a^.HI, e)
        else
          agregarEnArbol(a^.HD, e);
    end;
end;

procedure generarArbol(l: lista; var a: arbol);
begin
  while (l<>nil) do
    begin
      agregarEnArbol(a, l^.dato);
      l:= l^.sig;
    end;
end;

procedure imprimirNodo(r: regArbol);
begin
  writeln('Peso: ', r.peso, ' Codigos: ');
  while (r.lista <> nil) do
    begin
      write('Codigo: ', r.lista^.codigo, ' - ');
      r.lista:= r.lista^.sig;
    end;
  writeln();
end;

procedure imprimirArbol(a: arbol);
begin
  if (a <> nil) then
    begin
      imprimirArbol(a^.HI);
      imprimirNodo(a^.dato);
      imprimirArbol(a^.HD);
    end;

end;

Var

 l: lista;
 a: arbol;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);

 a:= nil;
 generarArbol(l, a);
 writeln ('Arbol de encomiendas generado: ');
 imprimirArbol(a);
 
 readln;
end.
