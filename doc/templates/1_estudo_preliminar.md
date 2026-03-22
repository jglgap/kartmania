# Estudo preliminar

## 1. Descrición do proxecto

**Kartmania** é unha aplicación web, desenvolvida na linguaxe de programación Ruby, utilizando o framework
Ruby on Rails. Esta aplicación axudará a todos os fans da velocidade a coñecer máis sobre o mundo
do karting e facilitar o seu desenvolvemento, permitíndolle ao usuario facer reservas dos karts para
vivir unha carreira chea de adrenalina. Tamén lle facilitará o traballo ao persoal de
Kartmania, ofrecéndolle unha interface web e móbil para xestionar todo tipo de actividade.

### 1.1. Xustificación do proxecto

A decisión de enfocar o proxecto nesta idea provén dunha charla cun amigo que é fan do karting, e propúxome
o reto de desenvolver unha aplicación na que o seu karting teña a facilidade de ofrecerlle aos clientes e ao
persoal da empresa unha interface na que sexa máis fácil todo o que ao karting respecta, ofrecendo unha interface
amigable e de deseño personalizado para o negocio.

### 1.2. Funcionalidades do proxecto

O proxecto contará con funcionalidades tanto para o cliente como para o empregado. Para o cliente a funcionalidade
principal é ofrecer unha ventá onde poder realizar as súas reservas de karts. O recinto conta con dous tipos de karts:
os azuis (amateur) e os vermellos (experimentados), os cales os clientes poderán elixir, xunto co número de participantes e a franxa horaria. Como o establecimiento conta cun número de karts especifico, ao usuario se lle mostrara a dispoñibilidade de karts que hay a dita hora.

Para os empregados haberá funcións como o envío de emails, a revisión de reservas, e no caso de que o empregado sexa administrador,
poderá xestionar todos os datos tanto dos empregados como dos clientes.

O envío de correos se utilizara para que os empregados, podan recordarlle aos clientes a sua reserva ou enviarlle algun aviso, e para
os administradores, para tratar algun tipo de tema con los empleados, xa sexa un aviso ou algunha mensaxe.

![Boceto envio de email](/doc/img/struture_of_mail.png)

A aplicación tamén contara cun sistema de filtrado, para poder facer busquedas exactas utilizando distintos campos.

Implementarase un sistema de torneos no que os clientes poderán participar sempre que estean logeados na aplicación.
Os clientes poderán inscribirse e, posteriormente, os empregados poderán elixir a lista final de participantes. 
Enviaráselles un correo electrónico aos clientes que foran aceptados para dito torneo.

A aplicación contará cun sistema de inicio de sesión e rexistro para os clientes e para os empregados.

Existirán dúas táboas de usuarios debido aos campos requiridos para cada unha. Farase unha táboa de usuarios para os empregados,
que poden ser empregados normais ou administradores,
e haberá unha táboa de clientes para rexistrar tamén o seu mellor tempo en pista.

Cabe aclarar que para facer reservas non é necesario estar logeado.
### 1.3. Estudo de necesidades

Actualmente en Galicia hai poucos kartings, e a proposta do meu amigo de intentar darlle un maior achegamento ao público do seu
negocio, para competir co resto de kartings, chamoume moito a atención, xa que a outra empresa de kartings en Galicia conta
cun sitio web. Así, desta maneira competirase de forma directa, xa que a maioría de persoas na actualidade, antes de ir a
un lugar, primeiro búscano na rede. Tamén lle facilitará a administración dos empregados e os envíos de mensaxes, o cal antes era
unha tarefa que consumía moito tempo.

### 1.4. Persoas destinatarias

Esta aplicación trata de axudar tanto aos posibles clientes do karting como aos propios empregados, intentando ofrecerlles a ambos
un lugar onde poder apoiarse, evitando procesos complexos que poden consumir máis tempo do necesario.

### 1.5. Modelo de negocio

O modelo de negocio que se seguirá é o B2B, mellor coñecido como "negocio a negocio", onde eu como desenvolvedor traballarei para
ofrecerlle ao negocio do meu amigo unha plataforma fácil de empregar para as súas necesidades e para os seus usuarios, ofrecendo
desta maneira o meu produto a outra empresa. Este tipo de modelo é moi común no sector tecnolóxico, onde unha empresa ou profesional
desenvolve unha solución personalizada para cubrir as necesidades específicas dun negocio concreto. Neste caso, a aplicación
estará deseñada e adaptada exclusivamente para Kartmania, co obxectivo de mellorar a súa xestión interna e a experiencia
dos seus clientes.

## 2. Requirimentos

Como traballarei en solitario para poñer en funcionamento esta aplicación, faranme falta o meu propio ordenador como medio de traballo
e un IDE que permita traballar sen moita dificultade en Ruby, entre eles están RubyMine de IntelliJ ou Visual Studio Code co plugin de Ruby.

Tamén fará falta o framework Ruby on Rails e as Gems para poder desenvolvelo. Ruby on Rails é un framework de desenvolvemento web de código
aberto que segue o patrón de arquitectura MVC (Modelo-Vista-Controlador), o cal permite organizar o código de forma clara e estruturada.

Unha das súas maiores vantaxes é a filosofía "Convention over Configuration", que reduce a cantidade de configuración necesaria e axiliza o desenvolvemento. As Gems son bibliotecas ou paquetes de código reutilizable que amplían as funcionalidades de Ruby e Rails, permitindo
incorporar características como autenticación de usuarios, envío de emails, xestión de arquivos ou validación de formularios sen necesidade
de desenvolvelas desde cero.

Para despregar o proxecto utilizaranse plataformas como Railway ou Fly.io. A vantaxe de Railway é que proporciona a facilidade de empregar
unha base de datos PostgreSQL.

Tamén farase uso das gem **Devise**, que ofrece autenticación de usuarios, asi como o seu rexistro, inicio de sesión, recuperación de contrasinal, e moitas facilidades mais. E tamén se empregara a gem **CanCanCan** que e utilizada para a autorización, é dicir que pode facer ou non un empregado.

Para o envío de correo se intentara empregar **sendGrid**, que é unha aplicación que permite o envío de correos de forma fiable e escalable.

Rails fai uso de **Active Record** que conecta o modelo de ruby coa base de datos, permitindo o tratar as tablas da base de datos como modelos, sen ter que escribir SQl manualmente para realizar unha operación.

Posibles versions a empregar:
|Tecnoloxia|Versión|
|----------|-------|
|Ruby|3.3.0|
|Rails|7.0.1|
|Node.js|20.0|
|PostgreSQL|15|
|Yarn|Latest|