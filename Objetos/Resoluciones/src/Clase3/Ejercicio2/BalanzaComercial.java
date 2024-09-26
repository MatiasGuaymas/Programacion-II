package Clase3.Ejercicio2;

public class BalanzaComercial {
    private double monto;
    private int cantItems;
    
    public BalanzaComercial(){
        //this.iniciarCompra();
    };
    
    public void iniciarCompra() {
        this.monto = 0;
        this.cantItems = 0;
    }
    
    public void registrarProducto(double pesoEnKg, double precioPorKg) {
        this.monto += pesoEnKg * precioPorKg;
        this.cantItems++;
    }
    
    public double devolverMontoAPagar() { 
        return this.monto;
    }
    
    public String devolverResumenDeCompra() {
        return "Total a pagar " + this.devolverMontoAPagar() + " por la compra de " + this.cantItems + " productos";
    }
    
}
