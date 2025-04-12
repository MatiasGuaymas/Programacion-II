/* 8- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen (con
puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad de la
comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes para
cada uno de los aspectos y almacene la información en una estructura. Luego imprima
la calificación promedio obtenida por cada aspecto */

package Clase1;

import java.util.Scanner;

public class Ejercicio8 {

    public static void main(String[] args) {
        int dimFila = 5; // 5 clientes
        int dimColumna = 4; // 4 aspectos
        int[][] restaurante = new int[dimFila][dimColumna];
        Scanner in = new Scanner(System.in);
        
        System.out.println("Clasifique los aspectos del 1 al 10: 0) Atención al cliente 1) Calidad de la comida 2) Precio 3) Ambiente");
        
        for (int i = 0; i < dimFila; i++) {
            System.out.println("Cliente " + (i + 1) + ":");
            for (int j = 0; j < dimColumna; j++) {
                System.out.print("Aspecto " + j + ": ");
                restaurante[i][j] = in.nextInt();
            }
        }
        
        // Calcular promedios
        double[] promedio = new double[dimColumna];
        for (int j = 0; j < dimColumna; j++) {
            double suma = 0;
            for (int i = 0; i < dimFila; i++) {
                suma += restaurante[i][j];
            }
            promedio[j] = suma / dimFila;
        }
        
        // Imprimir promedios
        System.out.println("-------------");
        String[] aspectos = {"Atención al cliente", "Calidad de la comida", "Precio", "Ambiente"};
        for (int j = 0; j < dimColumna; j++) {
            System.out.println("Promedio de " + aspectos[j] + ": " + promedio[j]);
        }
    }
}
