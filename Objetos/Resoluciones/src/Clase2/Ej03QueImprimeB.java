/* a) ¿Qué imprime cada uno?
b) ¿Qué efecto tiene la asignación utilizada con objetos? La persona Pablo Sotile ya no apunta a su direccion original, si no a Julio Toledo, cualquier operacion sobre estas dos personas se vera reflejado en Julio
c) ¿Qué se puede concluir acerca de la comparación con == y != utilizada con objetos? Compara referencias entre objetos, no su contenido
d) ¿Qué retorna el mensaje equals cuando se le envía a un String? Retorna true, ya que compara el contenido, no la referencia. */ 

package Clase2;

public class Ej03QueImprimeB {

    public static void main(String[] args) {
        Persona p1;
        Persona p2;
        p1 = new Persona();
        p1.setNombre("Pablo Sotile");
        p1.setDNI(11200413);
        p1.setEdad(40);
        p2 = new Persona();
        p2.setNombre("Julio Toledo");
        p2.setDNI(22433516);
        p2.setEdad(51);
        p1 = p2;
        p1.setEdad( p1.getEdad() + 1 );
        System.out.println(p2.toString()); //Imprime los datos de Julio Toledo
        System.out.println(p1.toString()); //Imprime los datos de Julio Toledo
        System.out.println( (p1 == p2) ); //True
    }
    
}
