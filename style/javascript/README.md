JavaScript
==========

[Ejemplo](sample.js)

* Prefiere las clases de ES6 sobre prototypes.
* Usa  (`===` y `!==`) para comparaciones excepto cuando compares
  (`null` o `undefined`).
* Prefiere [arrow functions] `=>`, que `function`.Excepto definiendo clases o métodos..
* Usamos punto y coma al final de cada instrucción.
* Preferimos comilla simple.
* Usa `PascalCase` para clases, `lowerCamelCase` para variables y funciones,
  `SCREAMING_SNAKE_CASE` para constantes, `_singleLeadingUnderscore` para variables y funciones privadas.
* Prefiere [template strings] sobre concatenación de strings ( "a" + 5 ).
* Prefiere promises sobre callbacks.
* Prefiere array functions como `map` y `forEach` sobre usar `for`.
* Usa `const` para declarar variables que no serán resignadas, y `let`
  de lo contrario.
* Evita `var` para declarar variables.
* Usa [coma] después de cada item ya sea multilinea o un objeto. No olvides ponerlo al ultimo item.

[template strings]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/template_strings
[arrow functions]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
[comma]: /style/javascript/sample.js#L11
