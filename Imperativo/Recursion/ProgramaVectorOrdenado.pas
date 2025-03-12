{a) Compilar y ejecutar.
b) Implementar el método de búsqueda dicotómica. 
c) Utilizar el método implementado para buscar un valor que se lee de teclado y  mostrar el resultado. }

program VectorOrdenado;

const
    dimF = 8;  {Dimensi�n f�sica del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

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

procedure busquedaDicotomica (v:vector;ini,fin, dato:integer; var pos:integer);
var 
    medio:integer;
begin
    medio:=(ini+fin) div 2;
    //writeln('ini: ',ini,' fin: ',fin,' N: ',dato,' pos: ',pos,' Medio:',medio);
    if (ini<=fin) then 
        begin 
            if (v[medio]=dato) then 
                pos:=medio
            else 
                if (v[medio]>dato) then 
                    busquedaDicotomica(v,ini,medio-1,dato,pos)
                else
                    busquedaDicotomica(v,medio+1,fin,dato,pos);
        end 
    else 
        pos:=-1;
end;

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   pos, num: integer;
begin

     cargarVectorOrdenado(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     writeln('Ingrese un numero a buscar: ');
     readln(num);
     busquedaDicotomica(v, 1, dimL, num, pos);
     if (pos <> -1) then
        writeln('El numero ', num, ' se encuentra en la posicion ', pos)
     else
        writeln('El numero ', num, ' no se encuentra en el vector');
     readln;
end.
