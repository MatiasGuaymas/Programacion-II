{Una biblioteca quiere tener un mejor acceso a sus libros. Para ello, nos piden generar un árbol binario de búsqueda 
con los datos de todos sus libros. De cada libro se conoce: título, ISBN y clasificador bibliográfico 
(código alfanumérico que permite clasificar el tema del ejemplar), que se leen desde teclado. 
La lectura finaliza con el ISBN 0 (cero). Interesa poder buscar los libros eficientemente por ISBN.

Se pide:
a) Generar árbol binario de búsqueda según el enunciado.

Una vez generado el árbol: 
b) Realice un módulo que reciba el árbol y un ISBN de libro, y retorne verdadero si existe dicho libro en el árbol o falso en caso contrario.
c) Realizar un módulo que reciba el árbol y un código clasificador, y devuelva la cantidad de veces que aparece en el árbol (el módulo debe tener en cuenta que puede no existir).
d) Realice un módulo que reciba el árbol y un título de libro, y retorne verdadero si existe dicho libro en el árbol o falso en caso contrario.
e) Realizar un programa que invoque a los módulos realizados e informe desde el programa principal los datos correspondientes. }

program Ejercicio2;
type
    cadena = string[30];
    libro = record
        titulo: cadena;
        ISBN: integer;
        clasificador: cadena;
    end;
    arbol = ^nodo;
    nodo = record
        dato: libro;
        HI: arbol;
        HD: arbol;
    end;
procedure leerLibro(var l: libro);
begin
    l.ISBN := random(100);
    if (l.ISBN <> 0) then begin
        l.titulo := 'Titulo';
        l.clasificador := 'Clasificador';
    end;
end;
procedure agregarArbol(var a: arbol; l: libro);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := l;
        a^.HI := nil;
        a^.HD := nil;
    end
    else
        if (l.ISBN < a^.dato.ISBN) then
            agregarArbol(a^.HI, l)
        else
            agregarArbol(a^.HD, l);
end;
procedure crearArbol(var a: arbol);
var
    l: libro;
begin
    leerLibro(l);
    while (l.ISBN <> 0) do begin
        agregarArbol(a, l);
        leerLibro(l);
    end;
end;
function buscarISBN(a: arbol; ISBN: integer): boolean;
begin
    if (a = nil) then
        buscarISBN := false
    else
        if (a^.dato.ISBN = ISBN) then
            buscarISBN := true
        else
            if (ISBN < a^.dato.ISBN) then
                buscarISBN := buscarISBN(a^.HI, ISBN)
            else
                buscarISBN := buscarISBN(a^.HD, ISBN);
end;
function buscarClasificador(a: arbol; clasificador: cadena): integer;
begin
    if (a = nil) then
        buscarClasificador := 0
    else
        if (a^.dato.clasificador = clasificador) then
            buscarClasificador := 1 + buscarClasificador(a^.HI, clasificador) + buscarClasificador(a^.HD, clasificador)
        else
            buscarClasificador := buscarClasificador(a^.HI, clasificador) + buscarClasificador(a^.HD, clasificador);
end;
function buscarTitulo(a: arbol; titulo: cadena): boolean;
begin
    if (a = nil) then
        buscarTitulo := false
    else
        if (a^.dato.titulo = titulo) then
            buscarTitulo := true
        else
            buscarTitulo := buscarTitulo(a^.HI, titulo) or buscarTitulo(a^.HD, titulo);
end;
procedure imprimirArbol(a: arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.HI);
        writeln('ISBN: ', a^.dato.ISBN);
        imprimirArbol(a^.HD);
    end;
end;
var
    a: arbol;
    ISBN: integer;
    clasificador: cadena;
    titulo: cadena;
begin
    randomize;
    a := nil;
    crearArbol(a);
    imprimirArbol(a);
    writeln('Ingrese ISBN a buscar: ');
    readln(ISBN);
    if (buscarISBN(a, ISBN)) then
        writeln('El ISBN ', ISBN, ' se encuentra en el arbol.')
    else
        writeln('El ISBN ', ISBN, ' no se encuentra en el arbol.');
    writeln('Ingrese clasificador a buscar: ');
    readln(clasificador);
    writeln('El clasificador ', clasificador, ' se encuentra ', buscarClasificador(a, clasificador), ' veces en el arbol.');
    writeln('Ingrese titulo a buscar: ');
    readln(titulo);
    if (buscarTitulo(a, titulo)) then
        writeln('El titulo ', titulo, ' se encuentra en el arbol.')
    else
        writeln('El titulo ', titulo, ' no se encuentra en el arbol.');
    readln;
end.