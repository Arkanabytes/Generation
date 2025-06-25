package C20240625;

public class Vehiculo {

        String tipo;
        int ruedas;
        String color;

        public void avanzar(){
            System.out.println("Avanzando");
        }
    }

    class Auto{

        public static void main(String[] args) {
            Vehiculo vehiculo = new Vehiculo(); //Instancia para comunicarme con mi Clase Vehiculo

            vehiculo.tipo = "auto";
            vehiculo.ruedas = 4;
            vehiculo.color = "rojo";

            System.out.println("Tipo de vehiculo: " + vehiculo.tipo );
            System.out.println("Ruedas del vehiculo: " + vehiculo.ruedas );
            System.out.println("Color del vehiculo: " + vehiculo.color );
            vehiculo.avanzar();
        }
}

