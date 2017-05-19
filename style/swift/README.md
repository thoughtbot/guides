Swift
=====

[Sample](sample.swift)

* Prefiere `struct`s sobre `class`es cuando sea posible.
* Ponlas clases siempre como `final`.
* Prefiere usar protocolos a herencia.
* Divide las lineas después de 100 caracteres.
* Usa 2 espacios para identado/sangrado/tabulación.
* Usa `let` cuando sea posible para hacer variables inmutables.
* Nombra todos parámetros en funciones y enumera los casos.
* Usa trailing closures
* Deja que el compilador infiera el tipo de dato cuando sea posible
* Agrupa computed properties debajo de las propiedades.
* Usa una linea blanca sobre y debajo de las computed properties.
* Agrupa métodos en extensiones especificas para cada nivel de acceso.
* When capitalizing acronyms or initialisms, follow the capitalization of the
  first letter.
* When using `Void` in function signatures, prefer `()` for arguments and
  `Void` for return types.
* Usa strong IBOutlet.
* Evita evaluar una referencia weak multiples veces en el mismo ámbito. 
	Conviertelo en strong y luego usa la referencia strong.
* Nombra `IBAction` y target/action usando el verbo que describe lo que hacen.
	ejemeplo (e.g., `edit:` instead of `editTouch:`)
