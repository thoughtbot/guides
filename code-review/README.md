Code Review
===========

Una guía para revisar código y que tu código sea revisado.

Para todos
----------

* Acepta diferentes tipos de decisiones y opiniones al programar. Discute que cosas
  perdiste que cosas prefieres. Intenta llegar a un acuerdo rápido.
* Hagan preguntas bien intencionadas. No exijan ("¿Qué opinas sobre nombrarlo
  de esta manera `:user_id`?")
* Las buenas preguntas evitan juzgar y mal interpretar la perspectiva del autor.
* Pide que te clarifiquen. ("No entiendo. ¿Podrías ser más especifico?")
* Evita tomar tomar propiedad sobre cierta parte del código. ("mío","no mío", "tuyo")
* Evita usar términos que ataquen personalmente a las personas.("Tonto", "Wey").
  Todos somos inteligentes.
* Se explícito. No todos entendemos tus intenciones en linea.
* Se humilde ("No estoy seguro - Mirémoslo juntos").
* No exageres ("siempre", "nunca", "nada", "infinitamente").
* No uses sarcasmo.
* Mantente autentico. Si los emojis, gifs o el humor no es lo tuyo no lo uses,
  no es obligatorio. Y si lo son úsalos sin problema
* Hablen en tiempo real ("chat", "hangout", "persona") si hay demasiados
  "No entiendo" o "Encontré una solución alterna" en los comentarios. Después
  publiquen lo que acordaron.

Si te están evaluando
---------------------

* Agradece los comentarios y sugerencias ("¡Gracias!. Haré ese cambio")
* Solíamos decir "No te tomes eso personal. Lo que se evalúa es el código, no a ti". Pero ahora preferimos decir : Considera que [es complicado entenderse por internet] y que fácil es malinterpretar el comentario de los demás. Si el review es enojado o agresivo o personal, intenta preguntar si lo que se escribió es tal cual lo que la persona quiere expresar e intenta pedir que se explique de menor forma, en persona de ser posible.
* Entendiendo el punto anterior : asume que la persona que evalúa tiene las mejores intenciones.
* Explica por que el código existe ("Existe por estas razones. ¿Seria mejor
	si cambio el nombre a esta clase/variable/método?")
* Toma esos cambios y sugerencias como parte de tus futuras tareas o funcionalidad a desarrollar
* Pon un link en tu revisión de código en tus tareas ("Listo para revisión: https://github.com/organization/project/pull/1")
* Antes de tu revisión mantén commits independientes en el branch. Cuando estén listos
	para hacer merge comprime todos. Las personas que evalúan deben de ser capaces de revisar
	todo lo hecho previamente individualmente.
* Busca entender el punto de vista del auditor.
* Trata de responder cada comentario.
* Espera hacer el merge al branch hasta que el Sistema de integración continua (TDDium, TravisCI, etc.).
	Te diga que esta en verde.
* Haz merge hasta que estés seguro del código que quieres publicar.

[es complicado entenderse por internet]: https://www.fastcodesign.com/3036748/why-its-so-hard-to-detect-emotion-in-emails-and-texts

Para quien evalúa
-----------------

Entiende por que el cambio es necesario ("arreglar un bug",
"mejorar la experiencia de usuario", "refactorización"). Ahora :

* Comunica que ideas creas que apoyas y cuales no.
* Identifica maneras de simplificar el código pero resolviendo el problema
* Si la discusión es demasiado académica o filosófica, platíquenlo
	en una reunión offline. Por el momento dejen que el autor decida su solución.
* Ofrece una alternativa de implementación. pero asume que el autor ya la
	pensó ("¿Crees que implementar un validación personalizada funcionaria?")
* Entiende la perspectiva del autor
* Firma tu pull request con un comentario de thumbsup: o "Listo".

Comentarios de estilo
---------------------

Para comentarios de estilo utiliza [style](../style)
por ejemplo :

    [Style](../style):

    > Los recursos no estan el orden alfabético.

Y para corregirlo haz referencia al commit:

    Whoops. Good catch, thanks. Fixed in a4994ec.

Si no estas de acuerdo con los guidelines, abre un issue y lo podemos platicar.
Por el momento aplica la norma.


Créditos
--------

Traducido de la guía de Code Review de [thoughtbot].

[thoughtbot]: https://github.com/thoughtbot/guides/tree/master/code-review
