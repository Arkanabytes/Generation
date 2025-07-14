package C20180625;

public class Modificadores {
    // Acceso PÚBLICO (visible en cualquier parte)
    public int publicoEjemplo = 10;
    // Acceso PRIVADO (solo visible en esta clase)
    private int privado = 20;
    // Acceso PROTEGIDO (visible en paquete y subclases)
    protected int protegido = 30;
    // Acceso DEFAULT (visible solo en el mismo paquete)
    int defecto = 40;
    // Método para acceder al 'privado' desde otra clase
    public int getPrivado() {
        return this.privado;
    }
}
