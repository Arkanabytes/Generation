package C20240625;

public class Perro {

        private String nombre;    // el this.nombre a esta variable
        private int edad;
        private String raza;

        // Setter para nombre
        public void setNombre(String nombre) {
            this.nombre = nombre;
        }

        //Setter para Raza
        public void setEdad(int edad) {
            this.edad = edad;
        }

        //Setter para edad
        public void setRaza(String raza) {
            this.raza = raza;
        }

        //Metodo para imprimir
        // Metodo comun
        // Void no necesita devolver algo especificamente
        public void imprimirImformacion() {
            System.out.println("Nombre: " + nombre + "\nEdad: " + edad + "\nRaza: " + raza);
        }

        public void ladrar() {
            System.out.println("Guau!");
        }

        public static void main(String[] args) {
            Perro perro = new Perro(); // Intanciar: Comunicacion
            perro.setNombre("Firulais");
            perro.setEdad(10);
            perro.setRaza("Pitbull");

            perro.imprimirImformacion(); // llamamos los metodos de la misma clase
            perro.ladrar();
        }
    }