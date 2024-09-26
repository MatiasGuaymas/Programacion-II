/* 4- a) Modifique la clase Persona (ya implementada en la clase 2) agregando los cambios
necesarios para que represente jugadores de fútbol de un club. Todos los jugadores de futbol
se caracterizan por tener además de los atributos de la clase persona una estadística básica
que consiste en el número de partidos jugados y el número de goles anotados.
▪ Incorpore los atributos número de partidos jugados y número de goles anotados junto a
todos sus getters y setters.
b) Implemente un programa para que se lean desde teclado y almacenen en un vector a lo
sumo 50 jugadores. Luego de almacenar la información, agregue un método que devuelva la
cantidad de jugadores con más de 100 partidos jugados. */

package Clase3.Ejercicio4;

import java.util.Scanner;

public class Ejercicio4 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        //Mi condicion de corte sera nombre "ZZZ", dice a lo sumo
        int diml = 0;
        int DF = 50;
        Jugador [] vec = new Jugador[DF];
        
        String nombre;
        int dni, edad, cantJugados, golesAnotados;
        
        System.out.println("Ingrese el nombre del jugador");
        nombre = in.next();
        in.nextLine();
        while(!nombre.equals("ZZZ") && diml < DF) {
            System.out.println("Ingrese el DNI del jugador");
            dni = in.nextInt();
            System.out.println("Ingrese la edad del jugador");
            edad = in.nextInt();
            System.out.println("Ingrese la cantidad de partidos jugados del jugador");
            cantJugados = in.nextInt();
            System.out.println("Ingrese la cantidad de goles anotados por el jugador");
            golesAnotados = in.nextInt();
            vec[diml++] = new Jugador(nombre, dni, edad, cantJugados, golesAnotados);
            System.out.println("Ingrese el nombre del jugador");
            nombre = in.next();
            in.nextLine();
        }
        
        int cantCumple = 0;
        for (int i = 0; i < diml; i++) {
            if(vec[i].cumple()) cantCumple++;
        }
        System.out.println("CantCumple=" + cantCumple);
        
        in.close();
    }
    
}
