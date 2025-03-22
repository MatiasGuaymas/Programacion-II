{a) Compilar y ejecutar
b) Implementar un módulo recursivo Máximo que devuelva el máximo valor del vector. 
c) Implementar un módulo recursivo Suma que devuelva la suma de los valores contenidos en el vector
d) Utilizar los módulos implementados para mostrar el máximo y la suma. 
e) Compilar y ejecutar}

program Arreglos;

const
    dimF = 8;  {Dimensi�n f�sica del vector}

type

    vector = array [1..dimF] of LongInt;

    dim = 0..dimF;


{-----------------------------------------------------------------------------
CARGARVECTOR - Carga nros aleatorios entre 0 y 100 en el vector hasta que
llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVector ( var vec: vector; var dimL: dim);
var
   d: integer;
begin
     Randomize;  { Inicializa la secuencia de random a partir de una semilla}
     dimL := 0;
     d:= random(100);
     while (d <> 99)  and ( dimL < dimF ) do begin
           dimL := dimL + 1;
           vec[dimL] := d;
           d:= random(100);
     end;
End;



{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }
Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;
function max (a, b: integer): integer;
begin
    if a > b then
        max:= a
    else
        max:= b;
end;
function Maximo (v: vector; dimL: integer): integer;
begin
    if dimL = 0 then
        Maximo:= -1
    else
        Maximo:= max (v[dimL], Maximo(v, dimL-1));
end;
function Suma (v: vector; dimL: integer): integer;
begin
    if dimL = 0 then
        Suma:= 0
    else
        Suma:= v[dimL] + Suma(v, dimL-1);
end;
{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;

begin

     cargarVector(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     writeln('El maximo es: ', Maximo(v, dimL));
     writeln('La suma es: ', Suma(v, dimL));
     readln;
end.
