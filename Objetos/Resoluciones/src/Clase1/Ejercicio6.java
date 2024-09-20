/* 6- Escriba un programa que defina una matriz de enteros de tamaño 10x10. Inicialice la
matriz con los primeros 100 números pares (ej: la posición 0,0 contendrá 0; la posición
0,1 contendrá 2; la posición 0,2 contendrá 4; así siguiendo).
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de todos los elementos almacenados entre las filas
2 y 9 y las columnas 0 y 3
- Generar un vector de 10 posiciones donde cada posición i contiene la suma de
los elementos de la columna i de la matriz.
- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario imprima
“No se encontró el elemento” */

package Clase1;

import java.util.Scanner;

public class Ejercicio6 {

    public static void main(String[] args) {
        int dimF = 10;
        int[][] matriz = new int[dimF][dimF];
        int valorPar = 0;
        
        for (int i = 0; i < dimF; i++) {
            for (int j = 0; j < dimF; j++) {
                matriz[i][j] = valorPar;
                valorPar += 2;
            }
        }

        System.out.println("Contenido de la matriz:");
        for (int i = 0; i < dimF; i++) {
            for (int j = 0; j < dimF; j++) {
                System.out.print(matriz[i][j] + "\t");
            }
            System.out.println();
        }

        // Calcular la suma de los elementos entre las filas 2 y 9 y las columnas 0 y 3
        int suma = 0;
        for (int i = 2; i <= 9; i++) {
            for (int j = 0; j <= 3; j++) {
                suma += matriz[i][j];
            }
        }
        System.out.println("\nSuma de los elementos entre filas 2-9 y columnas 0-3: " + suma);

        // Generar un vector de 10 posiciones donde cada posición i contiene la suma de los elementos de la columna i
        int[] sumaColumnas = new int[dimF];
        for (int j = 0; j < dimF; j++) {
            for (int i = 0; i < dimF; i++) {
                sumaColumnas[j] += matriz[i][j];
            }
        }

        System.out.println("\nSuma de los elementos de cada columna:");
        for (int j = 0; j < dimF; j++) {
            System.out.println("Columna " + j + ": " + sumaColumnas[j]);
        }

        // Leer un valor entero y buscarlo en la matriz
        Scanner in = new Scanner(System.in);
        System.out.println("\nIngrese un número entero para buscar en la matriz:");
        int numeroBuscado = in.nextInt();
        boolean encontrado = false;
        int a,b;
        a = 0;
        b = 0;

        // Buscar el número en la matriz        
        while ((a < dimF) && (!encontrado)){
            while((b < dimF) && (matriz[a][b] != numeroBuscado ))
                b++;
            if(b == dimF){
                b = 0;
                a++;
            } else {
                encontrado = true;
            }
        }

        // Si no se encontró el número
        if (!encontrado) {
            System.out.println("No se encontró el elemento");
        } else {
            System.out.println("El elemento se encuentra en la fila " + a + " columna " + b);
        }

        in.close();
    }
}
