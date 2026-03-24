# Deseño

## Diagrama da arquitectura
![Diagrama de arquitectura](/doc/img/diagrama_arquitectura.png)

## Diagrama de Base de Datos
```mermaid
erDiagram
    
    Clientes ||--o{ Reserva : realiza
    Karts ||--o{ Reserva : tiene
    Clientes ||--o{ Torneo : participan

    Clientes {
        int id PK
        string nombre
        string email
        string password
        string telefono
        float mejor_tiempo
    }

    Users {
        int id PK
        int tipo
        string nombre
        string direccion
        string ciudad
        string provincia
        string codigo_postal
        string email
        string password
        string telefono
    }

    Karts {
        int id PK
        int tipo
        int estado
        int id_reserva FK
    }

    Reserva {
        int id PK
        int id_cliente FK
        int karts_azules
        int karts_rojos
        date fecha
    }

    Torneo {
        int id PK
        string nombre
        string descripcion
        date fecha_participacion
        int numero_participantes
        int dificultad
    }

    clientes_torneo_lista_previa {
        int id PK
        int id_participante FK
        int id_torneo FK
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