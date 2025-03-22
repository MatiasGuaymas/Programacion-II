{ ACTIVIDAD 8
a. Implementar el módulo borrarElemento que reciba un árbol y un valor a eliminar. 
b. Invocar al módulo borrarElemento con un valor que se ingresa de teclado. 
c. Invocar al módulo imprimirpornivel con el árbol resultante en el punto b). }

Program AcotadayBorrado;
Type

  // Lista de enteros
  lista = ^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
  end;

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: Lista; nro: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l:= aux;
end;



{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con números aleatorios }
procedure crearLista(var l: Lista);
var
  n: integer;
begin
 l:= nil;
 n := random (20);
 While (n <> 0) do Begin
   agregarAdelante(L, n);
   n := random (20);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   write(l^.dato, ' - ');
   l:= l^.sig;
 End;
end;

{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;

procedure insertarArbol ( var a:arbol; dato:integer);
var nue:arbol;
begin
  if( a = nil)then begin
    new(nue);
    nue^.dato:=dato;
    nue^.HI:= nil;
    nue^.HD:= nil;
    a:= nue;
  end
  else begin
    if( a^.dato > dato) then
      insertarArbol(a^.HI, dato)
    else
        if (a^.dato < dato) then
       insertarArbol(a^.HD,dato);
    end
end;
procedure listaArbol(var a: arbol; l:lista);
begin
 while (l<>nil) do begin
   insertarArbol(a,l^.dato);
   l:=l^.sig;
 end;

end;

Procedure preOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    write (a^.dato, '   ');
    preOrden (a^.HI);
    preOrden (a^.HD)
  end;
end;
Procedure enOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI);
    write (a^.dato, '   ');
    enOrden (a^.HD)
  end;
end;
procedure postOrden(a:arbol);
begin
 if(a<>nil) then begin
   postOrden(a^.HI);
   postOrden(a^.HD);
   write(a^.dato, ' ');
 end;
end;

{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;


{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;
function darMin(a: arbol): integer;
begin
  if a = nil then
    darMin := -1
  else if a^.HI = nil then
    darMin := a^.dato
  else
    darMin := darMin(a^.HI);
end;

procedure borrarElemento(var a: arbol; dato: integer; var resultado: boolean);
var
  aux: arbol;
begin
  if a = nil then
    resultado := false
  else if a^.dato > dato then
    borrarElemento(a^.HI, dato, resultado)
  else if a^.dato < dato then
    borrarElemento(a^.HD, dato, resultado)
  else begin
    resultado := true;
    if a^.HI = nil then begin
      aux := a;
      a := a^.HD;
      dispose(aux);
    end
    else if a^.HD = nil then begin
      aux := a;
      a := a^.HI;
      dispose(aux);
    end
    else begin
      a^.dato := darMin(a^.HD);
      borrarElemento(a^.HD, a^.dato, resultado);
    end;
  end;
end;

Var 
    l: lista;
    a:arbol;      
    dato:integer;
    res:boolean;
begin
 Randomize;
 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);
 listaArbol(a,l);
 imprimirpornivel(a);
 writeln('Arbol:');
 enOrden(a);
 writeln('Ingrese un numero a eliminar');
 readln(dato);
 res:= false;
 borrarElemento(a,dato,res);
 if (res) then
   writeln( 'Elemento borrado')
 else
     writeln( 'Elemento no encontrado');
 imprimirpornivel(a);
 readln;
end.
