/* 4- Se dispone de la clase Partido (descargar del entorno). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin valores
iniciales y agregando luego el nombre del equipo local, el nombre del visitante, la cantidad de
goles del local y del visitante (en ese orden). Un objeto partido sabe responder a los siguientes
mensajes:
getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X)  modifica el nombre del equipo local al “String” pasado por parámetro (X)
setVisitante(X) modifica el nombre del equipo visitante al “String” pasado por parámetro (X)
setGolesLocal(X) modifica la cantidad de goles del equipo local “int” pasado por parámetro (X)
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante “int” pasado por parámetro (X)
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna un String vacío).
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate
a) Implemente un programa que cargue un vector con los 325 partidos disputados en la
superliga 2018/2019.
Luego de la carga realizar los métodos que considere necesarios para informar:
b) La cantidad de partidos que ganó River.
c) El total de goles que realizó Boca jugando de local.
d) El porcentaje de partidos finalizados con empate. */

package Clase2;

import java.util.Scanner;

public class Ejercicio4 {

    public static void main(String[] args) {
       Scanner in = new Scanner(System.in);
       int DF = 325;
       Partido vec [] = new Partido [DF];
       int i, golLocal, golVisitante;
       String local, visitante;
       
       for(i = 0; i < DF; i++) {
           System.out.println("Ingrese el nombre del equipo local");
           local = in.next();
           in.nextLine();
           System.out.println("Ingrese la cantidad de goles en el partido del equipo " + local);
           golLocal = in.nextInt();
           System.out.println("Ingrese el nombre del equipo visitante");
           visitante = in.next();
           in.nextLine();
           System.out.println("Ingrese la cantidad de goles en el partido del equipo " + visitante);
           golVisitante = in.nextInt();
           vec[i] = new Partido(local, visitante, golLocal, golVisitante);
       }
       
       int cantGanadosRiver = 0, cantGolesBoca = 0, cantEmpates = 0;
       
       for(i = 0; i < DF; i++){
           if(vec[i].hayEmpate())
               cantEmpates++;
           if(vec[i].getGanador().equals("River"))
               cantGanadosRiver++;
           if(vec[i].getLocal().equals("Boca"))
               cantGolesBoca += vec[i].getGolesLocal();
       }
       
       double prom = (double) cantEmpates/DF*100.0;
    
       System.out.println("River gano: " + cantGanadosRiver + " partidos y Boca metio: " + cantGolesBoca + " goles de Local");
       System.out.println("El porcentaje de partidos finalizados con empate es: " + prom + "%");
       in.close();
    }
    
}
