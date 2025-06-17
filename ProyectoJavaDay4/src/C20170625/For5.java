package C20170625;

public class For5 {
        public static void main(String[] args) {
            System.out.println("Incremento");
            int suma = 5;
            int limite = 10;
            int contador = 0;

            for (int i = 2; i < limite; i+=2) {
                System.out.println(i + " ");
                suma += i;
                contador++;
            }

            System.out.println("Suma total: " + suma);
            System.out.println("-".repeat(20) + "\n");
        }
    }

