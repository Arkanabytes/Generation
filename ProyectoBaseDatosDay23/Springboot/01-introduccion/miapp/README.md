# Mi App - Introducción a Spring Boot 🍃

## 📋 Descripción del Proyecto

"Mi App" es una aplicación introductoria desarrollada con Spring Boot como parte del Day 23 del programa de desarrollo. Este proyecto está diseñado para aprender los conceptos fundamentales de Spring Boot, incluyendo la configuración automática, la inyección de dependencias y la creación de aplicaciones web modernas con Java.

## 🎯 Objetivos de Aprendizaje

- Comprender los fundamentos de Spring Boot
- Implementar configuración automática (Auto-configuration)
- Crear controladores REST básicos
- Manejar dependencias con Spring Boot Starter
- Desarrollar una aplicación web funcional
- Aplicar principios de desarrollo con Spring Framework

## 🛠️ Tecnologías Utilizadas

- **Java** 17+ 
- **Spring Boot** 3.x
- **Spring Web** - Para crear aplicaciones web y APIs REST
- **Spring Boot DevTools** - Para desarrollo con recarga automática
- **Maven** - Gestión de dependencias y construcción del proyecto
- **Embedded Tomcat** - Servidor web integrado

## 📁 Estructura del Proyecto

```
miapp/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── example/
│   │   │           └── miapp/
│   │   │               ├── MiappApplication.java
│   │   │               ├── controller/
│   │   │               │   ├── HomeController.java
│   │   │               │   └── ApiController.java
│   │   │               ├── model/
│   │   │               │   └── Usuario.java
│   │   │               └── service/
│   │   │                   └── UsuarioService.java
│   │   └── resources/
│   │       ├── application.properties
│   │       ├── static/
│   │       └── templates/
│   └── test/
│       └── java/
├── target/
├── pom.xml
└── README.md
```

## 🚀 Instalación y Configuración

### Prerrequisitos

- **Java Development Kit (JDK)** 17 o superior
- **Maven** 3.6+ (o usar Maven Wrapper incluido)
- **IDE** recomendado: IntelliJ IDEA, Eclipse, o VS Code con extensión Java

### Pasos de Instalación

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/Arkanabytes/Generation.git
   cd Generation/ProyectoBaseDatosDay23/Springboot/01-introduccion/miapp
   ```

2. **Compilar el proyecto:**
   ```bash
   mvn clean compile
   ```

3. **Ejecutar la aplicación:**
   ```bash
   mvn spring-boot:run
   ```

4. **Acceder a la aplicación:**
   - URL: `http://localhost:8080`
   - Puerto por defecto: 8080

### Usando Maven Wrapper (Alternativa)

```bash
# En Windows
./mvnw.cmd spring-boot:run

# En macOS/Linux
./mvnw spring-boot:run
```

## 💻 Uso de la Aplicación

### Endpoints Disponibles

#### 🏠 Endpoints Web
- `GET /` - Página de inicio
- `GET /home` - Página principal
- `GET /about` - Información sobre la aplicación

#### 🔌 Endpoints API REST
- `GET /api/hello` - Saludo básico
- `GET /api/status` - Estado de la aplicación
- `GET /api/users` - Lista de usuarios (ejemplo)
- `POST /api/users` - Crear nuevo usuario

### Ejemplos de Uso

#### Saludo Básico
```bash
curl http://localhost:8080/api/hello
```
**Respuesta:**
```json
{
  "message": "¡Hola desde Spring Boot!",
  "timestamp": "2024-01-15T10:30:00"
}
```

#### Estado de la Aplicación
```bash
curl http://localhost:8080/api/status
```
**Respuesta:**
```json
{
  "status": "OK",
  "application": "Mi App",
  "version": "1.0.0"
}
```

## 📝 Código de Ejemplo

### Controlador Principal

```java
@RestController
@RequestMapping("/api")
public class ApiController {
    
    @GetMapping("/hello")
    public Map<String, Object> hello() {
        Map<String, Object> response = new HashMap<>();
        response.put("message", "¡Hola desde Spring Boot!");
        response.put("timestamp", LocalDateTime.now());
        return response;
    }
    
    @GetMapping("/status")
    public Map<String, String> status() {
        Map<String, String> response = new HashMap<>();
        response.put("status", "OK");
        response.put("application", "Mi App");
        response.put("version", "1.0.0");
        return response;
    }
}
```

### Clase Principal de la Aplicación

```java
@SpringBootApplication
public class MiappApplication {
    public static void main(String[] args) {
        SpringApplication.run(MiappApplication.class, args);
    }
}
```

### Configuración (application.properties)

```properties
# Configuración del servidor
server.port=8080
server.servlet.context-path=/

# Configuración de la aplicación
spring.application.name=miapp
logging.level.com.example.miapp=DEBUG

# Configuración de desarrollo
spring.devtools.restart.enabled=true
```

## 🧪 Pruebas

### Ejecutar Pruebas Unitarias

```bash
mvn test
```

### Ejecutar Pruebas de Integración

```bash
mvn verify
```

### Ejemplo de Prueba

```java
@SpringBootTest
@AutoConfigureTestRestTemplate
class MiappApplicationTests {

    @Autowired
    private TestRestTemplate restTemplate;

    @Test
    void contextLoads() {
        // Verificar que el contexto de Spring se carga correctamente
    }

    @Test
    void testHelloEndpoint() {
        String response = restTemplate.getForObject("/api/hello", String.class);
        assertThat(response).contains("Hola desde Spring Boot");
    }
}
```

## 📦 Construcción y Despliegue

### Generar JAR Ejecutable

```bash
mvn clean package
```

El JAR se genera en: `target/miapp-1.0.0.jar`

### Ejecutar JAR

```bash
java -jar target/miapp-1.0.0.jar
```

### Perfil de Producción

```bash
java -jar target/miapp-1.0.0.jar --spring.profiles.active=prod
```

## 🔧 Configuración Avanzada

### Variables de Entorno

```bash
export SERVER_PORT=9090
export SPRING_PROFILES_ACTIVE=development
java -jar miapp.jar
```

### Configuración por Perfiles

#### application-dev.properties
```properties
server.port=8080
logging.level.root=DEBUG
```

#### application-prod.properties
```properties
server.port=80
logging.level.root=WARN
```

## 📖 Conceptos de Spring Boot Implementados

### 1. **Auto-Configuration**
Spring Boot configura automáticamente componentes basados en las dependencias del classpath.

### 2. **Dependency Injection**
Uso de `@Autowired` y `@Component` para inyección de dependencias.

### 3. **Spring MVC**
Controladores REST con `@RestController` y `@RequestMapping`.

### 4. **Embedded Server**
Servidor Tomcat integrado para ejecutar la aplicación.

### 5. **DevTools**
Herramientas de desarrollo para recarga automática.

## 🎓 Recursos de Aprendizaje

- [Documentación Oficial de Spring Boot](https://docs.spring.io/spring-boot/)
- [Spring Boot Guides](https://spring.io/guides)
- [Baeldung Spring Boot Tutorials](https://www.baeldung.com/spring-boot)

## 🤝 Contribuciones

Este proyecto es parte de un ejercicio educativo. Para contribuir:

1. Fork del repositorio
2. Crear una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit de tus cambios (`git commit -am 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Crear un Pull Request

## 🐛 Resolución de Problemas

### Puerto en Uso
```bash
# Encontrar proceso usando el puerto 8080
netstat -tulpn | grep 8080
# Matar el proceso
kill -9 <PID>
```

### Problemas de Compilación
```bash
# Limpiar y reinstalar dependencias
mvn clean install -U
```

### Verificar Versión de Java
```bash
java -version
mvn -version
```

## 📋 Checklist de Funcionalidades

- [x] Configuración básica de Spring Boot
- [x] Controlador REST funcional
- [x] Endpoints de ejemplo
- [x] Configuración con application.properties
- [x] Manejo de errores básico
- [ ] Integración con base de datos
- [ ] Autenticación y autorización
- [ ] Pruebas unitarias completas

## 📄 Licencia

Este proyecto es desarrollado con fines educativos como parte del programa Generation.

## 📞 Contacto

- **Repository**: [Arkanabytes/Generation](https://github.com/Arkanabytes/Generation)
- **Branch**: Pseint
- **Path**: ProyectoBaseDatosDay23/Springboot/01-introduccion/miapp

---

**Desarrollado durante**: Day 23 - Introducción a Spring Boot  
**Última Actualización**: Julio 2025  
**Estado del Proyecto**: ✅ Funcional
