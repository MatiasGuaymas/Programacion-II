package Parcial;

public abstract class Cuenta {
    private int nroCuenta;
    private int dniPropietario;
    private double saldo;
    private boolean activa;
    private int dimL;
    private int dimF = 20;
    private Movimiento[] movimientos;
    
    public Cuenta (int nroCuenta, int dniPropietario) {
        this.nroCuenta = nroCuenta;
        this.dniPropietario = dniPropietario;
        this.saldo = 0;
        this.activa = true;
        this.dimL = 0;
        this.movimientos = new Movimiento[this.dimF];
    }
    
    private void actualizarHistorial(double unMonto, String tipo) {
        Movimiento mov = new Movimiento (tipo, unMonto);
        if (this.dimL == this.dimF) {
            for (int i = 1; i < this.dimF; i++) {
                this.movimientos[i - 1] = this.movimientos[i];
            }
            this.movimientos[this.dimF - 1] = mov;
        } else 
            this.movimientos[this.dimL++] = mov;
    }
    
    public void depositar (double unMonto) {
        this.saldo += unMonto;
        this.actualizarHistorial(unMonto, "Deposito");
    }
    
    public abstract boolean esPosibleExtraer(double unMonto);
    
    public double getSaldo() {
        return this.saldo;
    }
    
    public boolean extraer(double unMonto) {
        if (this.esPosibleExtraer(unMonto)) {
            this.saldo -= unMonto;
            this.actualizarHistorial(unMonto, "Extraccion");
            return true;
        } else return false;
    }
    
    public abstract boolean esPosibleMantenimiento();
    
    public abstract double cobroMantenimiento();
    
    public void cobrarMantenimiento() {
        if (this.esPosibleMantenimiento()) {
            this.saldo -= this.cobroMantenimiento();
        } else this.activa = false;
    }
    
    private String imprimirMovimientos() {
        String aux = "";
        for (int i =0; i< this.dimL ; i++) {
            aux+= this.movimientos[i].toString() + " - ";
        }
        return aux;
    }
    
    public abstract String cuentaImp();
    
    public String resumen() {
        return "NUMCUENTA=" + this.nroCuenta + " DNI=" + this.dniPropietario + this.imprimirMovimientos() + " CUENTA ACTIVA?=" + this.activa + " " + this.cuentaImp();
    }
    
}
