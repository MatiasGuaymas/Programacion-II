package Parcial;

public class Movimiento {
    private String tipo;
    private double monto;
    
    public Movimiento (String tipo, double monto) {
        this.tipo = tipo;
        this.monto = monto;
    }

    public String toString() {
        return "TIPO=" + this.tipo + " MONTO=" + this.monto;
    }
    
    
}
