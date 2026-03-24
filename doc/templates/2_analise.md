# Análise: Requirimentos do sistema

## Descrición xeral
A aplicación chamada "Kartmania" é unha aplicación que xorde da necesidade de solucionar a falta de automatización no karting.
O dono pediu unha aplicación para facilitar procesos, xa que os seus empregados perdían moito tempo facendo chamadas ou organizando 
os torneos do karting.

O dono tamén pensa que perde o achegamento cos clientes habituais e cos futuros novos clientes,
xa que na actualidade a forma máis fácil e habitual de contactar é a través de Internet.
Un sitio web permite contactar e realizar operacións de maneira directa e con información clara,
polo que ao dono lle interesa ter un sistema onde os seus clientes poidan inscribirse nos torneos que organiza o 
karting para posteriormente seren aceptados polos seus empregados.

Tamén precisa dun sistema de reservas de karts no que os distintos karts cos que conta o recinto poidan ser reservados por 
clientes que estean rexistrados na aplicación ou non (anónimos), dependendo da dispoñibilidade dos horarios e dos karts.

Para o karting é moi importante que os clientes saiban cando é a súa reserva ou cando participarán nun torneo. 
Por iso, ao cliente asignaráselle no seu Google Calendar o día da súa visita ao karting para que o teña como recordatorio.

Os empregados poderán enviar correos electrónicos e administrar a participación dos clientes nos torneos a 
través dunha interface amigable e personalizada.

Os administradores poderán ter o control total da xestión do karting, desde a xestión dos empregados ata a dos clientes, 
así como o envío de correos electrónicos.

A aplicación estará desenvolvida utilizando Ruby on Rails como framework principal. Para a xestión da base de datos, empregará PostgreSQL, unha solución recoñecida pola súa fiabilidade e compatibilidade co framework.
Ademais, contarase co soporte de SendGrid para o envío eficiente e seguro de correos electrónicos. Con Ruby on Rails o mais xeitoso e utilizar un modelo-vista-controlador (MVC),
xa que o framework ofrece moita facilidade para traballar baixo esta arquitectura.


### Pasos a seguir durante o desarrollo

|nº|Titulo|descripción|
|--|-------|-----------|
|1|Montaxe do entorno|Montaxe e probas do entorno base da apricación para comporbar o seu funcionamento|
|2|Creación da web|Neste apartado crearase a web estatica para os visitantes do sitio web|
|3|Creación dos modelos|Creación dos modelos que seran implementados na base de datos|
|4|Implementación dos administradores|Creación das vistas principais dos administradores e funcións basicas|
|5|Implementación de clientes y empregados|Creación das vistas principais dos clientes e empregados, e funcións basicas de cada un|
|6|Implementación sistema de reservas|Creación do sistema de reservas de karts por parte de clientes registrados y anónimos|
|7|Implementación sistema de correos|Implementación de sistema de correos por parte de los empleados y administradores|
|8|Implementación de api Google Calendar|Implementación de la api de google calendar para marcar el día de la visita del cliente|
|9|Estilización de la aplicación|Aplicación de estilos a las distintas vistas|
|10|Despliegue de la aplicación|Despliegue de la aplicación a la internet y prueba de la aplicación|

## Funcionalidades

|nº|Titulo|descripción|
|--|-------|-----------|
|1|Gestión de usuarios|Rexistro, autenticación, Log in, edición y eliminación de perfil|
|2|Gestión de karts|Creación, edición, eliminación y signación a reservas de karts|
|3|Axendado de reserva|Sistema de reservas para todos os clientes(rexistrados ou anónimos)|
|4|Envío de correos|Funcionalidad de envío de correos de recordatorios para os clientes e empregados|
|5|Api Google Calendar|Asignación de recordatorio de reservas no google calendar do cliente|
|6|Sistema de rexistro|Aplicación dun sistema de rexistro para novos cliente|
|7|Sistema de filtrado|As vistas de administración teran un sistema de filtrado|
|8|Apuntamento a torneos|Los usuarios se podrán enlistar en un torneo, para ser aceptados como participantes|

## Tipos de usuarios

A aplicación dispón de varios usuarios que acceden ás distintas vistas en función dos permisos asignados.

- Administadores (teñen o poder de realizar calquera función)
- Empregados (poden enviar mails, organizar os torneos, dar de baixa ou alta novos clientes, gardar os resultados dun torneo)
- Cliente rexistrado (Pode realizar reservas de karts e pode enlistarse nos torneos)
- Clientes anónimos (Pode realizar reservas de karts sen estar rexistrado na aplicación)

## Normativa

### Nivel mundial

- **ISO/IEC 27001**
  - Estándar internacional de seguridad de la información.
  - Recomendado si se gestionan datos sensibles.

- **ISO/IEC 27701**
  - Extensión de ISO 27001 para privacidad y protección de datos.

- **OWASP Top 10**
  - Guía internacional sobre vulnerabilidades de seguridad web.
  - No es una ley, pero es el estándar de facto en seguridad.

- **Convenio de Budapest sobre ciberdelincuencia**
  - Marco internacional sobre delitos informáticos.


### Unión Europea (obligatorias en España)

- **RGPD (Reglamento General de Protección de Datos)**
  - Reglamento (UE) 2016/679.
  - Obligaciones:
    - Protección de datos personales.
    - Consentimiento explícito de usuarios.
    - Derecho de acceso, rectificación y supresión.
    - Notificación de brechas de seguridad.

- **Directiva ePrivacy (Ley de Cookies)**
  - Regula el uso de cookies y seguimiento de usuarios.
  - Consentimiento previo obligatorio.

- **Digital Services Act (DSA)**
  - Regula responsabilidades de plataformas digitales.

- **NIS2**
  - Directiva de ciberseguridad para sistemas y servicios digitales.



### España (obligatorias)

- **LOPDGDD**
  - Ley Orgánica de Protección de Datos y Garantía de los Derechos Digitales.
  - Complementa el RGPD.

- **LSSI-CE**
  - Ley de Servicios de la Sociedad de la Información y Comercio Electrónico.
  - Regula:
    - Páginas web y comercio electrónico.
    - Cookies y publicidad online.
    - Contratación electrónica y comunicaciones comerciales.

- **Ley General de Defensa de los Consumidores y Usuarios**
  - Obligatoria para venta de productos o servicios, reservas incluidas.

- **Ley de Propiedad Intelectual**
  - Regula uso de imágenes, contenidos y software.

- **Código Penal (delitos informáticos)**
  - Acceso ilegal a sistemas.
  - Robo de datos y fraude online.



### Textos legales obligatorios en la web

- Aviso legal
- Política de privacidad
- Política de cookies
- Términos y condiciones
- Consentimiento de tratamiento de datos


### Requisitos técnicos legales habituales

- HTTPS obligatorio en todas las páginas.
- Consentimiento explícito en formularios de login y registro.
- Checkbox de aceptación de privacidad y condiciones.
- Sistema de gestión de cookies.
- Protección de accesos no autorizados.
- Registro de actividades (logs) y auditorías.
- Copias de seguridad periódicas.
- Control de acceso por roles (administrador, cliente, empleado).


### Requisitos específicos según funcionalidades

### 1. Sistema de login
- RGPD / LOPDGDD: protección de datos personales de usuarios.
- Contraseñas seguras, hashing, autenticación.
- Política de privacidad visible.

### 2. Sistema de reservas
- Ley de Consumidores: derecho a información clara sobre horarios, precios, condiciones.
- Confirmación por email opcional.
- Registro de cambios y cancelaciones.

### 3. API de Google Calendar
- RGPD: tratamiento de datos de calendarios de clientes.
- Contrato de tratamiento de datos (DPA) con Google.
- Consentimiento explícito para sincronización de datos.

### 4. Envío de emails
- LSSI-CE: comunicación comercial solo con consentimiento.
- RGPD: protección de datos en formularios y listas de envío.
- Posibilidad de baja de comunicaciones (opt-out).
