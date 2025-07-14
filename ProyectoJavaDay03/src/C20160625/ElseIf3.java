package C20160625;

public class ElseIf3 {
    public static void main(String[] args) {
        String user = "admin";
        String password = "<Password>";

        if (user.equals("admin") && password.equals("123")) {
            System.out.println("Bienvenido");
        } else {
            System.out.println("Ingrese correctamente");
        }
    }
}

