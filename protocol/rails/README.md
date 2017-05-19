Protocolo Rails
===============

Una guía para hacer grandiosas apps web.

Set Up Laptop
-------------

Set up your laptop with [this script](https://github.com/thoughtbot/laptop)
and [these dotfiles](https://github.com/thoughtbot/dotfiles).

Crear App
----------

Obtener Suspenders.

    gem install suspenders

Crear la app.

    suspenders app --heroku true --github organization/app

Prepara la App
----------

Obtener el código.

    git clone git@github.com:organization/app.git

Obtener las dependencias de la app.

    cd project
    ./bin/setup

Usa [Heroku config](https://github.com/ddollar/heroku-config) para obtener `ENV`
variables.

    heroku config:pull --remote staging

Borra líneas extra en `.env`, dejando solo lo necesario para el buen funcionamiento de la app. Por ejemplo: `BRAINTREE_MERCHANT_ID` y `S3_SECRET`.

Usa [Foreman](https://github.com/ddollar/foreman) para correr la aplicación de manera local.

    foreman start

Usa el archivo `.env` y `Procfile` para correr los procesos como Heroku's [Cedar](https://devcenter.heroku.com/articles/cedar/) stack.

Protocolo de Git
------------

Seguir el protocolo [Git Protocol](/protocol/git).

Revisión de Producto
--------------

Seguir el protocolo [Product Review protocol](/protocol/product-review).

Revisión de Código
-----------

Seguir las guías [Code Review guidelines](/code-review). Al revisar el trabajo de otros en Rails, ver en particular lo siguiente:

* Revisa cuidadosamente la integridad de las datos tales como las migraciones que hacen cambios irreversibles en la información así como si hay algo relacionado al respaldo de la base se datos en las etapas durante la implementación y el despliegue de la producción.
* Revisa las consultas SQL buscando potenciales inyecciones de SQL.
* Revisa si las actualizaciones de dependencia incluyen una razón en el mensaje del commit como lo es una liga al archivo de dependencia `ChangeLog` o `NEWS`.
* Revisa si los indexes de una nueva base de datos son necesarios si fueron agregadas nuevas columnas o consultas de SQL.
* Revisa si las tareas del nuevo programador (`cron`) se han añadido o si se relacionan en la administración del sistema para ser agregadas durante la implementación y el despliegue de producción.

Despliegue
------

Ver una lista de los nuevos commits. Ver los archivos con cambios.

    git fetch staging
    git log staging/master..master
    git diff --stat staging/master

En caso de ser necesario, ver variables de ambiente.

    heroku config:add NEW_VARIABLE=value --remote staging

Desplegar a [Heroku](https://devcenter.heroku.com/articles/quickstart).

    git push staging

En caso de ser necesario, correr las migraciones y reiniciar los dynos.

    heroku run rake db:migrate --remote staging
    heroku restart --remote staging

[Introspección] para ver si todo es correcto.

    watch heroku ps --remote staging

Probar el feature en el navegador.

Despliegue a producción.

    git fetch production
    git log production/master..master
    git diff --stat production/master
    heroku config:add NEW_VARIABLE=value --remote production
    git push production
    heroku run rake db:migrate --remote production
    heroku restart --remote production
    watch heroku ps --remote production

Ver los logs y métricas de los dashboards.

Cierra el pull request y comenta `Merged.`

[Introspección]: http://blog.heroku.com/archives/2011/6/24/the_new_heroku_3_visibility_introspection/

Configuración del entorno de producción
-----------------------------

* Asegurarse que tu [`Procfile`] está configurado para ejecutar Unicorn.
* Asegurarse que el PG Backups add-on está habilitado.
* Crear un read-only [Heroku Follower] para la producción de la base de datos. Si un corte de la base Heroku
 ocurre, Heroku puede usar un seguidor para recuperar la base de datos y que ésta corra más rápido.

[Heroku Follower]: https://devcenter.heroku.com/articles/improving-heroku-postgres-availability-with-followers
[`Procfile`]: https://devcenter.heroku.com/articles/procfile
