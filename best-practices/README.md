Mejores prácticas
=================

Una guía para programar bien.

General
-------

* Esta guía no debe seguirse ciegamente; Esfuérzate para entender esto y pregunta en caso de duda.
* No dupliques la funcionalidad de una librería que ya hayas importado.
* No excluir u ocultar excepciones, errores y fallas (fail silently).
* No escribir código que adivine futuras funcionalidades.
* Las excepciones deben ser relevantes y mínimas.
* Mantenga el código simple.

Diseño Orientado a Objetos
--------------------------

* Evita variables Globales.
* Evita muchos parámetros que no dependan muchos.
* Limita objetos que dependan de muchas entidades, entidades de las que depende un objeto.
* Limita las dependencias de un objeto, entidades que dependen de un objeto.
* Prefiere la composición en lugar de la herencia.
* Prefiere los métodos pequeños. Entre una y cinco líneas es mejor.
* Prefiere clases pequeñas con una sola y bien definida responsabilidad. Cuando una
  clase excede las 100 líneas, puede estar haciendo demasiadas cosas.
* [Dilo, no preguntes].

[Dilo, no preguntes]: https://robots.thoughtbot.com/tell-dont-ask

Ruby
----

* Evita los parámetros opcionales. ¿El método hace demasiado?
* Evita modificar el valor de una función  o constante en tiempo de ejecución(monkey-patching).
* Genera los [Bundler binstubs] necesarios para el proyecto, como `rake` y
  `rspec`, y agrégalos al control de versión.
* Preferir las clases a los módulos al diseñar la funcionalidad que es compartida por múltiples modelos.
* Preferir `private` cuando se indica el ámbito. Usar `protected` solo con métodos de comparación
como `def ==(other)`, `def <(other)`, y `def >(other)`.

[Bundler binstubs]: https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs

Ruby Gems
---------

* Declare las dependencias en el archivo `<PROJECT_NAME>.gemspec`.
* Referencia la `gemspec` en el archivo `Gemfile`.
* Utiliza [Appraisal] para probar la gema contra múltiples versiones de dependencias de gema
(Como Rails en un motor Rails).
* Utiliza [Bundler] para administrar las dependencias de la gema.
* Utiliza [Travis CI] para la integración continua, los indicadores que muestran si la petición de GitHub
se pueden combinar, y para probar contra varias versiones de Ruby.

[Appraisal]: https://github.com/thoughtbot/appraisal
[Bundler]: http://bundler.io
[Travis CI]: http://travis-ci.org

Rails
-----

* [Añadir restricciones a las llaves foráneas][fkey] en las migraciones.
* Evita pasar por alto las validaciones con métodos como `save(validate: false)`,
  `update_attribute`, y `toggle`.
* Evita instanciar más de un objeto en los controladores
* Evita nombrar métodos después de las columnas en la base de datos en la misma clase.
* No cambie una migración después de que se haya combinado en Maestro, si deseas el cambio puede ser resuelto con otra migración.
* No hagas referencia a una clase de modelo directamente desde una vista.
* No regreses con valor falso el  `ActiveModel` callbacks, pero en lugar lanza una
  excepción.
* No utilices variables de instancia en partials. Pasar variables locales a partials desde las plantillas de vista.
* No uses fragmentos SQL o SQL (`where('inviter_id IS NOT NULL')`) fuera de los modelos.
* Generar [Spring binstubs] necesarios para el proyecto, como `rake` y
  `rspec`, y agrégalos al control de versiones.
* Si hay valores predeterminados, establézcalos en migraciones.
* Utiliza `db/schema.rb` o `db/development_structure.sql` bajo el control de versiones.
* Utiliza sólo una variable de instancia en cada vista.
* Utiliza SQL, no `ActiveRecord`, en las migraciones.
* Utiliza las convenciones del archivo [`.ruby-version`] para especificar la versión de Ruby y el nivel de revisión de un proyecto.
* Usa los sufijos `_url` para las rutas con nombre en las vistas de correo y [redirects]. Utiliza sufijos
  `_path` para rutas nombradas por todas partes.
* Utiliza una [constante de clase en lugar del nombre de clase stringificado]][class constant in association]
  para `class_name` en las macros de asociación de ActiveRecord.
* Validar el objeto the asociado `belongs_to` asociado (`user`), no la columna de la base de datos (`user_id`).
* Utiliza `db/seeds.rb` para obtener los datos necesarios en todos los entornos.
* Utiliza `dev:prime` usa variable locales para configurar el entorno de desarrollo inicial.
* Prefiere `cookies.signed` sobre `cookies` para [prevent tampering].
* Prefiere `Time.current` sobre `Time.now`.
* Prefiere `Date.current` sobre `Date.today`.
* Prefiere `Time.zone.parse("2014-07-04 16:05:37")` sobre `Time.parse("2014-07-04 16:05:37")`.
* Utiliza `ENV.fetch` para variables de entorno en lugar de `ENV[]` para que las variables de entorno que no están inicializadas sean detectadas en el deploy.
* [Use blocks][date-block] al declarar los atributos de fecha y hora en las fábricas de FactoryGirl.
* Utiliza `touch: true` al declarar las relaciones `belongs_to`.

[date-block]: /best-practices/samples/ruby.rb#L10
[fkey]: http://robots.thoughtbot.com/referential-integrity-with-foreign-keys
[`.ruby-version`]: https://gist.github.com/fnichol/1912050
[redirects]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30
[Spring binstubs]: https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs
[prevent tampering]: http://blog.bigbinary.com/2013/03/19/cookies-on-rails.html
[class constant in association]: https://github.com/thoughtbot/guides/blob/master/style/rails/sample.rb

Testing
-------

* Evita `any_instance` en rspec-mocks y mocha. Prefiere [dependency injection].
* Evita `its`, `specify`, y `before` en RSpec.
* Evita `let` (o `let!`) en RSpec. Utiliza métodos auxiliares de extracción,
pero no vuelvas a implementar la funcionalidad de `let`. [Example][avoid-let].
* Evita usar `subject` explícitamente * dentro de un bloque RSpec `it`. [Example][subject-example].
* Evita el uso de variables de instancia en las pruebas.
* Deshabilita las solicitudes HTTP reales a servicios externos con
  `WebMock.disable_net_connect!`.
*  No pruebe los métodos privados.
* Prueba procesos secundarios con un [`Delayed::Job` matcher].
* Utiliza [stubs and spies] \(not mocks\) en pruebas aisladas.
* Utiliza un solo nivel de abstracción dentro de escenarios.
* Utiliza `it` ejemplo o método de prueba para cada ruta de ejecución a través del método.
* Utiliza [assertions about state] de los mensajes entrantes.
* Utiliza stubs y espías para afirmar que se ha enviado mensajes salientes.
* Utiliza [Fake] para enviar solicitudes a los servicios externos.
* Utiliza pruebas de integración para ejecutar toda la aplicación.
* Utiliza métodos non-[SUT] en las expectativas cuando sea posible.

[dependency injection]: http://en.wikipedia.org/wiki/Dependency_injection
[subject-example]: ../style/testing/unit_test_spec.rb
[avoid-let]: ../style/testing/avoid_let_spec.rb
[`Delayed::Job` matcher]: https://gist.github.com/3186463
[stubs and spies]: http://robots.thoughtbot.com/post/159805295/spy-vs-spy
[assertions about state]: https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf?slide=51
[Fake]: http://robots.thoughtbot.com/post/219216005/fake-it
[SUT]: http://xunitpatterns.com/SUT.html

Bundler
-------

* Especifica la [versión de Ruby] del proyecto en el `Gemfile`.
* Usa una [pessimistic version] del `Gemfile`  
  de las gemas para permitir el uso de funciones como
  `rspec`, `factory_girl`, y `capybara`.
* Usa un [versionless] `Gemfile` para gemas seguras de actualizar como
  pg, thin, and debugger.
* Usa un [exact version] en el `Gemfile` para gemas frágiles, como  Rails.

[Ruby version]: http://bundler.io/v1.3/gemfile_ruby.html
[exact version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[pessimistic version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[versionless]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle

Bases relacionables
--------------------

* [Usa Indexes para llaves foráneas].
* Configura la mayoría de los campos como [`NOT NULL`].
* En SQL solo selecciona columnas que necesitas (i.e., evita `SELECT table.*`).
* Usa `ORDER BY` en consultas que necesiten ser desplegadas al usuario.
  Ya que el evitarlo hace que el orden cambie arbitrariamente.

[Usa Indexes para llaves foraneas]: https://tomafro.net/2009/08/using-indexes-in-rails-index-your-associations
[`NOT NULL`]: http://www.postgresql.org/docs/9.1/static/ddl-constraints.html#AEN2444

Postgres
--------

* Evita varias columnas con idexes en una tabla. Postgres [combina múltiples indexes] eficientemente.
  También puedes usar [compound index].
* Considera usar un [partial index] para consultas de booleanos.

[combina múltiples indexes]: http://www.postgresql.org/docs/9.1/static/indexes-bitmap-scans.html
[compound index]: http://www.postgresql.org/docs/9.2/static/indexes-bitmap-scans.html
[partial index]: http://www.postgresql.org/docs/9.1/static/indexes-partial.html

Trabajos en segundo plano
---------------

* Guarde IDs, no objetos `ActiveRecord` para una serialización más limpia, después reencuentre
  el objeto `ActiveRecord` en el método `perform`.

Email
-----

* Use [SendGrid] o [Amazon SES] para enviar emails en entornos de pruebas y de producción.
* Use una herramienta como [ActionMailer Preview] para revisar cada vista de remitente creada o actualizada
  antes de mezclarlas. Use la gema [MailView] a no ser que se esté usando una versión de Rails 4.1.0 o superior.

[Amazon SES]: http://robots.thoughtbot.com/post/3105121049/delivering-email-with-amazon-ses-in-a-rails-3-app
[SendGrid]: https://devcenter.heroku.com/articles/sendgrid
[MailView]: https://github.com/37signals/mail_view
[ActionMailer Preview]: http://api.rubyonrails.org/v4.1.0/classes/ActionMailer/Base.html#class-ActionMailer::Base-label-Previewing+emails

Web
---

* Evite usar Flash.
* Evite renderizar retardos (delays) causados por cargas síncronas.
* Use https en lugar de http cuando enlace a recursos.

JavaScript
----------
* Use la sintaxis estable de JavaScript más reciente con un transpiler, como [babel].
* Incluya un atributo `to_param` o `href` cuando serialice modelos ActiveRecord,
  y úselos cuando construya URLs del lado del cliente, en lugar del ID.

[babel]: http://babeljs.io/

HTML
----

* Prefiera las etiquetas `<button>` sobre las etiquetas `<a>` para realizar acciones.

CSS
---

* Documente la arquitectura CSS del proyecto (el README, la biblioteca de componentes
  o la guía de estilos son un buen lugar para hacer esto), incluyendo cosas como:
  * La organización de directorios de hojas de estilo y Sass parciales
  * Convención de nombres para selectores
  * Herramientas y configuración de code linting y configuración
  * Soporte de exploradores
* Use Saas.
* Use [Autoprefixer][autoprefixer] para generar prefijos de proveedores basados en
  el soporte de exploradores, específico para el proyecto, que se requiere.
* Prefiera `overflow: auto` sobre `overflow: scroll`, porque `scroll` siempre
  desplegará las barras de desplazamiento fuera de OS X, incluso cuando el contenido se ajuste correctamente en el contenedor.

[autoprefixer]: https://github.com/postcss/autoprefixer

Sass
----

* Cuando se utilice [sass-rails], use los [asset-helpers][asset-helpers] provistos
  (e.g. `image-url` and `font-url`), para que el Asset Pipeline de Rails vuelva a escribir
  las rutas correctas a los recursos.
* Prefiera los mixins sobre `@extend`.

[sass-rails]: https://github.com/rails/sass-rails
[asset-helpers]: https://github.com/rails/sass-rails#asset-helpers

Exploradores
--------

* Evite soportar versiones de Internet Explorer anteriores a IE11.

Objective-C
-----------

* Prepare nuevos proyectos usando [Liftoff](https://github.com/thoughtbot/liftoff) y
  siga la estructura de directorios prevista.
* Prefiera categorías en las clases de `Foundation` a los métodos de ayuda.
* Prefiera constantes de string a literales cuando se provean llaves o llaves de rutas a métodos.

Shell
-----

* No parsee la salida de `ls`. Ve [aquí][parsingls] para más detalles y
  alternativas.
* No use `cat` para proveer con `stdin` un archivo a procesos que acepten
  archivos como argumentos.
* No use `echo` con opciones, escapes, o variables (use `printf` para estos
  casos).
* No use un `/bin/sh` [shebang][] a no ser que planee probar y ejecutar su
  script en al menos: el Sh como tal, Dash en modo compatible con POSIX (ya que
  será ejecutado en Debian), y Bash en modo compatible con POSIX (ya que
  será ejecutado en OSX).
* No utilice ninguna [característica][bashisms] no-POSIX cuando se use un`/bin/sh`
  [shebang][].
* Si está llamando `cd`, tenga código para manejar un fallo de cambio de directorios.
* Si está llamando `rm` con una variable, asegúrese que la variable no esté vacía.
* Prefiera "$@" a "$\*" a no ser que sepa exactamente lo que está haciendo.
* Prefiera `awk '/re/ { ... }'` a `grep re | awk '{ ... }'`.
* Prefiera `find -exec {} +` a `find -print0 | xargs -0`.
* Prefiera cliclos `for` a ciclos `while read`.
* Prefiera `grep -c` a `grep | wc -l`.
* Prefiera `mktemp` a usar `$$` para dar un nombre "único" a un archivo temporal.
* Prefiera `sed '/re/!d; s//.../'` a `grep re | sed 's/re/.../'`.
* Prefiera `sed 'cmd; cmd'` a `sed -e 'cmd' -e 'cmd'`.
* Prefiera el revisar los status de salida a revisar la salida actual de instrucciones `if` (`if grep
  -q ...; `, no `if [ -n "$(grep ...)" ];`).
* Prefiera leer las variables de entorno a la salida de procesos (`$TTY` no
  `$(tty)`, `$PWD` no `$(pwd)`, etc).
* Use `$( ... )`, no backticks para capturar las salidas de comandos.
* Use `$(( ... ))`, no `expr` para ejecutar expresiones aritméticas.
* Use `1` y `0`, no `true` y `false` para representar
  variables booleanas.
* Use `find -print0 | xargs -0`, no `find | xargs`.
* Use comillas alrededor de cada `"$variable"` y expresiones `"$( ... )"`
  a no ser que quiera que la variable sea divida en palabras o interpretada como variables globales.
* Use la palabra clave `local` con variables cuyo ámbito esté dentro de la función.
* Identifique problemas comunes con [shellcheck][].

[shebang]: http://en.wikipedia.org/wiki/Shebang_(Unix)
[parsingls]: http://mywiki.wooledge.org/ParsingLs
[bashisms]: http://mywiki.wooledge.org/Bashism
[shellcheck]: http://www.shellcheck.net/

Bash
----

En adición a las mejores prácticas en Shell,

* Prefiera `${var,,}` y `${var^^}` a `tr` para cambiar notaciones en mayúsculas o minúsculas.
* Prefiera `${var//from/to}` sobre `a` para reemplazos simples de strings.
* Prefiera `[[` a `test` o `[`.
* Prefiera la sustitución de un proceso con un pipe en ciclos `while read`.
* Use `((` o `let`, no `$((` cuando no necesite el resultado

Haskell
-------

* Evite funciones parciales (`head`, `read`, etc).
* Compile el código con `-Wall -Werror`.

Elixir
------

* Evite las macros.

Ember
-----

* Evite usar `$` sin limitarlo a `this.$` en vistas y componentes.
* Prefiera hacer llamadas de búsqueda en rutas (routes) en lugar de controladores (`find`,
  `findAll`, etc.).
* Prefiera agregar propiedades a controladores en lugar de a los modelos.
* No use jQuery fuera de las vistas y componentes.
* Prefiera usar funciones `Ember.computed.*` predefinidas cuando sea posible.
* Use `href="#"` para enlaces que tengan una acción.
* Prefiera la inyección de dependencias a través de `Ember.inject` a los inicializadores, variables globales
  en la ventana, o nombres de espacios ([ejemplo][inject])
* Prefiera utilizar sub-rutas a un mantenimiento de estado.
* Prefiera cambiar explíticamente los valores de propiedades booleanas a utilizar `toggleProperty`.
* Prefiera probar su aplicación con [QUnit][ember-test-guides].

[ember-test-guides]: https://guides.emberjs.com/v2.2.0/testing/

Testing

* Prefiera `findWithAssert` a `find` cuando recupere un elemento que espera que
  exista

[inject]: samples/ember.js#L1-L11

Angular
-------

* [Evite hacer manualmente anotaciones de dependencias][annotations].
* Prefiera `factory` a `service`. Si desea usar un singleton, envuelva la clase singleton
  en una función factory y retorne una nueva instancia de esta clase desde la
  factory.
* Prefiera la directiva `translate` al filtro `translate` por [razones
  de rendimiento][angular-translate].
* No use la variable `jQuery` o la variable global `$`. Acceda a jQuery via `angular.element`.

[annotations]: http://robots.thoughtbot.com/avoid-angularjs-dependency-annotation-with-rails
[ngannotate]: https://github.com/kikonen/ngannotate-rails
[angular-translate]: https://github.com/angular-translate/angular-translate/wiki/Getting-Started#using-translate-directive

Ruby JSON APIs
--------------

* Revise las prácticas recomendadas resaltadas en Heroku's [Guía de Diseño de API HTTP]
  antes de diseñar una nueva API.
* Use un analizador JSON rápido, por ejemplo. [`oj`][oj]
* Escriba pruebas de integración para las endpoints de tu API. Cuando el consumidor primario de
  la API es un cliente JavaScript mantenido dentro de la misma base de código que el proveedor de la API, escriba [especificaciones de características]. De otro modo escriba [especificaciones de solicitud].

[Guía de Diseño de API HTTP]: https://github.com/interagent/http-api-design
[oj]: https://github.com/ohler55/oj
[especificaciones de características]: https://www.relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec
[especificaciones de solicitud]: https://www.relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec
