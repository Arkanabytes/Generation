// Define el paquete al que pertenece esta clase (organización del proyecto)
package C20180625;

// Declaración de la clase pública llamada EjercicioDoWhile
public class EjercicioDoWhile {

    // Método principal del programa, punto de entrada de ejecución
    public static void main(String[] args) {

        // Se declara e inicializa la variable 'k' con el valor 10
        int k = 10;

        // Estructura do-while: ejecuta el bloque al menos una vez
        do {
            // Si 'k' es igual a 100, imprime "y 100" (sin coma)
            if (k == 100) {
                System.out.print("y " + k);

                // Si 'k' es igual a 90, imprime "90 " (con espacio, sin coma)
            } else if (k == 90) {
                System.out.print(k + " ");

                // En cualquier otro caso, imprime el número seguido de coma y espacio
            } else {
                System.out.print(k + ", ");
            }

            // Se incrementa 'k' en 10 en cada iteración
            k += 10;

            // La condición se evalúa al final: continúa mientras 'k' sea menor o igual a 100
        } while (k <= 100);

        // Salto de línea al final de la impresión para mejor presentación en consola
        System.out.println();
    }
}
