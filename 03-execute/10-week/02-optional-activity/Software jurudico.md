# INFORME INGENIERIA INVERSA

## Aprendiz
Ana María Martínez Castillo  
C.C. 1004491830

## Instructor
Jesus Ariel Gonzales Bonilla

---

# SERVICIO NACIONAL DE APRENDIZAJE
## CENTRO DE LA INDUSTRIA, LA EMPRESA Y LOS SERVICIOS
### ANÁLISIS Y DESARROLLO DE SOFTWARE (3239137)
### PROYECTO ETAPA ELECTIVA
### NEIVA
### 2026

---

# 1. Lógica del negocio

El sistema Lawyer Manager es una plataforma web orientada a la gestión jurídica para despachos de abogados. Su lógica de negocio se basa en la administración de clientes, procesos jurídicos, tareas operativas, vencimientos legales y validaciones de conflictos de interés, permitiendo organizar y controlar las actividades del despacho mediante módulos especializados.

## 1.1 Módulo de autenticación
Permite el acceso seguro al sistema mediante correo electrónico y contraseña. Su función principal es validar las credenciales de los usuarios y controlar el acceso a la plataforma según permisos y tenants asociados.

## 1.2 Módulo de Inicio
Muestra información operativa sobre tareas abiertas, expedientes recientes, vencimientos, alertas y prioridades del día. El módulo permite a los usuarios visualizar rápidamente el estado general de las actividades jurídicas del despacho.

## 1.3 Módulo de Clientes
Permite registrar, consultar y administrar la información relacionada con personas o empresas vinculadas a procesos legales.

## 1.4 Módulo de Procesos
Permite administrar expedientes jurídicos asociados a clientes. Su lógica de negocio se enfoca en registrar información relacionada con el número de proceso, tipo de trámite, juzgado, estado y seguimiento jurídico. Cada proceso puede tener tareas, alertas y vencimientos asociados.

## 1.5 Módulo de Consultas
Facilita la búsqueda y consulta de información jurídica dentro del sistema. Permite acceder rápidamente a expedientes, tareas y registros operativos mediante filtros y mecanismos de búsqueda.

## 1.6 Módulo de Tareas
Administra las actividades operativas relacionadas con los procesos jurídicos. Las tareas se organizan visualmente mediante un tablero, dividido por estados como pendiente, en progreso, bloqueada, revisada y terminada.

## 1.7 Módulo de Términos
Controla fechas límite, vencimientos y compromisos jurídicos asociados a procesos legales. Su función principal es alertar sobre actividades próximas a vencer y apoyar el cumplimiento oportuno de obligaciones jurídicas.

## 1.8 Módulo de Conflictos
Permite validar posibles conflictos de interés dentro del despacho jurídico, almacena historial de revisiones para garantizar trazabilidad y control operativo.

---

# 2. Requisitos Funcionales (RF)

- RF01: El sistema debe permitir el inicio de sesión mediante correo electrónico y contraseña.
- RF02: El sistema debe validar las credenciales ingresadas y mostrar mensajes de error cuando sean incorrectas.
- RF03: El sistema debe permitir registrar, consultar y administrar clientes.
- RF04: El sistema debe permitir crear y administrar procesos jurídicos.
- RF05: El sistema debe permitir registrar y administrar tareas.
- RF06: El sistema debe mostrar las tareas organizadas por columnas según su estado.
- RF07: El sistema debe permitir controlar fechas límite y vencimientos.
- RF08: El sistema debe permitir realizar búsquedas y consultas de información jurídica.

---

# 3. Requisitos No Funcionales (RNF)

- RNF01: El sistema debe garantizar acceso únicamente a usuarios autenticados.
- RNF02: La interfaz debe ser intuitiva y facilitar la navegación entre módulos.
- RNF03: El sistema debe adaptarse correctamente a diferentes resoluciones de pantalla.
- RNF04: El sistema debe soportar múltiples usuarios y múltiples despachos jurídicos.
- RNF05: El sistema debe validar campos obligatorios antes de almacenar información.

---

# 4. Historias de Usuario (HU)

- HU01: Como usuario quiero iniciar sesión en el sistema para acceder a las funcionalidades jurídicas disponibles.
- HU02: Como administrador quiero registrar nuevos clientes para almacenar información jurídica del despacho.
- HU04: Como usuario quiero crear tareas para organizar actividades relacionadas con los procesos jurídicos.
- HU05: Como usuario quiero mover tareas entre columnas para actualizar el estado de las actividades.
- HU06: Como usuario quiero consultar información jurídica para acceder rápidamente a expedientes y tareas.
- HU07: Como abogado quiero visualizar vencimientos y fechas límite para evitar incumplimientos legales.

---

# 5. Identificación de errores

| Módulo | Formulario | Error | Impacto |
|---|---|---|---|
| Autenticación | https://vpnt3lgv-5173.use2.devtunnels.ms/login | Se evidencio que el mensaje de error no especifica cuál campo presenta inconsistencias. | Medio |
| Autenticación | https://vpnt3lgv-5173.use2.devtunnels.ms/login | Se evidenció que se presenta información adicional en el módulo de autenticación que resulta irrelevante para el usuario final. | Bajo |
| Inicio |  | Se evidencio que hay una sobre carga visual de información. | Medio |
| Clientes | https://vpnt3lgv-5173.use2.devtunnels.ms/app/clientes/nuevo | Se evidencia que no es posible registrar nuevos clientes. | Alto |
| Procesos | https://vpnt3lgv-5173.use2.devtunnels.ms/app/procesos/nuevo | Se evidencia que no permite registrar nuevos procesos jurídicos. | Alto |
| Consultas |  | Al seleccionar el módulo “Consulta”, el sistema también mantiene resaltado visualmente el módulo “Procesos”. | Medio |
| Tareas | https://vpnt3lgv-5173.use2.devtunnels.ms/app/tareas/nueva | Se evidencia que el formulario no se ajusta correctamente a la resolución de pantalla. | Medio |
| Tareas | https://vpnt3lgv-5173.use2.devtunnels.ms/app/tareas/nueva | No permite registrar la fecha de vencimiento. | Alto |
| Tareas | https://vpnt3lgv-5173.use2.devtunnels.ms/app/tareas/nueva | El botón “Actualizar” se encuentra deshabilitado. | Medio |
| Términos |  | Se evidencio que hay errores ortográficos. | Bajo |