/* 2- Utilizando la clase Persona (ya implementada):
a) Realice un programa que almacene en un vector 15 personas. La información de cada
persona debe leerse de teclado.
Luego de almacenar la información:
b) Agregue un método que devuelva la cantidad de personas mayores de 65 años.
c) Agregue un método que devuelva la representación de la persona con menor DNI.
d) Muestre desde el programa principal la cantidad de personas mayores de 65 años y muestre
también la representación por pantalla de una persona con menor DNI. */

package Clase2;

import java.util.Scanner;

public class Ejercicio2 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int DF=3;  
        Persona [] vecPersona = new Persona[DF];
        String nombre;
        int i, dni, edad;
        for(i = 0; i < DF; i++) {
            System.out.println("Ingrese un nombre: ");
            nombre = in.next();
            in.nextLine();
            System.out.println("Ingrese un DNI: ");
            dni = in.nextInt();
            System.out.println("Ingrese una edad: ");
            edad = in.nextInt();
            vecPersona[i] = new Persona(nombre, dni, edad);
        }

        int contador = 0;
        int min = 999;
        Persona menor = null;
        for (i = 0; i < DF; i ++) {
            if(vecPersona[i].getEdad() > 65)
                contador++;
            if(vecPersona[i].getDNI() < min) {
                min = vecPersona[i].getDNI();
                menor = vecPersona[i];
        }}
        System.out.println("CANT PERSONAS MAYORES DE 65 ANIOS: " + contador);
        System.out.println(menor.toString());
        in.close();
    }
}