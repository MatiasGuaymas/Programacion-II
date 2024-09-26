/* 3- a) Modifique la clase Persona (del ejercicio 2 de la clase 2) para representar entrenadores de
un club de fútbol. Un entrenador se caracteriza por su nombre, sueldo básico y la cantidad de
campeonatos ganados.
▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por el
entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por
campeonatos ganados (5000 pesos si ha ganado entre 1 y 4 campeonatos; 30.000 pesos si
ha ganado entre 5 y 10 campeonatos; 50.000 pesos si ha ganado más de 10 campeonatos).
b) Realizar un programa principal que instancie un entrenador, cargándole datos leídos desde
teclado. Pruebe el correcto funcionamiento de cada método implementado. */

package Clase3.Ejercicio3;

import java.util.Scanner;

public class Ejercicio3 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el nombre del entrenador");
        String nombre = in.next();
        in.nextLine();
        System.out.println("Ingrese el sueldo basico del entrenador");
        double sueldo = in.nextDouble();
        System.out.println("Ingrese la cantidad de campeonatos ganados del entrenador");
        int cantCampeonatos = in.nextInt();
        Entrenador e = new Entrenador();
        e.setNombre(nombre);
        e.setSueldo(sueldo);
        e.setCantCampeonatos(cantCampeonatos);
        System.out.println(e);
        in.close();
    }
    
}
