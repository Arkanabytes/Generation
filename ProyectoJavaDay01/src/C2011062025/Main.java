package C2011062025;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        //creamos una instancia de las clase de Variables-> esta instancia ocupa un espacio en memoria
        Variables variables = new Variables();
        Scanner miScanner = new Scanner(System.in);
        //instanciar un objeto equivalente o asignarle un espacio en memoria
        // esto sucede al crear
        System.out.println("Hola,mi edad es"+Variables.edad);
        System.out.println(Variables.saludo);
        Operadores operadores = new Operadores();

        System.out.println("Desde aca comienza");
        System.out.println("El resultado es ->" + operadores.resultadoSuma);
        System.out.println("El resultado es ->" + operadores.resultadoResta);
        System.out.println("El resultado es ->" + operadores.resultadoMultiplicacion);
        System.out.println("El resultado es ->" + operadores.resultadoDivision);
        System.out.println("El resultado es ->" + operadores.restoDivision);
    }

}
