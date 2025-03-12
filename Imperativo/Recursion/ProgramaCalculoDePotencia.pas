{a) Implementar en el programa CalculoDePotencia, la función potencia1. 
b) Invocar a la función potencia1 para calcular 5^3 .
c) Compilar y ejecutar. ¿Qué ocurre? ¿Por qué? 
Cuando se ejecuta el codigo, da un error 202, que es un error de ejecucion, ya que la funcion potencia1 no tiene un caso base, por lo que se llama a si misma indefinidamente.}

{a) Implementar en el programa CalculoDePotencia, la función potencia2. 
b) Invocar a la función potencia2 para calcular 53  .
c) Compilar y ejecutar. ¿Qué ocurre? ¿Por qué? 
Cuando se ejecuta el codigo, da un error 202, que es un error de ejecucion, ya que la funcion potencia2 nunca decrementa en 1 el valor de n, por lo que se llama a si misma indefinidamente.}

program CalculoDePotencia;
{Function potencia1 (x,n: integer): real;
begin
  potencia1 := x * potencia1(x,n-1)
end; }
{Function potencia2 (x,n: integer): real;
begin
  if (n = 0) then 
    potencia2 := 1
  else
    potencia2 := x * potencia2(x,n);
end;}
Function potencia3 (n,x: integer): integer;
begin
  if (x = 0) then 
    potencia3 := 1
  else
    potencia3 := n * potencia3(n,x-1);
end;
{PROGRAMA PRINCIPAL}
var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (n);
     write ('Ingrese exponente: ');
     Readln (x);
     //writeln (n, '^', x, ' = ', potencia1(n,x));
     //writeln (n, '^', x, ' = ', potencia2(n,x));
     writeln (n, '^', x, ' = ', (potencia3(n,x)));
     readln;
end.
