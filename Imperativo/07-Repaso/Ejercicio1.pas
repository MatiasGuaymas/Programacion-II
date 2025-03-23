{X dispone de una lista simple con los tweets realizados durante los últimos 5 segundos. 
De cada tweet se conoce: el código y nombre de usuario que lo generó, el contenido del mensaje y si el mismo es o no un retweet. 
Esta información no tiene ningún orden y se debe tener en cuenta que podrían existir en la lista varios tweets del mismo usuario.

Se pide:
a) Realice un módulo que reciba la lista con los tweets y genere una nueva estructura donde para cada usuario se almacene 
la cantidad de mensajes publicados. Esta estructura debe estar ordenada por código de usuario y 
debe ser eficiente para la búsqueda por dicho criterio. 

Una vez generado el árbol: 
b) Informar la cantidad de tweets de los usuarios con código entre 100 y 700. 
c) Informar el nombre del usuario con mayor cantidad de tweets. 
d) ¿Qué cambiaría del ejercicio implementado si la lista inicial fuera una lista de listas? (Del usuario y sus tweets) 
Si la lista inicial fuera una lista de listas, se debería recorrer la lista de listas y luego recorrer cada lista de tweets de cada usuario.}

Program X;
Uses
     sysutils;
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

    regArbol = record
        codigoUsuario: integer;
        nombreUsuario: string;
        cantidadMensajes: integer;
    end;

    arbol = ^nodoArbol;
    nodoArbol = record
        dato: regArbol;
        HI: arbol;
        HD: arbol;
    end;

{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
begin
     t.codigoUsuario := random(2000);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(IntToStr(t.codigoUsuario), '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := Concat('Usuario-',IntToStr(t.codigoUsuario));
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(2000);
     end;
end;


{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure agregarArbol(var a: arbol; t: tweet);
begin
    if (a = nil) then begin
        new(a);
        a^.dato.codigoUsuario:= t.codigoUsuario;
        a^.dato.nombreUsuario:= t.nombreUsuario;
        a^.dato.cantidadMensajes:= 1;
        a^.HI:= nil;
        a^.HD:= nil;
    end
    else begin
        if (t.codigoUsuario < a^.dato.codigoUsuario) then
            agregarArbol(a^.HI, t)
        else
            if (t.codigoUsuario > a^.dato.codigoUsuario) then
                agregarArbol(a^.HD, t)
            else
                a^.dato.cantidadMensajes:= a^.dato.cantidadMensajes + 1;
    end;
end;

procedure crearArbol(var a: arbol; l: listaTweets);
begin
    while (l <> nil) do begin
        agregarArbol(a, l^.dato);
        l:= l^.sig;
    end;
end;

procedure cantidadTweets(a: arbol; var cant: integer);
begin
    if (a <> nil) then begin
        if (a^.dato.codigoUsuario >= 100) and (a^.dato.codigoUsuario <= 700) then
            begin
                cant:= cant + a^.dato.cantidadMensajes;
                cantidadTweets(a^.HI, cant);
                cantidadTweets(a^.HD, cant);
            end
        else
            if (a^.dato.codigoUsuario < 100) then
                cantidadTweets(a^.HD, cant)
            else
                cantidadTweets(a^.HI, cant);
    end;
end;

procedure mayorCantTweets(a: arbol; var max: integer; var nombre: string);
begin
    if (a <> nil) then begin
        if (a^.dato.cantidadMensajes > max) then begin
            max:= a^.dato.cantidadMensajes;
            nombre:= a^.dato.nombreUsuario;
        end;
        mayorCantTweets(a^.HI, max, nombre);
        mayorCantTweets(a^.HD, max, nombre);
    end;
end;

procedure imprimirArbol(a: arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.HI);
        writeln('Codigo de usuario: ', a^.dato.codigoUsuario, ' Nombre de usuario: ', a^.dato.nombreUsuario, ' Cantidad de mensajes: ', a^.dato.cantidadMensajes);
        imprimirArbol(a^.HD);
    end;
end;

var
    l: listaTweets;
    a: arbol;
    cant, max: integer;
    nombre: string;
begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     a:= nil;
     crearArbol(a, l);

     writeln('Arbol generado: ');
     imprimirArbol(a);

     cant:= 0;
     cantidadTweets(a, cant);
     writeln('Cantidad de tweets de los usuarios con codigo entre 100 y 700: ', cant);

     max:= -1;
     mayorCantTweets(a, max, nombre);
     writeln('Nombre del usuario con mayor cantidad de tweets: ', nombre);

     writeln('Fin del programa');
     readln;
end.