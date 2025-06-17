package C20170625;

public class While3 {
    public static void main(String[] args) {
        int contador = 0;
        while (contador <= 3) {
            System.out.println("Intento: " + contador);
            contador++; // Incrementar para evitar bucle infinito
        }
    }
}

