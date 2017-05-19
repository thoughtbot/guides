Git
===

Una guía para programar usando sistema de control de versiones.

Maintain a Repo
---------------

* Evita agregar archivos que son específicos de tu máquina
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

    En presente menos de 50 caracteres

    * Más información (menos 72 caracteres).
    * Más información del commit (menos 72 caracteres).

    http://project.management-system.com/ticket/123

Si haz creado más de un commit,
[use `git rebase` interactively](https://help.github.com/articles/about-git-rebase/)
intégralos en un commit más completo y bien explicado:

    git rebase -i origin/master

    * <commit-id> es el commit hasta donde quieres unificar.
    * Incluye ~1 para incluir también el commit hasta donde quieres unificar.

    git rebase -i <commit-id>~1

    * Te va a mostrar el listado de commits del mas antiguo al mas nuevo

    pick e162eb3 :soccer: Commit 3
    pick 1b9a12d :soccer: Commit 2
    pick 7b4d76e :soccer: Commit 1

    * Y deberías cambiarlo así (en caso de querer unificarlos todos):

    pick e162eb3 :soccer: Commit 3
    s 1b9a12d :soccer: Commit 2
    s 7b4d76e :soccer: Commit 1

    * luego de unificar los commits, debes poner un solo mensaje:

    # This is a combination of 3 commits.
    # This is the 1st commit message:

    :soccer: Commit 3

    # This is the commit message #2:

    :soccer: Commit 2

    # This is the commit message #3:

    :soccer: Commit 1

    * Así:

    # This is a combination of 3 commits.
    # This is the 1st commit message:

    :soccer: Commit 1 contains commit 2 and commit 3

Comparte tu branch.

    git push origin <branch-name>

Sube un [pull request].

Pide a alguien que evalúe tu código.

[un buen mensaje para tu commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[pull request]: https://help.github.com/articles/using-pull-requests/

Revisión de código
------------------

Uno o varios compañeros del equipo distinto al autor debe ayudarte a revisar tu pull request.
Deben seguir la [guía de Revisión de código](/code-review).

Ellos deberán hacer comentarios o hacer preguntas específicas de líneas de código.
Ya sea en tu herramienta de control de versiones o vía chat.

Para cambios que se aplican por sí solos (como instaladores) deben resetear el branch

    git checkout <branch-name>
    ./bin/setup
    git diff staging/master..HEAD

Hacen cambios pequeños en el branch, prueba el branch en su máquina. Una vez
listo ejecute pruebas, haga commits y push.

Cuando estén listos con sus cambios deberán poner `Listo para Merge.`

Merge
-----

Rebasa. Agrupa commits como "Quité un espacio" y ponlos en un commit
con varios de importancia. Que tus descripciones de commit revelen lo que contiene.
Haz pruebas.

    git fetch origin
    git rebase -i origin/master

Haz un force-push. Esto hará que se cierre tu pull request y pon como resuelto el merge
cuando tus commits se suban al master. También permite que [se encuentre el pull request]
que trajo esos cambios

    git push --force-with-lease origin <branch-name>

Ve la lista de nuevos commits. Ve los archivos que cambiaron. Haz merge con master

    git log origin/master..<branch-name>
    git diff --stat origin/master
    git checkout master
    git merge <branch-name> --ff-only
    git push

Elimina tu branch de funcionalidad en el server.

    git push origin --delete <branch-name>

Elimina tu branch de funcionalidad en tu equipo.

    git branch --delete <branch-name>

[se encuentre el pull request]: http://stackoverflow.com/a/17819027
