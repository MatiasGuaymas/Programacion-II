{ACTIVIDAD 2
a. Implementar un programa que invoque al módulo crearlistaordenada (este módulo puede armarse utilizando una modificación del algoritmo de Agregar Ordenado del programa x.pas – de la 1era clase) y genere un ABB con los elementos de la lista ordenada.
b. Mostrar los datos del árbol por niveles.}

Program X;
Uses sysutils;

Type
    tweet = record
        codigoUsuario: integer;
        nombreUsuario: string;
        mensaje: string;
        esRetweet: boolean;
    end;

    listaTweets = ^nodoLista;
    nodoLista = record
        dato: tweet;
        sig: listaTweets;
    end;

    arbol = ^nodoArbol;
    nodoArbol = record
        dato: tweet;
        HI, HD: arbol;
    end;

    // Lista de Arboles
     listaNivel = ^nodoN;
     nodoN = record
          info: arbol;
          sig: listaNivel;
     end;

{ Agregar en orden a la lista }
Procedure agregarOrdenado(var pri: listaTweets; t: tweet);
var
    nuevo, anterior, actual: listaTweets;
begin
    new(nuevo);
    nuevo^.dato := t;
    nuevo^.sig := nil;
    if (pri = nil) then
        pri := nuevo
    else
    begin
        actual := pri;
        anterior := pri;
        while (actual <> nil) and (actual^.dato.nombreUsuario < nuevo^.dato.nombreUsuario) do begin
            anterior := actual;
            actual := actual^.sig;
        end;
        if (anterior = actual) then
            pri := nuevo
        else
            anterior^.sig := nuevo;
        nuevo^.sig := actual;
    end;
end;

{ Crear lista ordenada }
procedure crearListaOrdenada(var l: listaTweets);
var
    t: tweet;
    nombres: array[1..10] of string = ('juan', 'pedro', 'carlos', 'julia', 'mariana', 'gonzalo', 'alejandro', 'silvana', 'federico', 'ruth');
begin
    Randomize;
    l := nil;
    t.codigoUsuario := random(10) + 1;
    while (t.codigoUsuario <> 0) do begin
        t.nombreUsuario := nombres[t.codigoUsuario];
        t.mensaje := Concat(t.nombreUsuario, '-mensaje-', IntToStr(random(200)));
        t.esRetweet := (random(2) = 0);
        agregarOrdenado(l, t);
        t.codigoUsuario := random(10);
    end;
end;

{ Insertar en ABB }
procedure insertarABB(var a: arbol; t: tweet);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := t;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (t.nombreUsuario < a^.dato.nombreUsuario) then
        insertarABB(a^.HI, t)
    else
        insertarABB(a^.HD, t);
end;

{ Generar ABB desde la lista ordenada }
procedure generarABB(l: listaTweets; var a: arbol);
begin
    a := nil;
    while (l <> nil) do begin
        insertarABB(a, l^.dato);
        l := l^.sig;
    end;
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

{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atr�s en l}

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
IMPRIMIRPORNIVEL - Muestra los datos del �rbol a por niveles }

Procedure imprimirPorNivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l := nil;
   if (a <> nil) then begin
      nivel := 0;
      agregarAtras(l, ult, a);
      while (l <> nil) do begin
         nivel := nivel + 1;
         cant := contarElementos(l);
         write('Nivel ', nivel, ': ');
         
         for i := 1 to cant do begin
            write(l^.info^.dato.nombreUsuario, ' ', l^.info^.dato.mensaje, ' - ');
            
            { Agregar hijos al final de la lista de nivel }
            if (l^.info^.HI <> nil) then agregarAtras(ult, ult, l^.info^.HI);
            if (l^.info^.HD <> nil) then agregarAtras(ult, ult, l^.info^.HD);
            
            { Avanzar en la lista y eliminar el nodo procesado }
            aux := l;
            l := l^.sig;
            dispose(aux);
         end;
         
         writeln; { Salto de línea después de imprimir un nivel completo }
      end;
   end;
end;

var
    l: listaTweets;
    a: arbol;
begin
    crearListaOrdenada(l);
    writeln('Lista Ordenada:');
    generarABB(l, a);
    writeln('Árbol Binario de Búsqueda por niveles:');
    imprimirPorNivel(a);
    readln;
end.
