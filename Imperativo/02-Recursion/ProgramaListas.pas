{a) Compilar y ejecutar
b) Implementar un módulo recursivo Mínimo que devuelva el mínimo valor de la lista. 
c) Implementar un módulo recursivo Imprimir que imprima los valores contenidos en la lista.
d) Utilizar los módulos implementados para mostrar el mínimo y la impresión. 
e) Compilar y ejecutar}

Program listas;
Type
  Lista= ^Nodo;
  Nodo= Record
           Datos: integer;
           Sig: Lista;
        End;
Var
 L: Lista;
 n: integer;
 min: integer;

Procedure AgregarAdelante (var L:lista; num:integer);
Var nue:Lista;
  Begin
    New(nue);
    nue^.datos:=num;
    nue^.sig:=L;
    L:=nue;
  End;


{Procedure Imprimir (pri:lista);
Begin
   while (pri <> NIL) do begin
     write (pri^.datos, ' ');
     pri:= pri^.sig
  end;
  writeln;
end; }

procedure Minimo (L:lista; var min:integer);
begin
  if (L <> nil) then begin
    if (L^.datos < min) then
      min:= L^.datos;
    Minimo (L^.sig, min);
  end;
end;

procedure Imprimir (L:lista);
begin
  if (L <> nil) then begin
    write (L^.datos, ' - ');
    Imprimir (L^.sig);
  end;
end;

begin
 min:= 9999;
 L:=nil;
 randomize;
 n := random (100);
 While (n<>0) do Begin
   AgregarAdelante (L, n);
   n := random (100);
 End;
 writeln ('Lista generada: ');
 imprimir (L);
 minimo (L, min);
 writeln ('El minimo es: ', min);
 readln
end.
