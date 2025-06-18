package C20180625;

public class Modificadores {
    //Acceso Publico (Visible en cualquier Parte)
    public int publico = 10;
    //Acceso Privado (Solo Visible en esta clase)
    private int privado = 20;
    //Acceso protegido ( Visible en el paquete y subclases
    protected  int protegido = 30;
    //Acceso Default (Visible solo en el mismo paquete)
    int defecto = 40;
    //Metodo para acceder al privado desde otra clase
    public int getPrivado(){
        return this.privado;
    }
}
