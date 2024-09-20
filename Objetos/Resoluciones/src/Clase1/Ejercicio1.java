/* 1 - Escriba un programa que lea desde teclado 3 valores double. Determine si a partir
de ellos se forma un triángulo válido y en ese caso muestre en consola el perímetro del
mismo.
NOTA: Un triángulo es válido si se cumplen las siguientes tres condiciones:
(a < b + c) , (b < a + c), (c < a + b), donde a,b,c son los lados. */

package Clase1;

import java.util.Scanner;

public class Ejercicio1 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el primer lado del triangulo");
        double ladoA = in.nextDouble();
        System.out.println("Ingrese el segundo lado del triangulo");
        double ladoB = in.nextDouble();
        System.out.println("Ingrese el tercer lado del triangulo");
        double ladoC = in.nextDouble();
        if((ladoA < ladoB + ladoC) && (ladoB < ladoA + ladoC) && (ladoC < ladoA + ladoB))
            System.out.println("El perimetro del triangulo es: " + (ladoA + ladoB + ladoC));
        else 
            System.out.println("El triangulo no es valido");
        in.close();
    }
}
