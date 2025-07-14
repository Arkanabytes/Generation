package C20190625;

public class Strings {
    public static void main(String[] args) {
        // Vamos hacer referencias a los textos de java.lang
        String text = "Hola Mundo";

        System.out.println("Longitud: " + texto.length());
        System.out.println("Primer carácter: " + texto.charAt(0));
        System.out.println("Subcadena (0 a 4): " + texto.substring(0, 4));
        System.out.println("¿Contiene 'Mundo'? " + texto.indexOf("Mundo"));
        System.out.println("Concatenado: " + texto.concat(" desde Java"));
        System.out.println("¿Es igual a 'hola mundo'? " + texto.equals("hola mundo"));
        System.out.println("Mayúsculas: " + texto.toUpperCase());
        System.out.println("Minúsculas: " + texto.toLowerCase());
    }
}
