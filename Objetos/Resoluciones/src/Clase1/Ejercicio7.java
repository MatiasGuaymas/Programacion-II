/* 7- Escriba un programa que simule el ingreso de personas a un banco. Cada persona
que ingresa indica la operación que desea realizar (0: “cobro de cheque” 1: “depósito/
extracción en cuenta” 2: “pago de impuestos o servicios” 3: “cobro de jubilación” 4:
“cobro de planes”). La recepción de personas culmina cuando un empleado ingresa la
operación 999 (cierre del banco). Informar la cantidad de personas atendidas por cada
operación y la operación más solicitada. */

package Clase1;

import java.util.Scanner;

public class Ejercicio7 {

    public static void main(String[] args) {
        int dimF = 4;
        int [] vecContador = new int [dimF];
        int i;
        int max = -1;
        int maxOp = -1;
        
        for (i = 0; i < dimF; i++)
            vecContador[i] = 0;
        
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese la operacion que desea realizar");
        int op = in.nextInt();
        while(op != 999) {
            vecContador[op]++;
            System.out.println("Ingrese la operacion que desea realizar");
            op = in.nextInt();
        }
        
        for (i = 0; i < dimF; i++) {
            System.out.println("La cantidad de personas atendidas por la operacion " + i + " es: " + vecContador[i]);
            if(vecContador[i] > max) {
                max = vecContador[i];
                maxOp = i;
            }
        }
        System.out.println("La operacion mas solicitada es la operacion numero: " + maxOp);
        
        in.close();
    }
    
}
