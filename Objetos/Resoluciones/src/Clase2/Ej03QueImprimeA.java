/* a) ¿Qué imprime cada uno?
b) ¿Qué efecto tiene la asignación utilizada con objetos? El new reserva memoria para cada objeto (String)
c) ¿Qué se puede concluir acerca de la comparación con == y != utilizada con objetos? Compara referencias entre objetos, no su contenido
d) ¿Qué retorna el mensaje equals cuando se le envía a un String? Retorna true, ya que compara el contenido, no la referencia. */ 

package Clase2;

public class Ej03QueImprimeA {

    public static void main(String[] args) {
        String saludo1=new String("hola"); 
        String saludo2=new String("hola");
        System.out.println(saludo1 == saludo2); //False
        System.out.println(saludo1 != saludo2); //True
        System.out.println(saludo1.equals(saludo2)); //True
    }
    
}
