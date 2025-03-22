{1. Un negocio de puertas y ventanas dispone de una lista de los productos que tiene para la venta.
De cada producto se conoce el código, la marca, el nombre, el año de fabricación y el precio.
Esta información está ordenada, dentro de una lista simple, primero por marca y dentro de cada
marca por año.
Se solicita realizar un programa que:
a. Genere una estructura con la información de los productos ordenados por marca, donde
por cada marca se tengan los productos ordenados por año.
De las estructuras de datos disponibles utilice la que crea más adecuada para:
b. Informar la cantidad de productos, de la marca “Abercom”, fabricados entre los años
2020 y 2023 inclusive y cuyo precio supero los 100.000 pesos.
c. Imprimir un reporte con la siguiente información:
Ejemplo:
Marca: Abercom:
Año: 2017
0001 Ventana madera dos cuerpos 35000$
0002 Ventana aluminio dos cuerpos 25000$
0003 Ventana madera un cuerpo 25000$
0004 Ventana aluminio un cuerpo 15000$
Total productos Año2017:4
Año: 2018
0058 Ventana aluminio dos cuerpos 24000$
0059 Ventana aluminio 1 cuerpo 14000$
Total productos Año 2018: 2
Total productosAbercom : 6
Marca : La Foret
Año: 2019
0458 Puerta madera dos cuerpos 45000$
1458 Puerta aluminio dos cuerpos 35000$
1459 Puerta madera un cuerpo 35000$
Total productos Año2019:3
Año: 2020
5875 Puerta aluminio dos cuerpos 34000$
5876 Puerta aluminio 1 cuerpo 24000$
Total productos Año 2020: 2
Total productos La Foret: 5}

Program productos;
Uses
     sysutils;
Type
     producto = record
          codigo: integer;
	      nombre: string;
	      marca: string;
	      anio: 2000..2022;
		  precio: real;
     end;

     listaProductos = ^nodoLista;
     nodoLista = record
               dato: producto;
               sig: listaProductos;
     end;
    
    regMarca = record
        marca: string;
        l: listaProductos;
    end;

    listaMarca = ^nodoMarca;
    nodoMarca = record  
        dato: regMarca;
        sig: listaMarca;
    end;

Procedure agregarAdelante(var l: listaProductos; p: producto);
var
   aux: listaProductos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;


{crearLista - Genera una lista con productos aleatorios}
procedure crearLista(var l: listaProductos);
var
   i,j:integer;
   p: producto;
   
   v : array [1..10] of string;
begin
     v[1]:= 'Abercom';
     v[2]:= 'Aluminium';
     v[3]:= 'ClearWindows';
     v[4]:= 'IndArg';
     v[5]:= 'La Foret';
     v[6]:= 'Open';
     v[7]:= 'Portal';
     v[8]:= 'Puertamania';
     v[9]:= 'PVCPremium';
     v[10]:= 'Ventalum';

	 for i:=random(10) downto 1 do {for de marca}
	 begin
	     p.marca:= v[i];
		 for j:=random(5) downto 1 do {for de anio}
	     begin
		 	p.anio:= 2016+j;
			p.codigo:= random(10);
			while (p.codigo <> 0) do Begin
				p.nombre:= Concat('Producto-', IntToStr(random (200)));
				p.precio := random(1000000);
				agregarAdelante(l, p);
                p.codigo:= random(10);
		   end;
		 end;
	 end;
end;


{imprimir - Muestra en pantalla el producto}
procedure imprimir(p: producto);
begin
     with (p) do begin
          writeln('Producto', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaProductos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure agregarAtras(var l: listaProductos; p: producto);
var
    aux, act: listaProductos;
begin
     new(aux);
     aux^.dato:= p;
     aux^.sig:= nil;
     if (l = nil) then
         l:= aux
     else begin
          act:= l;
          while (act^.sig <> nil) do
               act:= act^.sig;
          act^.sig:= aux;
     end;
end;

procedure agregarAtrasLisDeListas(var l: listaMarca; marca: string; lProd: listaProductos);
var
    aux, act: listaMarca;
begin
     new(aux);
     aux^.dato.marca:= marca;
     aux^.dato.l:= lProd;
     aux^.sig:= nil;
     if (l = nil) then
         l:= aux
     else begin
          act:= l;
          while (act^.sig <> nil) do
               act:= act^.sig;
          act^.sig:= aux;
     end;
end;

procedure crearListaOrd(var l: listaProductos; var lOrd: listaMarca);
var
    lAux: listaProductos;
    marcaActual: string;
begin
     while (l <> nil) do begin
          marcaActual:= l^.dato.marca;
          lAux:= nil;
          while (l <> nil) and (l^.dato.marca = marcaActual) do begin
               agregarAtras(lAux, l^.dato);
               l:= l^.sig;
          end;
          agregarAtrasLisDeListas(lOrd, marcaActual, lAux);
     end;
end;

procedure imprimirLisDeListas(l: listaMarca);
var
    lAux: listaProductos;
begin
     while (l <> nil) do begin
          writeln('Marca: ', l^.dato.marca);
          lAux:= l^.dato.l;
          while (lAux <> nil) do begin
               writeln('Anio: ', lAux^.dato.anio);
               imprimir(lAux^.dato);
               lAux:= lAux^.sig;
          end;
          l:= l^.sig;
     end;
end;

function cantProductosAbercom(l: listaMarca): integer;
var
    cant: integer;
    aux: listaProductos;
begin
    cant:= 0;
    while ((l<>nil) and (l^.dato.marca < 'Abercom')) do
        l:= l^.sig;
    if ((l<>nil) and (l^.dato.marca = 'Abercom')) then
        begin
            aux:= l^.dato.l;
            while (aux <> nil) do
                begin
                    if ((aux^.dato.anio >= 2020) and (aux^.dato.anio <= 2023) and (aux^.dato.precio > 100000)) then
                        cant:= cant + 1;
                    aux:= aux^.sig;
                end;
        end;
    cantProductosAbercom:= cant;
end;

procedure imprimirRegReporte(p: producto);
begin
    writeln('          ',p.codigo, ' ', p.nombre, ' ', p.precio:2:2, '$');
end;

procedure imprimirReporte(l: listaMarca);
var
    aux: listaProductos;
    cant, anioActual: integer;
begin
    while (l <> nil) do
        begin
            writeln('Marca: ', l^.dato.marca);
            aux:= l^.dato.l;
            cant:= 0;
            anioActual:= aux^.dato.anio;
            writeln('Anio: ', anioActual); 
            while (aux <> nil) and (anioActual = aux^.dato.anio) do
                begin
                    imprimirRegReporte(aux^.dato);
                    cant:= cant + 1;
                    aux:= aux^.sig;
                end;
            writeln('Total productos Anio ', anioActual, ': ', cant);
            l:= l^.sig;
        end;
end;

var
   l: listaProductos;
   lOrd: listaMarca;
begin
     Randomize;
     lOrd:= nil;
     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     readln;
     writeln('Lista de listas: ');
     crearListaOrd(l, lOrd);
     //imprimirLisDeListas(lOrd);
     writeln('La cantidad de productos, de la marca “Abercom”, fabricados entre los años 2020 y 2023 inclusive y cuyo precio supero los 100.000 pesos es: ', cantProductosAbercom(lOrd));
     imprimirReporte(lOrd);
end.