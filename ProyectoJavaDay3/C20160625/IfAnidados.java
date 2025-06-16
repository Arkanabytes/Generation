package C20160625;

public class IfAnidados {
    public static void main(String[] args) {

        boolean usuario = true;
        boolean contrasenia = true;
        boolean activo = false;

        if (activo){
            if (contrasenia) {
                if (usuario) {
                    System.out.println("Bienvenido");
                } else {
                    System.out.println("Cuenta Inactiva");
                }
            }else {
                System.out.println("Password Correctamente");
                }
            }else{
            System.out.println("Ingrese Correctamente");
        }
    }
}
