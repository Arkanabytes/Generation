// ============//
//  JAVASCRIPT //
// ============//
 
// Mostrar Mensaje en consola   / Como un print
console.log("🚀 INICIANDO JAVASCRIPT ");
 
 
// Comentarios
 
// Variables y tipos de datos
 
// una cajita que almacena informacion
 
 
// REGLAS IMPORTANTES !!
// - const = caja sellada  ( no puede cambiar es fija)
// - let = caja normal   ( que puede cambiar)
// - var = caja vieja    (ya no se usa)
 
// Const
 
const nombre = "Alumno1";       // String
const edad = 25;                // Number
const esDevoloper = true;        // Boolean
const ciudad = null;             // nulll - vacio
let telefono;                   // Undefined - "No tiene valor"
 
 
var antiguoNoUsar= "No usar";    // NO SE USAR POR QUE CAUSA BUG EXTRAÑOS XD
 
console.log("===VARIABLE===");
console.log("Nombre :", nombre, "- Tipo: ", typeof nombre );
console.log("Edad: ", edad , " - Tipo: ", typeof edad);
console.log("Eres developer" , esDevoloper, "- Tipo: ", typeof esDevoloper)
 
// Operadores Basico
let suma = 5 + 3       // Suma
let resta = 10 - 4;    // Resta
let multiplicacion = 6 * 7  // Multi
let division = 15 / 3 ; // Division
let modulo = 10 % 3; // Modulo o resto
 
console.log("Suma: ",suma);
console.log("Resta", resta);
console.warn("Multiplicacion", multiplicacion);
console.info("Division: ", division);
 
const nombre2 = "Alumno2";
// Concatenacion
let saludo = "Hola" + nombre2;
let saludoClase = `Hola ${nombre2}, estamos aprendiendo JS` +
                    `Hola ${nombre2}, estamos aprendiendo JS` +
                    `Hola ${nombre2}, estamos aprendiendo JS`;
 
console.log(saludo)
console.log(saludoClase)
 
 
/*
`` backticks   alt + 96
- escribir multiples lineas de codigo
- mas facil concatenar
- incluir variables
*/
 
 
// NUEVA REGLA IMPORTANTE
/*
En JS tiene 2 formas de comparaciones:
 == ( debil) : conviente tipicos automaticamente ( PELIGROSO)
 === ( estricta): compara valor y tipo
*/
 
console.log("\n === COMPARACIONES====")
 
console.log("5 === 5:", 5 === 5);   // true - el mismo numero
console.log("5 === '5'", 5 ==="5");      // false - numero vs texto
console.log("5 !== '5'", 5 !=="5");     // true por que son distintos
 
 
console.log("5 == '5'", 5 == "5")  //  true
console.log("0 == false: ", 0 == false);  // true
console.log("[] == false: ", [] == false )   //true
console.log("0 == []", 0 == [])        // true
console.log("0 == []", "0" == [])
 
 
// condicionales
// simple
//let edades  = 20
if ( edades > 18 ){
    console.log("Es Mayor de Edad");
}else{
    console.log("Es menor de edad")
}
 
 
// else if
let edades  = 10
if ( edades < 18 ){
    console.log("Es menor de edad");
}else if(edades >=  18 && edades < 65){
 console.log("Adulto")
} else{
    console.log("Adulto Mayor")
}
 
// && and   ambas condiciones
// || or   1 o la otra
 
// ternario
let edad2  = 10
let categoria = edad2 >= 18 ? "Adulto": "Menor";
console.log(categoria)
 
// SW
// Switch es ultil para muchas opciones
let nombres = "Ana"
switch(nombres){
    case "Ana":
        console.log("Hola Ana");
        break;
     case "Carlos":
        console.log("Hola Carlos");
        break;
    default:
        console.log("Nombre no encontrado")  
}
 
 
 
// BUCLE
 
console.log("bucles clasico")
 
for(let i = 1; i < 3; i++){
    console.log(`Iteracion ${i}`)
}
 
//while
let contador = 0;
while(contador < 3){
    console.log(`Contador: ${contador}`);
    contador++   //  MUY IMPORTANTE SIN ESTO SERA INFINITOO
}
 
// REGLA IMPORTANTE NUNCA OLVIDES INCREMENTAR TU CONTADOR O EL BUCLE NUNCA TERMINARA
 
 
 
// ARRAY
 
// Crear Array
 
const frutas = ["manzana", "naranja"];
const numero = [1, 2, 3, 4];
const mixto = ["Texto", 42 , true, null];  // Puede tener defirentes tipos
 
 
console.log("Frutas: ", frutas);
console.log("Primer numero: ", numero[0]);  // lois arrays empiezan del incide 0
console.log("Ultimo elemento: ", frutas[frutas.length -1]); // ultimo valor
console.log("Longitud", frutas.length)
 
 
// metodos simples para modificar arrays
 
frutas.push("Uva");     // Agregar elemento Final
frutas.unshift("Kiwi");  //Agregar elemento  Inicio
frutas.pop();            // Eliminar el ultimo
frutas.shift();         // Elimina al inicio
 
console.log("Frutas modificadas: ", frutas);
 
 
// FOR para recorre elementos
console.log("Recorriendo Frutas")