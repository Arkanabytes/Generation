package C20190625;

public class SaludoRefactorizado {

    public void mostrarSaludoRefactorizado(String nombre){
        System.out.println("Hola, "+ nombre);
    }
    public static void main(String[] args) {
        SaludoRefactorizado saludo1 = new SaludoRefactorizado();
        saludo1.mostrarSaludoRefactorizado("Marcela");
    }
}
