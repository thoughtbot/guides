Protocolo Open Source
====================

Una guía para liberar y mantener proyectos de código abierto.

Aceptando un GitHub Pull Request
-------------------------------

Suponiendo que tienes esto en `~/.gitconfig`:

    [alias]
      co-pr = !sh -c 'git fetch origin pull/$1/head:pr/$1 && git checkout pr/$1' -

Baja el código de github usando su nombre:

    git co-pr 123

Rebasa, comprime los commits y mejora el mensaje del commit:

    git rebase -i master

Verifica los cambios:

    git diff origin/master

Corre el código y haz pruebas. Por ejemplo :

    bundle
    rake

Haz merge con master:

    git checkout master
    git merge pr/123 --ff-only

Push:

    git push origin master

Elimina el branch:

    git branch -D pr/123

Liberando un Ruby Gem
--------------------

* Editar el numero `VERSION`.
* Corre `bundle install` para actualizar `Gemfile.lock`.
* Corre las pruebas.
* Edita los archivos`NEWS`, `Changelog`, o `README` si es necesario.
* Sube tus cambios. Usa la convención "v2.1.0" en tu mensaje de commit.
* Corre `rake release`, que taggea el commit y lo crea, sube el tag
  a GitHub, sube la GEM a Rubygems.org.
