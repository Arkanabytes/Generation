package C20180625;

public class Modificadores {
    public static void main(String[] args) {

        Modificadores mod = new Modificadores();
        // Acceso PÚBLICO (sin restricciones)
        System.out.println("Público: " + mod.publicoEjemplo);
        // Privado: Error de compilación (solo accesible dentro de su clase)
        // System.out.println("Privado: " + mod.privado);
        // Acceso al privado vía método público (getter)
        System.out.println("Privado (vía getter): " + mod.getPrivado());
        // Acceso PROTEGIDO (mismo paquete)
        System.out.println("Protegido: " + mod.protegido);
        // Acceso DEFAULT (mismo paquete)
        System.out.println("Default: " + mod.defecto);
    }
}
