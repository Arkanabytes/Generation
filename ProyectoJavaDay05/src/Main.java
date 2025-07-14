import C20180625.Modificadores;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
// Crear una instancia de la clase Modificadores
        Modificadores mod = new Modificadores();

// Acceso público: sin restricciones
        System.out.println("Público: " + mod.publico);

// Acceso privado: no se puede acceder directamente (usamos getter en su lugar)
        System.out.println("Privado (vía getter): " + mod.getPrivado());

// Acceso protegido: accesible dentro del mismo paquete
        System.out.println("Protegido: " + mod.protegido);

// Acceso por defecto (default): accesible dentro del mismo paquete
        System.out.println("Default: " + mod.defecto);
    }
}