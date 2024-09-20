/* 3- Escriba un programa que imprima en consola el factorial de un número N (ingresado
por teclado, N > 0). Ejemplo: para N=5 debería imprimir 5! = 120 */

package Clase1;

import java.util.Scanner;

public class Ejercicio3 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese un numero para calcular su factorial (N > 0)");
        int n = in.nextInt();
        int factorial = 1;
        for (int i = 1; i <= n; i++)
            factorial *= i;
        System.out.println("El factorial es: " + factorial);
        in.close();
    }
    
}
