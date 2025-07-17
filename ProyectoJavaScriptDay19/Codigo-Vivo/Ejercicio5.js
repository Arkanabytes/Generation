// Ejercicio 5: Objetos
// Crea un objeto "libro" con título, autor, páginas y leído (boolean)
// Crea un método que cambie el estado de "leído"

// Crear el objeto "libro"
const libro = {
  titulo: "Cien años de soledad",
  autor: "Gabriel García Márquez",
  paginas: 471,
  leido: false,

  // Método para cambiar el estado de "leído"
  cambiarEstadoLeido: function() {
    this.leido = !this.leido; // cambia de true a false o viceversa
  }
};

// Ver estado inicial
console.log(libro.leido); // false

// Cambiar estado
libro.cambiarEstadoLeido();

// Ver estado actualizado
console.log(libro.leido); // true
