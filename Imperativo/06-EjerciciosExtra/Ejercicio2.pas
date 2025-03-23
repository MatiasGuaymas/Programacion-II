{Una aerolínea quiere premiar a sus mejores clientes y para ello, lee la información de los pasajes que ha vendido. 
De cada venta se conoce un código de vuelo (alfanumérico, ej: AR1620), cantidad de millas recorridas, DNI del pasajero, su nombre y apellido 
y la clase en que solicitó el boleto. Esta información se lee ordenada por código de vuelo.

Se necesita saber qué cantidad de puntos acumularon los pasajeros de la siguiente manera: cada pasajero que haya viajado en clase ejecutiva 
suma 100 puntos por milla de vuelo, mientras que aquellos que viajaron en clase turista suman 25 puntos por milla. 

Por lo que se pide: 
a) Generar una estructura que almacene para cada pasajero su DNI, nombre y apellido y los puntajes acumulados por cada código de vuelo, 
de manera tal que resulte eficiente la búsqueda por DNI del pasajero. 

Al finalizar el procesamiento de a): 

b) Escriba un módulo que devuelva el mayor puntaje total (sumando todos sus vuelos) para dar el premio al mejor cliente.
c) Escriba un módulo que imprima el mayor puntaje (entre sus vuelos) de los pasajeros cuyo DNI se encuentre entre 40.000.000 y 50.000.000.
d) Realizar un programa que simule el llamado a los módulos b) y c), e informe lo devuelto por c).}

program Ejercicio2;
type
    venta = record
        codigoVuelo: string;
        millasRecorridas: integer;
        DNI: longint;
        nombre: string;
        apellido: string;
        clase: string;
    end;

    listaPuntajes = ^nodo;
    nodo = record
        codigoVuelo: string;
        puntaje: integer;
        sig: listaPuntajes;
    end;

    pasajero = record
        DNI: longint;
        nombre: string;
        apellido: string;
        lisPuntajes: listaPuntajes;
    end;

    arbol = ^nodoArbol;
    nodoArbol = record
        dato: pasajero;
        HI: arbol;
        HD: arbol;
    end;

procedure leerVenta(var v: venta);
begin
    writeln('Ingrese el codigo de vuelo');
    readln(v.codigoVuelo);
    if (v.codigoVuelo <> 'fin') then
    begin
        writeln('Ingrese la cantidad de millas recorridas');
        readln(v.millasRecorridas);
        writeln('Ingrese el DNI del pasajero');
        readln(v.DNI);
        writeln('Ingrese el nombre del pasajero');
        readln(v.nombre);
        writeln('Ingrese el apellido del pasajero');
        readln(v.apellido);
        writeln('Ingrese la clase en la que solicito el boleto');
        readln(v.clase);
    end;
end;
procedure agregarAdelante(var l: listaPuntajes; codVuelo: string; millas: integer; clase: string);
var
    nuevo: listaPuntajes;
begin
    new(nuevo);
    nuevo^.codigoVuelo := codVuelo;
    if (clase = 'ejecutiva') then
        nuevo^.puntaje := millas * 100
    else
        nuevo^.puntaje := millas * 25;
    nuevo^.sig := l;
    l := nuevo;
end;
procedure insertarArbol(var a: arbol; v: venta);
begin
    if (a = nil) then
    begin
        new(a);
        a^.dato.DNI := v.DNI;
        a^.dato.nombre := v.nombre;
        a^.dato.apellido := v.apellido;
        a^.dato.lisPuntajes := nil;
        agregarAdelante(a^.dato.lisPuntajes, v.codigoVuelo, v.millasRecorridas, v.clase);
        a^.HI := nil;
        a^.HD := nil;
    end
    else
    begin
        if (v.DNI = a^.dato.DNI) then
            agregarAdelante(a^.dato.lisPuntajes, v.codigoVuelo, v.millasRecorridas, v.clase)
        else
            if (v.DNI < a^.dato.DNI) then
                insertarArbol(a^.HI, v)
            else
                insertarArbol(a^.HD, v);
    end;
end;
procedure crearArbol(var a: arbol);
var
    v: venta;
begin
    leerVenta(v);
    while (v.codigoVuelo <> 'fin') do
        begin
            insertarArbol(a, v);
            leerVenta(v);
        end;
end;
procedure evaluarMaxTotal(l: listaPuntajes; var mayor: integer);
var
    total: integer;
begin
    total:= 0;
    while (l <> nil) do
    begin
        total:= total + l^.puntaje;
        l := l^.sig;
    end;
    if (total > mayor) then
        mayor := total;
end;
procedure mayorPuntajeTotal(a: arbol; var mayor: integer);
begin
    if (a <> nil) then
    begin
        mayorPuntajeTotal(a^.HI, mayor);
        evaluarMaxTotal(a^.dato.lisPuntajes, mayor);
        mayorPuntajeTotal(a^.HD, mayor);
    end;
end;
procedure evaluarMaxIndividual(l: listaPuntajes);
var
    max: integer;
begin
    max:= -1;
    while (l <> nil) do
    begin
        if (l^.puntaje > max) then
            max := l^.puntaje;
        l := l^.sig;
    end;
    writeln(max);
end;
procedure evaluarMaxPuntajeEntreDNI(a: arbol);
begin
    if (a<>nil) then
        begin
            if (a^.dato.DNI >= 40000000) and (a^.dato.DNI <= 50000000) then
                begin
                    evaluarMaxIndividual(a^.dato.lisPuntajes);
                    evaluarMaxPuntajeEntreDNI(a^.HI);
                    evaluarMaxPuntajeEntreDNI(a^.HD);
                end;
            else
                if (a^.dato.DNI < 40000000) then
                    evaluarMaxPuntajeEntreDNI(a^.HD)
                else
                    evaluarMaxPuntajeEntreDNI(a^.HI);
        end;
end;
var
    a: arbol;
    max: integer;
begin
    a:= nil;
    max:= -1;
    crearArbol(a);
    mayorPuntajeTotal(a, max);
    writeln('El mayor puntaje total es: ', max);
    evaluarMaxPuntajeEntreDNI(a);
end.