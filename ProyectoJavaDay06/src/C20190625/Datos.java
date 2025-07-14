package C20190625;

public class Datos {
    public static int sumar(int valor1, int valor2){
        return valor1 + valor2;
    }

    public static void main(String[] args) {
        int resultado = sumar(5,3);
        System.out.println("La suma es : " + resultado);
    }
}
