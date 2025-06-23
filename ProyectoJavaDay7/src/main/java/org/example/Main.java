// Array

package semana5.array;

public class Array {

    public static void main(String[] args) {
        // DECLARACION DE UN ARRAY ES FIJA
        // UN ARRAY TIENE QUE USAR []
        // sintaxis : tipo[] nombre;
        int[] numeros = new int[5];

        numeros[0] = 10;
        numeros[1] = 20;
        numeros[2] = 30;
        numeros[3] = 40;
        numeros[4] = 50;

        System.out.println(numeros[0]); // va imprimir el valor de la variable numero en la posicion [0] que seria 10
        System.out.println(numeros[1]);
        System.out.println(numeros.length); // imprimira la longitud del arreglo que es 5

        System.out.println("\nEjemplo Arreglo con For");

        for (int i = 0; i < numeros.length; i++) {
            System.out.println("Indice " + i + " : " + numeros[i]);
        }

        String[] frutas = {"Manzana", "Pera", "Uva"}; // Longitud 0 1 2  = 3

        System.out.println("\nFrutas: ");
        // Basicamente diremos que iremos elemento por elemento
        for (String fruta : frutas) {
            System.out.print(fruta + " ");
         //    System.out.println(frutas);
            // NO imprimir directamente el arreglo, nisiera dentro del for each
            // [Ljava.lang.String;@52cc8049  <--- se ve asi
        }
        // {"Manzana", "Pera", "Uva"}
        // luego del for each es : Manzana Pera Uva

        // Por que no usamos esto asi
        // Esta técnica no es tan limpia, pero funciona si por alguna razón necesitas el estilo for-each y el índice.
 /*       int index = 0;
        for (String fruta : frutas) {
            if (fruta.equals("Manzana")) {
                System.out.println("En el índice: " + index);
            }
            index++;
        }
        */

        // Arreglos con Boleanos

        boolean[] respuestas = new boolean[5]; // Por defecto en false
        respuestas[0] = true;
        respuestas[4] = true;
        
        System.out.println("\nRespuestas:");
        for (boolean respuesta : respuestas) {
            System.out.println("Valor: " + respuesta);
        }

        for( int i = 0; i < respuestas.length; i++){
            if(respuestas[i]){
                System.out.println("La respuesta " + i + " es verdadera");
            }else{
                System.out.println("La respuesta " + i + " es falso");
            }
        }

        

    }
}
