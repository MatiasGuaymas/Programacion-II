/* 1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Área = √(s(s − a)(s − b)(s − c)) , donde a, b y c son
los lados y s = (a+b+c)/2 . La función raíz cuadrada es Math.sqrt(#) */

package Clase3.Ejercicio1;

import java.util.Scanner;

public class Ejercicio1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el lado 1 del triangulo");
        double lado1 = in.nextDouble();
        System.out.println("Ingrese el lado 2 del triangulo");
        double lado2 = in.nextDouble();
        System.out.println("Ingrese el lado 3 del triangulo");
        double lado3 = in.nextDouble();
        System.out.println("Ingrese el color de relleno del triangulo");
        String colorRelleno = in.next();
        in.nextLine();
        System.out.println("Ingrese el color de linea del triangulo");
        String colorLinea = in.next();
        in.nextLine();
        Triangulo triangulo1 = new Triangulo(lado1, lado2, lado3, colorRelleno, colorLinea);
        System.out.println(triangulo1.calcularPerimetro());
        System.out.println(triangulo1.calcularArea());
        in.close();
    }
}
