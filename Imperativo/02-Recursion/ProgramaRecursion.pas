{a) Compilar y ejecutar.
b) Responder: 
¿Cuál es el caso base en el procedimiento digitoMaximo? 
El caso base es cuando n es igual a 0.
¿Cómo se acerca al caso base? 
Se acerca al caso base dividiendo n por 10. O sea, descomponiendo los digitos del numero ingresado.}

{a) Modificar el procedimiento digitoMaximo. Debe colocarse la instrucción writeln ('max: ', max); como última instrucción del procedimiento. 
b) Compilar y ejecutar.
c) Responder: 
¿Qué valor se muestra antes de finalizar cada módulo?
El valor que se muestra es el digito maximo del numero ingresado. Esto es asi porque se muestra el valor de la variable max en cada llamada recursiva, que ya fue calculado.
¿Qué valor se muestra en el programa principal?
El digito maximo del numero ingresado.}

program Recursion;

var 
  num, maximo: integer;

procedure digitoMaximo(n: integer; var max: integer);
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMaximo(n, max);
  writeln ('max: ', max);
end;

Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  digitoMaximo (num, maximo);
  writeln ( 'El digito maximo del numero ', num, ' es: ', maximo);
  readln;
End.

