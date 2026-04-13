# Deseño

## Diagrama da arquitectura
![Diagrama de arquitectura](/doc/img/diagrama_arquitectura.png)

## Diagrama de Base de Datos
```mermaid
erDiagram




Clientes ||--o{ Participantes : participa
Torneos ||--|{ Participantes : tiene
Clientes_reserva }|--o{ Reservas : tiene
Planes ||--o{Reservas : pertenece


Users { 
        int id PK
        int tipo
        string nombre
        string direccion
        string ciudad
        string provincia
        string codigo_postal
        string email
        string contrasena
        string telefono
}

Clientes {
        int id PK
        string nombre
        string email
        string contrasena
        string telefono
        float mejor_tiempo
}
Karts {
        int id PK
        int tipo
        int estado
}

Participantes {
        int id PK
        int id_cliente FK
        date fecha_solicitud
        date fecha_confirmacion
        int estado
        int id_torneo FK
}

Torneos {
        int id PK
        String nombre
        String descripcion
        date fecha_torneo
        String primer_puesto
        String segundo_puesto
        String tercer_puesto
        float primer_premio
        float segundo_premio
        float tercer_premio
        int numero_participantes
        int dificultad
}

Planes {
        int id PK
        String nombre
        String descripcion
        String nivel
        String tiempo
        int numero_participantes
}

Clientes_reserva {
        int id PK
        int id_cliente 
        String nombre
        String email
        String num_telefono
        String dni
        int id_reserva
        boolean es_titular
}

Reservas {
    int id PK
    Date fecha_estipulada
    int id_plan FK
    
    boolean estado
}
```
## Deseño de interface de usuarios
Los siguientes mock ups son para mostrar unha idea de como seria a estrutura base de aplicación

- Mock up das tablas nas vistas do administrador
![mock up vista administrador](/doc/img/mockup_adminstrador.png)

- Mock up da vista para alistarse nun torneo
![mock up vista torneo](/doc/img/mockup_Torneos.png)

- mock up vista de formularios
![Mock up vista formularios](/doc/img/mockup_formulario.png)

A posible paleta de colores que se implementara seguira el siguiente modelo

![paleta de colores](/doc/img/paleta%20de%20colores.png)