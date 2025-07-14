package C20160625;

public class For2 {
    public static void main(String[] args) {
            System.out.println("Tablas de Multiplicar");
            System.out.println("Contador del 1 al 10");

            int numeroDeTablas = 4;
            for (int i = 0; i <10; i++) {
                int resultado = numeroDeTablas * i;
                System.out.printf(i + "%d x %d = %d%n", numeroDeTablas, i, resultado);
            }
            System.out.println();
            }
}


