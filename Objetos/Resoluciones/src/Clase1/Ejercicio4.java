/* 4- Escriba un programa que imprima en consola el factorial de todos los números entre
1 y 9. ¿Qué modificación debe hacer para imprimir el factorial de los números impares
solamente? */
package Clase1;

public class Ejercicio4 {

    public static void main(String[] args) {
        for (int n = 1; n <= 9; n++) {
            if (n % 2 != 0) {
                int factorial = 1;
                for (int i = 1; i <= n; i++) {
                    factorial *= i;
                }
                System.out.println("El factorial de " + n + " (impar) es: " + factorial);
            }
        }
    }
    
}
