// Paquete al que pertenece esta clase. Sirve para organizar el código en módulos.
package C20170625;

// Se declara una clase pública llamada While4.
public class While4 {

    // Método principal del programa. Es el punto de entrada cuando se ejecuta.
    public static void main(String[] args) {

        // Se declara una variable entera llamada 'contador' y se inicializa en 0.
        int contador = 0;

        // Bucle while que se ejecuta mientras 'contador' sea menor o igual a 3.
        while (contador <= 3) {

            // Se imprime en consola el número de intento actual.
            System.out.println("Intento: " + contador);

            // Se incrementa el contador en 1 para avanzar al siguiente intento
            // y evitar que el bucle sea infinito.
            contador++;

            // Se declara una variable con el número secreto que se quiere adivinar.
            int numeroSecreto = 7;

            // Se inicializa el número de intentos a 0 para este intento del bucle externo.
            int intentos = 0;

            // Se declara una variable booleana para controlar si se ha adivinado el número.
            boolean adivinar = false;

            // Segundo bucle while: se repite hasta que se adivine el número secreto.
            while (!adivinar) {

                // Se incrementa el número de intentos en 1.
                intentos++;

                // Se genera un número aleatorio entre 1 y 10.
                int miNumero = (int)(Math.random() * 10) + 1;

                // Se imprime el intento actual y el número aleatorio generado.
                System.out.println("Intento: " + intentos + " El número generado es: " + miNumero);

                // Si el número generado coincide con el número secreto...
                if (miNumero == numeroSecreto) {

                    // ...se cambia la variable 'adivinar' a true para salir del bucle.
                    adivinar = true;

                    // Se imprime un mensaje indicando que se adivinó el número,
                    // junto con el número de intentos que tomó.
                    System.out.println("¡Adivinaste en " + intentos + " intentos! El número secreto es " + numeroSecreto);
                }
            }
        }
    }
}

