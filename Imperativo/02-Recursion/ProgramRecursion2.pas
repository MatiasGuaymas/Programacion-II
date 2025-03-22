{a) Modificar el procedimiento digitoMaximo. Debe pasarse el parámetro max por valor. 
b) Compilar y ejecutar.
c) Responder: 
¿Qué valor se muestra antes de finalizar cada módulo?
Imprime el digito maximo de cada numero ingresado.
¿Qué valor se muestra en el programa principal? 
Se muestra el valor -1, nunca se actualizo el maximo, es un procedimiento. }

{a) Escribir el procedimiento digitoMaximo como una función. 
b) En el programa, leer un número, invocar a la función y mostrar el resultado.
c) Compilar y ejecutar. }

program Recursion;

var 
  num, maximo: integer;

{procedure digitoMaximo(n: integer; max: integer);
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMaximo(n, max);
  writeln(max);
end;}
function digitoMaximo (n: integer): integer;
var
  dig: integer;
begin
    if (n = 0) then
        digitoMaximo := -1
    else
    begin
        dig:= n mod 10;
        if ( dig > digitoMaximo(n div 10) ) then
        digitoMaximo := dig
        else
        digitoMaximo := digitoMaximo(n div 10);
    end;
    end;
Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  //digitoMaximo (num, maximo);
  writeln ( 'El digito maximo del numero ', num, ' es: ', digitoMaximo(num));
  readln;
End.

