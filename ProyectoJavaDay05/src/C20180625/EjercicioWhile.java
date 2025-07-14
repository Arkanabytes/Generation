// Paquete al que pertenece esta clase (puede estar relacionado con una organización de archivos)
package C20180625;

// Declaración de la clase pública llamada EjercicioWhile
public class EjercicioWhile {

    // Método principal: punto de entrada del programa
    public static void main(String[] args) {

        // Se declara e inicializa la variable 'j' con el valor 10
        int j = 10;

        // Bucle while: se repite mientras 'j' sea menor o igual a 100
        while (j <= 100) {

            // Si 'j' es igual a 100, imprime "y 100" (sin coma al final)
            if (j == 100) {
                System.out.print("y " + j);

                // Si 'j' es igual a 90, imprime "90 " (espacio al final, sin coma)
            } else if (j == 90) {
                System.out.print(j + " ");

                // Para todos los demás valores, imprime el número seguido de una coma y espacio
            } else {
                System.out.print(j + ", ");
            }

            // Incrementa 'j' en 10 para pasar al siguiente múltiplo de 10
            j += 10;
        }
    }
}

