#Sass

- [Sample] (sample.scss)
- [Configuración predeterminada SCSS-Lint] (.scss-lint.yml)

## Formato

* Utilice la sintaxis SCSS.
* Usar guiones al nombrar mixins, extends, classes, functions y variables: `span-columns` no` span_columns` o `spanColumns`.
* Usar un espacio entre la propiedad y el valor: `width: 20px` no `width:20px`.
* Utilice una línea en blanco encima de un selector que tiene estilos.
* Preferible el uso de color con códigos hexadecimal `# fff` o` #FFF`.
* Evite usar las propiedades abreviadas para un solo valor: `background-color: # ff0000;`, no `background: # ff0000;`
* Use `//` para los bloques de comentario no `/ * * /`.
* Utilice un espacio entre el selector y `{`.
* Use comillas dobles.
* Utilice sólo letras minúsculas, excepto para hexadecimal o valores de cadena.
* No agregue una especificación de unidad después de los valores de "0", a menos que sea requerido por un mixin.
* Utilice un cero en números decimales: `0.5` no` .5`
* Utilizar espacio alrededor de los operandos: `$ variable * 1.5`, no` $ variable*1.5`
* Evitar las operaciones en línea en las declaraciones taquigráficas (por ejemplo, "padding: $ variable * 1.5 variable * 2`)
* Utilice paréntesis en torno a las operaciones individuales en las declaraciones abreviadas: `padding: ($ variable * 1.5) ($ variable * 2);`
* Utilizar dos puntos para los pseudo-elementos
* Utilice una unidad `%` para la cantidad / peso al usar las funciones de color de Sass: `dark ($ color, 20%)`, no `darkcolor ($ color, 20)`
* Utilice una coma posterior después de cada elemento en un mapa, incluyendo el último elemento.

## Orden

* Usar el orden alfabético para las declaraciones.
* Coloque `@ extends` y` @ includes` en la parte superior de su lista de declaraciones.
* Coloque consultas de medios directamente después de la lista de declaración.
* Coloque los selectores concatenados en segundo lugar.
* Colocar pseudo-estados y pseudo-elementos en tercer lugar.
* Coloque los elementos anidados en cuarto lugar.
* Coloque las clases anidadas en quinto lugar.

## Selectores

* No utilice ID para el estilo.
* Use nombres significativos: `$ visual-grid-color` no` $ color` o `$ vslgrd-clr`.
* Sea consistente con las convenciones de nombres para las clases. Por ejemplo, si un proyecto está usando BEM, continúe usándolo, y si no lo es, no lo introduzca.
* Utilice nombres de ID y de clase que sean lo más cortos posible pero siempre que sea necesario.
* Evite usar el selector descendente directo `>`.
* Evite anidar más de 3 selectores de profundidad.
* Usar etiquetas HTML en clases vagas que necesitan un calificador como `header.application` no` .main`.
* Evite usar etiquetas HTML en el nombre de la clase: `section.news` no` section.news-section`.
* Evite usar etiquetas HTML en las clases para el marcado genérico `<div>`, `<span>`: `.widgets` no` div.widgets`.
* Evite usar etiquetas HTML en clases con nombres de clases específicos como `.featured-articles`.
* Evite el uso de selectores delimitados por comas.
* Evite anidar dentro de media query.

## Organización

* Utilice Bourbon una biblioteca Sass.
* Utilice Neat para grid framework.
* Utilizar el directorio Bitters/`base` para los selectores de elementos de estilo, variables globales, extensiones globales y mixins globales.
* Utilice [Normalizar] (https://github.com/necolas/normalize.css) para la coherencia en la representación del navegador, en lugar de un restablecimiento.
* Usar estructura HTML para ordenar selectores. No solo coloque estilos en la parte inferior del archivo Sass.
* Evite tener archivos de más de 100 líneas.