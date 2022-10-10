# Karate Example

API https://api.demoblaze.com

## Detalles generales de la implementación

````
+ runners
    Clases que permiten correr los tests
+ features
    La representación de las historias en archivos cucumber junto con los escenarios a probar
+ utils
    Clases de utilidad
+ data
    Contiene los archivos json con los datos usados dentro de las pruebas
+ headers
    Contiene los headers en archivos json, utilizados al momentos de realizar las peticiones http
````

## Requerimientos

Para correr el proyecto se necesita Java JDK 1.8 y Gradle preferiblemente con la versión 7.1.

## Para correr el proyecto

Para ejecutar todos los test en paralelo y generar los reportes se debe ejecutar el siguiente comando:

    gradle clean test --tests "com.cedaniel200.api.runners.ParallelTest"

Se generarán los siguientes reportes:
* **Cucumber**: Reporte ubicado en la carpeta **/target/cucumber-html-reports/**  abrir el archivo **overview-features.html**
* **Karate**: Reporte ubicado en la carpeta **/build/karate-reports/** abrir el archivo **karate-summary.html**

# Descripción de la API

## Path /signup

### Request
#### Body
````
    {
        "username": "anUsername",
        "password": "aPassword"
    }
````
### Responses
#### Creasión exitosa de un usuario
````
    Status 200
    ""
````

#### Usuario existente
````
    Status 200
    {
	    "errorMessage": "This user already exist."
    }
````

#### Parametro errado
````
    Status 200
    {
	    "errorMessage": "Bad parameter, missing username or password"
    }
````

## Path /login

### Request
#### Body
````
    {
        "username": "anUsername",
        "password": "aPassword"
    }
````
### Responses
#### Login exitoso
````
    Status 200
    "Auth_token: ########-aToken-#########"
````

#### Contraseña errada
````
    Status 200
    {
        "errorMessage": "Wrong password."
    }
````

#### Usuario no existe
````
    Status 200
    {
        "errorMessage": "User does not exist."
    }
````

#### Parametro errado
````
    Status 200
    {
        "errorMessage": "Bad parameter, missing username"
    }
````