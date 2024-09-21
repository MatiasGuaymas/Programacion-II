/* 5- Realice un programa que cargue un vector con 10 strings leídos desde teclado. El vector
generado tiene un mensaje escondido que se forma a partir de la primera letra de cada string.
Muestre el mensaje escondido en consola.
NOTA: La primer letra de un string se obtiene enviándole el mensaje charAt(0) al objeto string.
Probar con: humo oso lejos ala menos usado nene de ocho ! Debería imprimir: holamundo! */

package Clase2;

import java.util.Scanner;

public class Ejercicio5 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int DF = 10;
        String [] vec = new String[DF];
        int i;
        
        for(i = 0; i < DF; i++) {
            System.out.println("Ingrese un String");
            vec[i] = in.next();
            in.nextLine();
        }
        
        for(i = 0; i < DF; i++) 
            System.out.print(vec[i].charAt(0));
        
        in.close();
    }
    
}
