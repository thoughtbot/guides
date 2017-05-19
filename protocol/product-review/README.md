Revisión de Producto
====================

Reduce el tiempo de desarrollo y enfócate en la experiencia de usuario. Dile a un amigo que  revise tu cambio antes que se mande a producción o a revisión.

Para cada cambios puedes hacer uso de:

* En persona
* Video chat y screenshare
* SSH

En persona
----------

Si se sienta a lado de ti dile que te ayude a revisarlo en persona.

Video chat y screenshare
------------------------

Usen :

[Hangout]: https://hangouts.google.com/?hl=es-419
[Slack]: https://slack.com/

SSH
----

Usa [ngrok] para configurar un SSH tunnel y trabajar desde tu laptop:

[ngrok]: https://ngrok.com/

    ngrok -subdomain=feature-branch-name 3000

Después comparte la liga con alguien.
