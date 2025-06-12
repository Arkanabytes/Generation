package C20120625;

import java.util.Scanner;

public class OperadoresAsignacion { // Aca se define una clase
    public static void main(String[] args) { //Aca se define un scope local o funcion
        // Operadores de asignacion//
        /*
        = -> asignacion
        += -> suma el valor y asigna el resultado
        -= ->resta el valor y asigna el resultado
        *= -> multiplica por el valor y asigna el resultado
        /= -> Divide entre otro valor y asigna el resultado
        ++ -> Incremento, suma 1 al valor de la variable
        -- -> Decrementa menos 1 al valor de la variable
         */
        //Variables a traves de consola
        Scanner teclado = new Scanner(System.in );

        //Pedimos el primero numero
        System.out.println("Indica el primero numero");
        int numeroUno = teclado.nextInt();

        //Pedimos el segundo numero
        System.out.println("Indica el segundo numero");
        int numeroDos = teclado.nextInt();

        //Imprimos ambos numeros
        System.out.println( "El primer numero es: "+ numeroUno + "y" + numeroDos);

        // Realizam las distintas asignaciones 5Y 7
        System.out.println(numeroUno += numeroUno);
        System.out.println(numeroUno -= numeroDos);
        System.out.println(numeroUno *= numeroDos);
        System.out.println(numeroUno /= numeroDos);

        System.out.println("Ahora el numero equivale a: "+ numeroUno);

        /** Incremento y decremento **/

        System.out.println("Al realizar un preincremento, numero equivale"+ ++numeroUno);
        System.out.println("Al realizar un posincremento, numero equivale"+ numeroUno);
        System.out.println(" Al realizar un predecremento, numeroDos equivale a"+ --numeroDos );
        System.out.println("Al realizar un posincremento, numero equivale"+ numeroDos--);

    }
}
