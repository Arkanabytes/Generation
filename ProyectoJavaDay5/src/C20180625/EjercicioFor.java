package C20180625; // Indica el paquete al que pertenece esta clase.

public class EjercicioFor { // Declaración de la clase principal.

    public static void main(String[] args) { // Método principal, punto de entrada del programa.
        int limite = 100; // Se declara una variable llamada 'limite' con el valor 100.

        // Bucle for que empieza en 10 y se incrementa de 10 en 10 hasta llegar a 100 (inclusive).
        for (int i = 10; i <= limite; i += 10) {

            // Si 'i' es igual al límite (100), se imprime " y 100".
            if (i == limite) {
                System.out.println(" y " + i);

                // Si 'i' es igual a 90, se imprime solo "90" sin coma ni salto de línea.
            } else if (i == 90) {
                System.out.print(i);

                // Para todos los demás valores (10 a 80), se imprime el número seguido de una coma y un espacio.
            } else {
                System.out.print(i + ", ");
            }
        }
    }
}
