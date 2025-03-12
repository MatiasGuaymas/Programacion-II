package Parcial;

public class CajaAhorro extends Cuenta{
    private boolean tarjeta;
    
    public CajaAhorro(int nroCuenta, int dniPropietario, boolean tarjeta) {
        super(nroCuenta, dniPropietario);
        this.tarjeta = tarjeta;
    }
    
    @Override
    public boolean esPosibleExtraer(double unMonto) {
        return this.getSaldo() >= unMonto;
    }
    
    @Override
    public double cobroMantenimiento() {
        double base = 0;
        if (this.tarjeta) base = 2000; 
        else base = 1000;
        return base + (1 / (this.getSaldo()+1));
    }
    
    @Override
    public boolean esPosibleMantenimiento() {
        return this.getSaldo() >= this.cobroMantenimiento();
    }
    
    public String cuentaImp() {
        return "TARJETA=" + this.tarjeta;
    }
    
}
