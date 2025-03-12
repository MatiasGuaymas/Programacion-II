package Parcial;

public class CuentaCorriente extends Cuenta{
    private double acuerdo;
    
    public CuentaCorriente (int nroCuenta, int dniPropietario, double acuerdo) {
        super(nroCuenta, dniPropietario);
        this.acuerdo = acuerdo;
    }
    
    @Override
    public boolean esPosibleExtraer(double unMonto) {
        return (this.getSaldo() - unMonto) >= -this.acuerdo;
    }
    
    @Override
    public double cobroMantenimiento() {
        return 50 * this.acuerdo;
    }
    
    @Override
    public boolean esPosibleMantenimiento() {
        return (this.getSaldo() - this.cobroMantenimiento() >= -this.acuerdo);
    }
    
    public String cuentaImp() {
        return "ACUERDO=" + this.acuerdo;
    }
}
