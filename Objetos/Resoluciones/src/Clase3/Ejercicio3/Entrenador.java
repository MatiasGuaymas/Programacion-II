package Clase3.Ejercicio3;

public class Entrenador {
    private String nombre;
    private double sueldo;
    private int cantCampeonatos;
    
    public Entrenador(String nombre, double sueldo, int cantCampeonatos) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.cantCampeonatos = cantCampeonatos;
    }
    
    public Entrenador() {}

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    public void setCantCampeonatos(int cantCampeonatos) {
        this.cantCampeonatos = cantCampeonatos;
    }
    
    private double sueldoCampeonato() {
        if(this.cantCampeonatos > 0) {
            if(this.cantCampeonatos <= 4) return 5000;
            else if (this.cantCampeonatos <= 10) return 30000;
            else return 50000;
        }
        return 0;
    }
    
    public double calcularSueldoACobrar() {
        return this.sueldo + this.sueldoCampeonato();
    }
    
    @Override
    public String toString () {
        return "Nombre=" + this.getNombre() + " Sueldo=" + this.getSueldo() + " CantCampeonatos=" + this.cantCampeonatos + " ACobrar=" + this.calcularSueldoACobrar();
    }
}

