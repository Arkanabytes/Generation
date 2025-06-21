public class MetodoConStatic {
    // Pertenecen a la clase, no al objeto.
    // Se pueden llamar directamente usando el nombre de la clase sin necesidad de crear una instancia (objeto).
    // Se usan para utilidades generales, cálculos u operaciones que no dependen de datos específicos de un objeto.
    public static int cuadrado(int x) {
        return x * x;
    }

    public static void main(String[] args) {
        // Puedo llamarlo así sin crear objeto
        int resultado = MetodoConStatic.cuadrado(5);
        System.out.println(resultado);
    }

}
