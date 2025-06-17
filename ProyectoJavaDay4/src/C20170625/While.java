package C20170625;

import java.util.Scanner;

public class While {
    public static void main(String[] args) {
        System.out.println("Validación de Entrada");
        Scanner scanner = new Scanner(System.in); // Lectura de entrada
        int numero = -1;

        while (numero < 1 || numero > 100) {
            System.out.print("Ingrese un número entre 1 y 100: ");
            numero = scanner.nextInt();

            if (numero < 1 || numero > 100) {
                System.out.println("El número ingresado no es válido, por favor intente nuevamente.");
            }else{
                System.out.println("El numero ingresaso no es valido intentelo de nuevo ");

            }
        }

        System.out.println("El número ingresado es: " + numero);
        scanner.close(); // Buena práctica: cerrar el scanner
    }
}