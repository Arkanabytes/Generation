package C20190625;

public class Saludo {
    public void mostrarSaludoJuan(){
        System.out.println("Hola, Juan");
    }
    public void mostrarSaludoMaria(){
        System.out.println("Hola, Maria");
    }
    public void mostrarSaludo(String nombre) {
        System.out.println("Hola, " + nombre);
    }

    public static void main(String[] args) {
        Saludo saludo1 = new Saludo();
        saludo1.mostrarSaludoJuan();
        saludo1.mostrarSaludoMaria();

        saludo1.mostrarSaludo("c20");
    }
}
