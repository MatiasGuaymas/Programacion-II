{a) Implementar el módulo factorial como parte del programa CalculoDeFactorial
b) Completar el programa CalculoDeFactorial para que lea un valor X, invoque a la función factorial para calcular X!  y muestre el resultado.
c) Compilar y ejecutar}

program CalculoDeFactorial;
function factorial (n: integer): integer;
begin
  if n = 0 then
    factorial := 1
  else
    factorial := n * factorial(n-1);
end;
{PROGRAMA PRINCIPAL}
var 
  num: integer;
Begin

  writeln( 'Ingrese un entero no negativo:');
  readln (num);

  writeln ( num, '! = ', factorial(num));
  readln;
End.

