{ACTIVIDAD 1
a. Compilar y ejecutar
b. Implementar el módulo insertar  en un ABB de enteros
c. Invocar al módulo insertar a partir de los elementos de la lista generada anteriormente.
d. Invocar al módulo imprimirpornivel con el árbol generado en c).
e. Graficar en papel el ABB y comprobar que los datos que se muestran en d) se corresponden con la estructura generada.}

{ACTIVIDAD 3
a. Implementar el módulo preOrden que imprima los valores del ABB ya generado. 
b. Implementar el módulo enOrden que imprima los valores del ABB ya generado. 
c. Implementar el módulo postOrden que imprima los valores del ABB ya generado. 
d. Invocar cada uno de los módulos anteriores y comparar los resultados obtenidos.}

{ACTIVIDAD 4
a. Implementar el módulo buscar que reciba un árbol y un valor y devuelva un puntero al nodo donde se encuentra dicho valor. En caso de no encontrarlo, debe retornar nil.
b. Invocar al módulo buscar con un valor que se ingresa de teclado. Mostrar el resultado de la búsqueda.}

{ACTIVIDAD 5
a. Implementar el módulo verMin que reciba un árbol y devuelva el valor mínimo. En caso de recibir un árbol vacío, retornar -1.
b. Implementar el módulo verMax que reciba un árbol y devuelva el valor máximo. En caso de recibir un árbol vacío, retornar -1.
c. Invocar a los módulos generados en a) y b). Mostrar los resultados obtenidos.}

Program arboles;
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

{AGREGAR A ARBOL: ACTIVIDAD 1B)}
procedure agregarArbol(var a: arbol; n: integer);
begin
  if (a = nil) then begin
    new(a);
    a^.dato := n;
    a^.HI := nil;
    a^.HD := nil;
  end
  else
    if (n <= a^.dato) then
      agregarArbol(a^.HI, n)
    else
      agregarArbol(a^.HD, n);
end;

{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con n�meros aleatorios }
procedure crearLista(var l: Lista; var a: arbol);
var
  n: integer;
begin
 l:= nil;
 n := random (20);
 While (n <> 0) do Begin
   agregarAdelante(L, n);
   agregarArbol(a, n);
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

{-----------------------------------------------------------------------------}

procedure imprimirPreOrden(a: arbol);
begin
  if (a <> nil) then begin
    write(a^.dato, ' - ');
    imprimirPreOrden(a^.HI);
    imprimirPreOrden(a^.HD);
  end;
end;

{-----------------------------------------------------------------------------}

procedure imprimirEnOrden(a: arbol);
begin
  if (a <> nil) then begin
    imprimirEnOrden(a^.HI);
    write(a^.dato, ' - ');
    imprimirEnOrden(a^.HD);
  end;
end;

{-----------------------------------------------------------------------------}

procedure imprimirPostOrden(a: arbol);
begin
  if (a <> nil) then begin
    imprimirPostOrden(a^.HI);
    imprimirPostOrden(a^.HD);
    write(a^.dato, ' - ');
  end;
end;

{-----------------------------------------------------------------------------}

function buscar(a: arbol; n: integer): arbol;
begin
  if (a = nil) then
    buscar := nil
  else
    if (a^.dato = n) then
      buscar := a
    else
      if (n < a^.dato) then
        buscar := buscar(a^.HI, n)
      else
        buscar := buscar(a^.HD, n);
end;

{-----------------------------------------------------------------------------}

function verMin(a: arbol): integer;
begin
  if (a = nil) then
    verMin := -1
  else
    if (a^.HI = nil) then
      verMin := a^.dato
    else
      verMin := verMin(a^.HI);
end;

{-----------------------------------------------------------------------------}

function verMax(a: arbol): integer;
begin
  if (a = nil) then
    verMax := -1
  else
    if (a^.HD = nil) then
      verMax := a^.dato
    else
      verMax := verMax(a^.HD);
end;

{-----------------------------------------------------------------------------}

Var

 l: lista;
 a: arbol;
 num: integer;
begin
 Randomize;
 a:= nil;
 crearLista(l, a);
 writeln ('Lista generada: ');
 imprimirLista(l);
 imprimirpornivel(a);
 writeln('Preorden: ');
 imprimirPreOrden(a);
 writeln;
 writeln('Enorden: ');
 imprimirEnOrden(a);
 writeln;
 writeln('Postorden: ');
 imprimirPostOrden(a);
 writeln;
 writeln('Ingrese un valor a buscar: ');
 readln(num);
 if (buscar(a, num) <> nil) then
    writeln('El valor ', num, ' se encuentra en el arbol.')
 else
    writeln('El valor ', num, ' no se encuentra en el arbol.');
 writeln('El valor minimo del arbol es: ', verMin(a));
 writeln('El valor maximo del arbol es: ', verMax(a));
end.
