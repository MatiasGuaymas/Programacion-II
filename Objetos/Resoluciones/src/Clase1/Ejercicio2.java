/* 2 - Escriba un programa para restringir la entrada de autos al centro de la ciudad: sólo
pasarán aquellos con patente par. Para ello se leen números de patentes, por cada una
debe informar en consola si el auto tiene o no permitido el paso. La lectura finaliza
cuando se ingresa la patente 0. Al finalizar, informar el porcentaje de autos que
ingresaron respecto al total de autos. */
package Clase1;

import java.util.Scanner;

public class Ejercicio2 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int totalAutos = 0;
        int totalCumple = 0;
        System.out.println("Ingrese un numero de patente");
        int patente = in.nextInt();
        while(patente != 0) {
            totalAutos++;
            if(patente %2 == 0) {
                System.out.println("La patente " + patente + " tiene permitido el paso");
                totalCumple++;
            } else 
                System.out.println("La patente " + patente + " NO tiene permitido el paso");
            System.out.println("Ingrese un numero de patente");
            patente = in.nextInt();
        }
        if(totalAutos != 0) {
            double prom = (double) totalCumple / totalAutos * 100.0;
            System.out.println("El porcentaje de autos que ingresaron respecto al total de autos es: " + prom + "%");
        }
        else
            System.out.println("No se ingresaron autos");
        in.close();
    }
    
}
