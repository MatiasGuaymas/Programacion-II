{Se ingresan desde teclado el nombre, apellido y el dni de los alumnos de un curso de postgrado. 
La lectura finaliza con el nombre ‘ZZZ’. Nos piden generar un árbol con dicha información ordenada por dni.

Una vez generado el árbol: 
a. Realizar un módulo que reciba el árbol y un dni, y devuelva los datos de esa persona (el módulo debe tener en cuenta que el dni puede no existir en la estructura).
b. Realizar un módulo que reciba el árbol y un apellido, e imprima los datos de aquellos alumnos cuyo apellido sea el enviado por parámetro.
c. Realizar un programa que invoque a los módulos realizados.}

program enunciado1;
type
    cadena = string[30];
    alumno = record
        nombre: cadena;
        apellido: cadena;
        dni: integer;
    end;
    arbol = ^nodo;
    nodo = record
        dato: alumno;
        HI: arbol;
        HD: arbol;
    end;
procedure leerAlumno(var a: alumno);
begin
    writeln('Ingrese el nombre del alumno');
    readln(a.nombre);
    if (a.nombre <> 'ZZZ') then
    begin
        writeln('Ingrese el apellido del alumno');
        readln(a.apellido);
        writeln('Ingrese el dni del alumno');
        readln(a.dni);
    end;
end;
procedure insertar(var a: arbol; al: alumno);
begin
    if (a = nil) then
    begin
        new(a);
        a^.dato := al;
        a^.HI := nil;
        a^.HD := nil;
    end
    else
    begin
        if (al.dni < a^.dato.dni) then
            insertar(a^.HI, al)
        else
            insertar(a^.HD, al);
    end;
end;
procedure cargarArbol(var a: arbol);
var
    al: alumno;
begin
    leerAlumno(al);
    while (al.nombre <> 'ZZZ') do
    begin
        insertar(a, al);
        leerAlumno(al);
    end;
end;
procedure imprimirAlumno(a: alumno);
begin
    write('Nombre: ', a.nombre, ' Apellido: ', a.apellido, ' DNI: ', a.dni);
    writeln();
end;
procedure imprimirArbol(a: arbol);
begin
    if (a <> nil) then
    begin
        imprimirArbol(a^.HI);
        imprimirAlumno(a^.dato);
        imprimirArbol(a^.HD);
    end;
end;
procedure buscarDni(a: arbol; dni: integer; var al: alumno; var encontrado: boolean);
begin
    if (a <> nil) then
    begin
        if (a^.dato.dni = dni) then
            begin
                encontrado := true;
                al := a^.dato;
            end
        else
        begin
            if (dni < a^.dato.dni) then
                buscarDni(a^.HI, dni, al, encontrado)
            else
                buscarDni(a^.HD, dni, al, encontrado);
        end;
    end;
end;
procedure buscarApellido(a: arbol; apellido: cadena);
begin
    if (a <> nil) then
    begin
        buscarApellido(a^.HI, apellido);
        if (a^.dato.apellido = apellido) then
            imprimirAlumno(a^.dato);
        buscarApellido(a^.HD, apellido);
    end;
end;
var
    a: arbol;
    dni: integer;
    al: alumno;
    encontrado: boolean;
    apellido: cadena;
begin
    a := nil;
    cargarArbol(a);
    writeln('Arbol cargado');
    imprimirArbol(a);
    writeln('Ingrese el dni a buscar');
    readln(dni);
    buscarDni(a, dni, al, encontrado);
    if (encontrado) then
        imprimirAlumno(al)
    else
        writeln('No se encontro el dni');
    writeln('Ingrese el apellido a buscar');
    readln(apellido);
    buscarApellido(a, apellido);
end.