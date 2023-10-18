
# Guía de instalación del contenedor Docker

Este repositorio contiene un Dockerfile para crear un contenedor Docker con PHP 8 y Apache. A continuación, se describe cómo instalar y ejecutar este contenedor.

## Requisitos previos

Antes de comenzar, asegúrate de tener Docker instalado en tu sistema. Puedes descargar e instalar Docker desde el sitio web oficial: [Docker](https://www.docker.com/get-started).

## Pasos de instalación

Sigue estos pasos para crear y ejecutar el contenedor Docker:

1. Clona o descarga este repositorio a tu sistema local.

2. Abre una terminal y navega al directorio del repositorio.

3. Construye la imagen de Docker ejecutando el siguiente comando:

   ```bash
   docker build -t nombre_imagen .
   ```

Asegúrate de reemplazar `nombre_imagen` por el nombre que deseas darle a tu imagen Docker.

4. Una vez que la imagen se haya construido correctamente, puedes ejecutar un contenedor con el siguiente comando:

   ```bash
   docker run -p 8080:80 -d --name nombre_contenedor -v /ruta/local:/ruta/contenedor nombre_imagen
   ```

   Esto ejecutará un contenedor basado en la imagen que acabas de crear y expondrá el puerto 8080 de tu sistema local al puerto 80 del contenedor.

5. Abre un navegador web y accede a `http://localhost:8080` para ver tu aplicación web ejecutándose en el contenedor.

6. Para detener y eliminar el contenedor cuando hayas terminado, ejecuta el siguiente comando:

   ```bash
   docker stop nombre_contenedor
   docker rm nombre_contenedor
   ```

   Reemplaza `nombre_contenedor` por el ID o el nombre del contenedor que deseas detener y eliminar.