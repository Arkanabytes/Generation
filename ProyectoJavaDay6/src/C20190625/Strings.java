package C20190625;

public class Strings {
    public static void main(String[] args) {
        // Vamos hacer referencias a los textos de java.lang
        String text = "Hola Mundo";
        System.out.println("Longitud" + text.length());
        System.out.println("Primer caracter" + text.charAt(0));
        System.out.println("Ultimo caracter" + text.charAt(text.length()-1));
        System.out.println("Primer caracter" + text.toUpperCase());
        System.out.println("Longitud" + text.toLowerCase());
        System.out.println("Primer caracter" + text.trim());
        System.out.println("Primer caracter" + text.trim().toLowerCase());
        System.out.println("Primer caracter" + text.trim().toUpperCase());

        System.out.println("Ultimo caracter" + text.charAt(text.length()-1));
        System.out.println("Primer caracter" + text.charAt(0));
    }
}
