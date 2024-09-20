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
        int dimColumna = 5;
        int dimFila = 4;
        int [][] restaurante = new int [dimColumna][dimFila];
        int i, j;
        Scanner in = new Scanner(System.in);
        System.out.println("Clasifique los aspectos según su código del 1 al 10: 0) Atención al cliente. 1) Calidad de la comida. 2) Precio. 3) Ambiente.");
        
        for (i=0; i<dimColumna; i++)
            for (j=0; j<dimFila; j++) {
                System.out.println("Clasifique el aspecto : " + j);
                restaurante [i][j]= in.nextInt();
            }
        
        for (i=0; i<dimColumna; i++) {
             System.out.println("-------------");
             for(j=0; j<dimFila; j++)
                  System.out.print(restaurante[i][j] + " | ");
        }     
        
        double [] promedio = new double [dimFila];
        for (j=0; j<dimFila; j++) {
            double prom = 0;
            for(i=0; i<dimColumna; i++)
                prom+= restaurante[i][j];
            promedio[j] = prom/5;
        }
        System.out.println("-------------");
        for (i=0; i<dimFila; i++)
            System.out.println("El promedio del aspecto " + i+ " es: " + promedio[i]);
    }
    
}
