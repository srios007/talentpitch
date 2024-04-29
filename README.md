# Prueba Técnica Para Desarrollador Flutter Senior

* Desarrollada por: Santiago Ríos Valero.

### Objetivo

Demostrar habilidades avanzadas en el consumo y procesamiento eficiente de APIs, gestión de estados, almacenamiento local y experiencia de usuario en la visualización de contenido multimedia, especialmente videos, en una aplicación Flutter.

### Tecnologías usadas

* Flutter
* Dart
* Firebase authentication
* Firebase storage
* Firestore

### Descripción del reto realizado

Se realizó una aplicación que permite a los usuarios lo siguiente:

* Registrarse, además permite subir una foto que se alojará en firebase storage
* Iniciar sesión, esto se hará de manera persistente, es decir, si el usuario cierra la aplicación y la vuelve a abrir, no tendrá que iniciar sesión nuevamente
* Recuperar su contraseña mediante el correo
* Ver el listado de categorías
* Ver el listado de videos de una categoría, en caso de no tenerlo, se le mostrará una pantalla con información adicional
* Reproductor de video, que le permite al usuario ver el video, pausarlo, reiniciarlo y agregarlo a favoritos
* Ver el listado de videos favoritos
* Ver el perfil del usuario, donde podrá visualizar su información y foto de perfil
* Cerrar sesión

### Justificación de la prueba

* Se utilizó **GetX** como manejador de estado, ya que esta nos brinda, navegación, alertas, uso de controladores para el manejo del estado, entre otros. Además, es una librería que se integra muy bien con flutter y es muy fácil de usar.
* Para la persistencia local de los favoritos se utilizó la librería **Get Storage**, ya que es una librería muy sencilla de usar para obtener y guardar información
* Para reproducir los videos se utilizó la librería **Video Payer**, ya que es una librería muy completa y fácil de usar para reproducir videos en flutter
* En cuanto a las decisiones de diseño, me basé en sus colores primarios de la aplicación publicada en tiendas y en la distribución de las categorías

### Instalación 

1. Clonar el siguiente repositorio:

```bash
git clone https://github.com/srios007/talentpitch.git
```

2. Agregar el archivo .env en la raíz del proyecto, este está adjunto en el entregable de la prueba técnica como un .tx

3. Agregar el archivo key.properties en la carpeta android, este está adjunto en el entregable de la prueba técnica como un .txt. Debe ajustar la ruta del storeFile, este está ubicado en la carpeta key del proyecto.

4. Descargar las librerías necesarias: 

```
flutter pub get
```
5. Correr la aplicación:

```
flutter run
```