package Clase3.Ejercicio4;

public class Jugador {
    private String nombre;
    private int DNI;
    private int edad; 
    private int cantJugados;
    private int golesAnotados;
    
    public Jugador(String unNombre, int unDNI, int unaEdad, int unaCantJugados, int unosGolesAnotados){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
        cantJugados = unaCantJugados;
        golesAnotados = unosGolesAnotados;
    }
    
    public Jugador(){
     
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getCantJugados() {
        return cantJugados;
    }

    public void setCantJugados(int cantJugados) {
        this.cantJugados = cantJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }
    
    public boolean cumple () {
        return this.cantJugados > 100;
    }
    
}
