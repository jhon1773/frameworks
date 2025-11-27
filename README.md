## Workflows en el Proyecto

En este proyecto, los workflows automatizan tareas clave para el desarrollo y mantenimiento de los frameworks y servicios incluidos. Los workflows están diseñados para:

- Instalar dependencias de Node.js y TypeScript.
- Ejecutar pruebas unitarias sobre los módulos de `src/`, como los servicios, repositorios y adaptadores.
- Validar la calidad del código antes de aceptar cambios (pull requests).
- Facilitar el despliegue automático de los servicios y APIs desarrollados, si se configura.

### Ejemplo de workflow para este proyecto (GitHub Actions)

```yaml
name: CI para Frameworks y Servicios
on: [push, pull_request]
jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Instalar dependencias
        run: npm install
      - name: Compilar TypeScript
        run: npx tsc
      - name: Ejecutar pruebas unitarias
        run: npm test
```

### Beneficios en este proyecto
- Garantiza que los cambios en los adaptadores, servicios y repositorios funcionen correctamente.
- Automatiza la validación y despliegue de los frameworks desarrollados.
- Mantiene la calidad y estabilidad del código fuente.

### Ubicación y personalización
Los workflows se encuentran en `.github/workflows/` y pueden adaptarse para incluir pasos de despliegue, análisis de seguridad, o integración con otros servicios según las necesidades del proyecto.
# PDS006 Frameworks 20252

Este proyecto es una colección de frameworks y utilidades desarrolladas para la gestión y manipulación de dispositivos médicos y computadoras, orientado a prácticas de DevOps y arquitectura de software moderna.

## Estructura del Proyecto

- **architecture.md**: Documentación sobre la arquitectura del proyecto.
- **frameworks/**: Contiene implementaciones específicas de frameworks.
- **src/**: Código fuente principal del proyecto.
  - **adapter/**: Adaptadores que conectan el sistema con APIs externas, repositorios y otros servicios. Incluye subcarpetas para diferentes tipos de adaptadores:
    - **api/**: Adaptadores para controladores y helpers de APIs.
    - **photo/**: Repositorios para la gestión de fotos (por ejemplo, en el sistema de archivos).
    - **repository/**: Implementaciones de repositorios, como los que funcionan en memoria para pruebas.
  - **core/**: Contiene la lógica de negocio y las entidades principales del proyecto. Sus subcarpetas incluyen:
    - **constants.ts**: Archivo con constantes globales usadas en el proyecto.
    - **domain/**: Define las entidades de dominio, como computadoras y dispositivos médicos.
    - **dto/**: Objetos de transferencia de datos (DTOs) para estructurar solicitudes y respuestas.
    - **repository/**: Interfaces y repositorios para acceder y manipular datos de dispositivos y fotos.
    - **service/**: Servicios que gestionan la lógica de negocio relacionada con computadoras, dispositivos y utilidades.
    - **utils/**: Funciones y utilidades generales, como manejo de errores y validaciones.
  - **index.ts**: Punto de entrada principal del módulo.
  - **index.test.ts**: Pruebas unitarias para el módulo principal.

## Tecnologías Utilizadas

- **TypeScript**: Lenguaje principal para el desarrollo.
- **Node.js**: Entorno de ejecución.
- **Elysia**: Framework para la creación de APIs.

## Instalación

1. Clona el repositorio:
   ```powershell
   git clone <URL-del-repositorio>
   ```
2. Instala las dependencias:
   ```powershell
   cd frameworks/pds006-frameworks-20252
   npm install
   ```

## Ejecución de Pruebas

Para ejecutar las pruebas unitarias:
```powershell
npm test
```

## Contribución

Las contribuciones son bienvenidas. Por favor, abre un issue o envía un pull request para sugerencias o mejoras.

## CI/CD integrado en el proyecto

Este proyecto ya cuenta con integración de CI/CD mediante workflows automatizados. Cada vez que se realiza un push o pull request, se ejecutan automáticamente pruebas unitarias, validaciones y, si está configurado, el despliegue de los servicios y frameworks desarrollados.

La configuración de CI/CD se encuentra en la carpeta `.github/workflows/` y utiliza herramientas como GitHub Actions para garantizar la calidad y el despliegue continuo del código.

De esta forma, todos los cambios pasan por procesos automáticos que aseguran la estabilidad y funcionamiento correcto del proyecto antes de ser integrados o desplegados.

## Licencia

Este proyecto está bajo la licencia MIT.

La licencia MIT es una licencia de software permisiva que permite usar, copiar, modificar, fusionar, publicar, distribuir, sublicenciar y/o vender copias del software. También permite que otros lo utilicen en proyectos personales o comerciales, siempre y cuando se incluya el aviso de copyright original y la declaración de la licencia. Es ampliamente utilizada por su simplicidad y flexibilidad.
