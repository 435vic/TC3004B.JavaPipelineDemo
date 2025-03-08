# Java Pipeline Demo
> Andrés Daniel Martínez Bermúdez - A00227463
> 
> David Sanchez Baez - A01798202
> 
> Jacob García Rodríguez - A01643891
> 
> Jean Paul López Pándura - A01637266
> 
> Luis Marco Barriga Baez - A01643954
> 
> Victor Javier Quintana Cisneros - A01643020

Este proyecto busca demostrar una pipeline CI/CD usando Github Actions.
La aplicación de muestra es una app básica Spring Boot que regresa un mensaje
en `/` y `/greeting`.

Tenemos dos pipelines, main y release.

## Quick Start
Los contenedores finales se encuentran en `ghcr.io/435vic/java-pipeline-demo`. El tag
depende de la versión, las versiones disponibles son las ramas del repositorio que empiecen
con `release/`. Por ejemplo, existe `release-v0` y `release-v0.2`. Para correr directamente:
```sh
docker run -p 8080:8080 ghcr.io/435vic/java-pipeline-demo:release-v0.2
```

## Main Pipeline
El archivo `.github/workflows/main.yml` contiene una pipeline para compilar el código
y mostrar como artefacto el archivo `.jar`, para propósitos de evaluación. Ya que el
código empaquetado contiene todas las dependencias, no es necesario hacerlo contenedor.

## Release Pipeline
El workflow definido en `.github/workflows/release.yml` muestra el pipeline para versiones a
publicar del programa. Se activa cuando cualquier rama que empieze con `release/` sea modificada.
Compila el programa usando el `Dockerfile` definido, y lo publica al registro de contenedores de
GitHub.

## Dockerfile

El dockerfile se escribió con el sistema de cacheo en mente. Ya que cada línea crea
una nueva capa, si los archivos de entrada no cambia se reusará la capa
y todas las anteriores. Esto es especialmente ventajoso en las dependencias, pues
nuevas versiones usarán capas existentes si no cambia el archivo `pom.xml`.
