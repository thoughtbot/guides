Git
===

Una guía para programar usando versionamiento.

Maintain a Repo
---------------

* Evita agregar archivos que son específicos tu tu maquina 
	de desarrollo o de un proceso
* Elimina branches locales y las de funcionalidades individuales
	después de hacer merge
* Trabaja en un branch de funcionalidad.
* Rebasa frecuentemente para incorporar cambios nuevos.
* Usa [pull request] para las revisiones de código.

[pull request]: https://help.github.com/articles/using-pull-requests/

Crear una funcionalidad
--------------------------

Crea un branch local de funcionalidad basado en master

    git checkout master
    git pull
    git checkout -b <branch-name>

Rebasa frecuentemente para incorporar cambios

    git fetch origin
    git rebase origin/master

Resuelve conflictos. Cuando la funcionalidad este lista y probada, agrega los cambios. 

    git add --all

Cuando agregues los cambios haz commit.

    git status
    git commit --verbose

Escribe [un buen mensaje para tu commit] : 

    En presente menos de 50 characteres

    * Mas información (menos 72 characteres).
    * Mas información del commit (menos 72 characteres).

    http://project.management-system.com/ticket/123

Si haz creado mas de un commit,
[use `git rebase` interactively](https://help.github.com/articles/about-git-rebase/)
intégralos en un commit mas completo y bien explicado:

    git rebase -i origin/master

Comparte tu branch.

    git push origin <branch-name>

Sube un [pull request].

Pide alguien que evalúe tu código.

[un buen mensaje para tu commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[pull request]: https://help.github.com/articles/using-pull-requests/

Revisión de código
------------------

Uno o varios compañeros del equipo distinto al autor debe ayudarte a revisar tu pull request.
Deben de seguir la [guía de Revisión de código](/code-review).

Ellos deberan hacer comentarios o hacer preguntas especificas de lineas de código.
Ya sea en tu herramienta de versionamiento o via chat.

Para cambios que se aplican por si solos (como instaladores) deben de resetear el branch

    git checkout <branch-name>
    ./bin/setup
    git diff staging/master..HEAD

Hacen cambios pequeños en el branch, prueba el branch en su maquina. Una vez
listo ejecute pruebas, haga commits y push.

Cuando estén listos con sus cambios deberán poner `Listo para Merge.`

Merge
-----

Rebasa. Agrupa commits como "Quite un espacio" y ponlos en un commit
con varios de importancia. Que tus descripciones de commit revelen lo que contiene.
Haz pruebas.

    git fetch origin
    git rebase -i origin/master

Haz un force-push. Esto hará que se cierre tu pull request y pon como resuelto el merge 
cuando tus commits se suban al master. Tambien permite que [se encuente el pull request]
que trajo esos cambios

    git push --force-with-lease origin <branch-name>

Ve la lista de nuevos commits. Ve los archivos que cambiaron. Haz merge con master

    git log origin/master..<branch-name>
    git diff --stat origin/master
    git checkout master
    git merge <branch-name> --ff-only
    git push

Elimina tu brach de funcionalidad en el server.

    git push origin --delete <branch-name>

Elimina tu brach de funcionalidad en tu equipo.

    git branch --delete <branch-name>

[se encuente el pull request]: http://stackoverflow.com/a/17819027
