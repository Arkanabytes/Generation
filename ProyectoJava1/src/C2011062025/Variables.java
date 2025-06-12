package C2011062025;
// Una variable es un cajita para almacenar informacion
public class Variables {
    /** Tipos de datos en Java **/

    /* -Byte
       -Short
       -Int
       -Long
       -Float
       -Double
       -Chart
       -Boolean
     */
 // Cuando declaramos una variable en Java,primero
    byte numeroPequeno = 127;

    //Creamos una variblae de cada tipo
    static byte edad =10;

    short anioNacimiento = 2005;
    int balanceCuenta= 1000000;
    long PoblacionMundial = 8005176000L; //casting
    float estatura = 1.80F;
    double pi = 3.141592;

    char inicialNombre= 'Ñ';

    // bolean, almacena valores de verdadero o falso
    boolean esMayorDeEdad= false;

    //Plano es un nombre que se le define un objeto
    /*** Datos de tipo Objeto***/
    Integer enteroDeTipoObjeto = 480;
    String cadenaDeTexto = "Hola mundo";

    /*** Tipps de datos especiales en java**/
    //define un conjunto de constantes
    enum DiasDeLaSemana {
        Lunes,
        Martes,
        Miercoles,
        Jueves,
        Viernes
    }

    //Arrays Estatico
    char[] arregloDeCaracteres= {'H','O','L','A'};
    //NULL
    String valorNulo = null;

    /*** CONSTANTES EN JAVA ***/
    //final -> Palabra reservada que indica que es una constante

    int constanteEnero =20;

    /*** Variable de clase estatica***/
    //palabra resevada que indica el tipo de dato accesibles
    static String saludo = "Hola, como estas";


}
