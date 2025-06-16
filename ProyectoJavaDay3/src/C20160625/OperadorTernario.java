package C20160625;

public class OperadorTernario {
    public static void main(String[] args) {
        int edad = 17;

        // Uso del operador ternario para evaluar si es mayor de edad
        String estado = (edad >= 18) ? "Es mayor de edad" : "No es mayor de edad";

        // Mostrar el resultado
        System.out.println(estado);
    }
}