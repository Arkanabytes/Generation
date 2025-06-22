package C20180625;

// Se declara una clase pública llamada Bucles.
// En Java, todo el código debe estar dentro de una clase.
public class Bucles {

    // Se define un método estático llamado "sumar" que recibe dos parámetros enteros: num1 y num2.
    // Este método devolverá un número entero (int).
    public static int sumar(int num1, int num2) {

        // Se declara una variable llamada "resultado" que almacena la suma de num1 y num2.
        int resultado = num1 + num2;

        // Se retorna el valor almacenado en "resultado" como resultado del método.
        return resultado;
    }

    // Método principal (main), punto de entrada del programa.
    // Es el primer método que se ejecuta cuando se corre el programa.
    public static void main(String[] args) {

        // Se llama al método "sumar" pasando los valores 5 y 3 como argumentos.
        // El resultado de la suma se guarda en la variable "resultadoSuma".
        int resultadoSuma = sumar(5, 3);

        // Se imprime en pantalla el mensaje "La suma es: " seguido del valor de resultadoSuma.
        System.out.println("La suma es: " + resultadoSuma);
    }
}
