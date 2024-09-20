/* 5- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de básquet
y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
NOTA: Dispone de un esqueleto para este programa en Ej05Jugadores.java */

package Clase1;

import java.util.Scanner;

public class Ejercicio5 {
    /**
     * Método main
     * 
     */
    public static void main(String[] args) {
        int dimF = 15;
        //Paso 1: Declarar la variable vector de alturas
        double [] vector;
        //Paso 2: Declarar indice y promedio (iniciarlo)
        int i;
        double suma = 0;
        int cantMayores = 0;
        //Paso 3: Declarar y crear el scanner
        Scanner in = new Scanner(System.in); 
        //Paso 4: Crear el vector para 15 valores
        vector = new double [dimF];
        //Paso 5: Ingresar 15 numeros, cargarlos en el vector, ir calculando la suma
        for (i = 0; i < dimF; i++) {
            System.out.println("Ingresa la altura");
            vector[i] = in.nextDouble();
            suma+= vector[i];
        }
        //Paso 6: Calcular el promedio
        suma = (suma/dimF);
        //Paso 7: Recorrer el vector, contar los números que son mayores que el promedio
        for (i = 0; i < dimF; i++) {
            if(vector[i] > suma) 
                cantMayores++;
        }
        System.out.println("La cantidad de jugadores mayores que el promedio es: " + cantMayores);
        in.close();
    }
}
