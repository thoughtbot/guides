Estilo
======

Una guía para programar con estilo.

Ademas de estos lineamientos generales, existen reglas
particulares a el uso de estilos de lenguajes/frameworks:

* [Android](android)
* [Backbone](backbone)
* [CoffeeScript](coffeescript)
* [Ember.js](ember)
* [ERb](erb)s
* [Git](git)
* [Haskell](haskell)
* [HTML](html)
* [JavaScript](javascript)
* [Objective-C](objective_c)
* [Python](python)
* [Rails](rails)
* [Ruby](ruby)
* [Sass](sass)
* [Shell](shell)
* [Swift](swift)
* [Testing](testing)

Dar Formato
-----------

* Evitar comentarios sobre la línea.
* Partir líneas mayores a 80 caracteres.
* Borrar espacios en blanco.
* No incluir espacios después de `(`, `[` o antes de `]`, `)`.
* No escribir con faltas de ortografía.
* No alinear verticalmente las fichas en líneas consecutivas.
* Indentar, sangrado o tabular líneas continuas en dos espacios.
* Indentar, sangrado o tabular los métodos privados iguales que los métodos públicos
* Si rompe una cadena de invocación de método, mantener cada invocación del método en
  su propia línea. Coloque el `.` al final de cada línea, excepto el último.
  [Ejemplo][dot guideline example].
* Utilizar la espacios (no tabs).
* Utilizar una línea vacía entre métodos.
* Utilizar líneas vacías alrededor de bloques de múltiples líneas.
* Utilizar espacios alrededor de operadores, excepto para operadores unarios, como `!`.
* Utilizar espacios después de comas, después de dos puntos y punto y coma, alrededor
  de `{` y antes de `}`.
* Utilizar [Unix-style line endings][newline explanation] (`\n`).
* Utilizar [Mayúsculas para palabras clave SQL y minúsculas para identificadores SQL].


[dot guideline example]: /style/ruby/sample.rb#L11
[Mayúsculas para palabras clave SQL y minúsculas para identificadores SQL]: http://www.postgresql.org/docs/9.2/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS
[Explicación de línea nueva]: http://unix.stackexchange.com/questions/23903/should-i-end-my-text-script-files-with-a-newline

Nombrar
------

* No utilizar abreviaturas.
* No utilizar tipos de objetos en los nombres (`user_array`, `email_method`   `CalculatorClass`, `ReportModule`).
* Nombrar clases después de conceptos de dominio en lugar de patrones que          
  implementan (e.g. `Guest` vs `NullUser`, `CachedRequest` vs `RequestDecorator`).
* Nombrar el parámetro de enumeración en la colección.
* Nombre de variables creadas por un factory a partir de ella(`user_factory`
  creates `user`).
* Nombre de variables, métodos y clases para revelar la intención.
* Tratar las siglas como palabras en los nombres (`XmlHttpRequest` no `XMLHTTPRequest`),
  incluso si el acrónimo es el nombre entero (`class Html` no `class HTML`).
* Variables con sufijo que sostienen una fábrica con `_factory` (`user_factory`).

Organización
------------

* Ordenar los métodos para que los métodos que llama sean anteriores en el archivo.
* Ordenar los métodos para que los métodos estén lo más cerca posible de otros
  métodos que llamen.
