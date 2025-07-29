# **Documentación Educativa – Sistema de MiApp (Versión Básica)**

Este proyecto es una versión **educativa y simplificada** de una API REST con **Spring Boot**, utilizando una base de datos MySQL. Aquí explicamos paso a paso la arquitectura y cada capa (model, repository, service y controller), junto con las configuraciones clave.

---

## **1. ¿Qué es esta aplicación?**

- Es una **API REST** que expone datos de `usuarios`, `productos` y `categorías` a través de endpoints.
- Se basa en el patrón **MVC (Model – View – Controller)**, pero como no tenemos un frontend en esta versión, nuestras "vistas" son directamente las respuestas JSON.
- **Spring Boot** se encarga de gestionar la configuración, el servidor (Tomcat embebido) y la conexión con la base de datos.

---

## **2. Arquitectura de Capas**

En un proyecto Spring Boot, la aplicación se organiza en capas con roles muy claros:

### **2.1 Model (Entidad)**
- Cada clase en `model` **representa una tabla de la base de datos**.
- Ejemplo: la clase `Usuario` representa la tabla `usuarios`.
- **Getters y Setters:**
    - Permiten acceder y modificar los atributos de una clase de forma controlada.
    - Ejemplo: `getNombre()` devuelve el valor del campo `nombre`, y `setNombre("Ana")` lo modifica.
- **Constructor vacío:**
    - Obligatorio para que Hibernate (JPA) pueda instanciar los objetos mediante reflexión.
    - Sin este constructor, la librería no puede mapear filas de la base de datos a objetos Java.

### **2.2 Repository**
- Son interfaces que **gestionan la comunicación directa con la base de datos**.
- Gracias a `JpaRepository`, no tenemos que escribir consultas SQL manuales. Métodos como `findAll()` hacen internamente `SELECT * FROM ...`.
- Ejemplo: `UsuarioRepository` trabaja directamente con la tabla `usuarios`.

### **2.3 Service**
- Contiene la **lógica de negocio**.
- En este proyecto, los servicios llaman al repositorio para obtener datos.
- Ejemplo: `UsuarioService` tiene un método `listarUsuarios()` que usa `usuarioRepository.findAll()`.

### **2.4 Controller**
- **Exponen endpoints REST** que el cliente (navegador o frontend) puede consumir.
- Ejemplo: cuando alguien hace `GET http://localhost:8080/usuarios`, el `UsuarioController` devuelve la lista de usuarios en formato JSON.
- Los controladores reciben peticiones HTTP y responden con datos.

**Flujo de comunicación:**
```mermaid
flowchart TD
    A[Cliente (React / navegador)] --> B[Controller]
    B --> C[Service]
    C --> D[Repository]
    D --> E[(Base de Datos)]
```


---

## **3. Configuración de la Base de Datos**

Archivo `application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/miapp?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC&createDatabaseIfNotExist=true
spring.datasource.username=root
spring.datasource.password=root123

# No permitir que Hibernate cree/actualice tablas automáticamente
spring.jpa.hibernate.ddl-auto=none

# Mostrar consultas SQL en la consola
spring.jpa.show-sql=true

# Ejecutar scripts SQL al iniciar (schema.sql y data.sql)
spring.sql.init.mode=always
```

### **¿Por qué `createDatabaseIfNotExist=true`?**
Esto le dice a MySQL que **cree la base de datos automáticamente si no existe** al conectar con `miapp`.

### **Modo de inicialización (`spring.sql.init.mode`)**
- **always:** Ejecuta `schema.sql` y `data.sql` en cada inicio de la aplicación.
- **never:** No ejecuta los scripts, útil una vez que la BD ya está configurada.

---

## **4. Entidades (Ejemplo con Usuario)**
```java
@Entity
@Table(name = "usuarios")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String nombre;
    private String apellido;
    private int edad;

    public Usuario() {} // Constructor vacío (obligatorio para JPA)

    // Getters y Setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getApellido() { return apellido; }
    public void setApellido(String apellido) { this.apellido = apellido; }
    public int getEdad() { return edad; }
    public void setEdad(int edad) { this.edad = edad; }
}
```

**Nota:** Si el nombre de la clase coincide con la tabla (por ejemplo, `Categoria` vs `categorias`), **no es necesario usar `@Table(name = "categorias")`**, pero se recomienda para evitar errores.

---

## **5. Spring Data JPA y Hibernate**
- **Spring Data JPA:** Proporciona repositorios y elimina el código repetitivo.
- **Hibernate:** Es el motor de persistencia que implementa JPA.
- Relación:
```mermaid
flowchart TD
    A[Tu Código (Entidades, Repositorios)] --> B[JPA API]
    B --> C[Hibernate]
    C --> D[(MySQL)]
```

## **6. Endpoints Disponibles**
- `GET /usuarios` – Devuelve todos los usuarios.
- `GET /productos` – Devuelve todos los productos.
- `GET /categorias` – Devuelve todas las categorías.

Ejemplo con `curl`:
```bash
curl -X GET http://localhost:8080/usuarios
```

---
**Ejercicio:**
> Repite lo mismo para **productos** y **categorías** siguiendo la estructura de `Usuario`.
> Los datos y el schema ya están definidos en los archivos `schema.sql` y `data.sql`.
---

## **7. Spring Boot DevTools (opcional)**
Para reiniciar automáticamente la aplicación al guardar cambios, agrega en `pom.xml`:
```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-devtools</artifactId>
    <scope>runtime</scope>
    <optional>true</optional>
</dependency>
```
Con esto, no tendrás que reiniciar manualmente el servidor, similar a `nodemon` en Node.js.

---

¿Te gustaría que **agregue diagramas simples en ASCII** para ilustrar cómo interactúan las capas (Controller → Service → Repository → BD) y cómo arranca el proyecto (Spring Boot + JPA + Hibernate)?
