import java.util.HashMap;
import java.util.HashSet;
import java.util.ArrayList;
import java.lang.String;
public class EjercicioArray {
    public static void main(String[] args) {
        // 1. ArrayList para almacenar nombres de personajes
        ArrayList<String> personajes = new ArrayList<>();
        personajes.add("Eleven");
        personajes.add("Mike");
        personajes.add("Dustin");
        personajes.add("Lucas");
        personajes.add("Max");

        // ACTIVIDAD:
        personajes.add("Spiderman"); // Se agregó un nuevo personaje a ArrayList
        personajes.remove("Dustin");
        System.out.println("Se elimina a Dustin: " + personajes);


        // 2. HashSet para almacenar habilidades únicas
        HashSet<String> habilidades = new HashSet<>();
        habilidades.add("Telequinesis");
        habilidades.add("Liderazgo");
        habilidades.add("Inteligencia");
        habilidades.add("Habilidad con la honda");
        habilidades.add("Patinaje");

        boolean contieneHabilidad = habilidades.contains("Envidia");
        System.out.println("¿Es una habilidad envidia?: " + contieneHabilidad);
        System.out.println("¿Tiene la habilidad 'Liderazgo'?: " + habilidades.contains("Liderazgo"));



        // 3. HashMap para asociar personajes con su habilidad principal
        HashMap<String, String> personajeHabilidad = new HashMap<>();
        personajeHabilidad.put("Eleven", "Telequinesis");
        personajeHabilidad.put("Mike", "Liderazgo");
        personajeHabilidad.put("Dustin", "Inteligencia");
        personajeHabilidad.put("Lucas", "Habilidad con la honda");
        personajeHabilidad.put("Max", "Patinaje");

        // ACTIVIDAD:
        personajeHabilidad.put("Spiderman", "Aracnido trepa muros"); // Se agregó un nuevo personaje al HashMap
        personajeHabilidad.remove("Dustin");
        System.out.println("Se elimina a Dustin de HashMap: " + personajeHabilidad);

        // Buscar habilidad de Max
        String habilidadMax = personajeHabilidad.get("Max");
        System.out.println("Habilidad de Max: " + habilidadMax);


        // Mostrar información inicial
        System.out.println("\nPersonajes: " + personajes);
        System.out.println("Habilidades únicas: " + habilidades);
        System.out.println("Personajes con sus habilidades: " + personajeHabilidad);


    }
}
