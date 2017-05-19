Protocolo iOS
============

Una guía para hacer apps de iOS y android.

Configura tu Laptop
-------------------

Instala la ultima versión de Xcode de la Appstore

Crea una app
----------


Instala CocoaPods

    [sudo] gem install cocoapods

Crea un app con Xcode.

* Esta seguro que pertenece a el paquete, contiene los prefixes de 2 y 3 letras.

Configura una app
-----------------

Baja el código.

    git clone git@github.com:organization/app.git

Instala las dependencias.

    cd project
    pod install

Protocolo de Git
----------------

Sigue el manual del [Protocolo de Git](/protocol/git).

Revisión de producto
--------------------

Sigue el manual de [Revisión de producto](/protocol/product-review).

Revisión de Código
------------------

Sigue el manual de [Revisión de Código](/code-review). Cuando revise a otros
ponga atención en :

* Revisar que los viewcontrollers se adhieren a el Single Responsibility Principle.
* Revisar que CoreData no viole los limites de threads.
* Revisa el potencial de los ciclos retenidos con bloques.
* Revisar que los métodos que requieran parámetros usen `NSParameterAssert()`
