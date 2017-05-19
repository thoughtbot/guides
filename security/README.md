# Seguridad

Una guía para crear una web segura.

## Piensa

La seguridad es importante, y no debes utilizar las reglas sin entenderlas. Asegúrate que entendiste estas reglas, por que existen, y cómo seguirlas.

De no seguir estas reglas, tu equipo, y tus servicios tendrán riesgo de compromiso o perdida de privacidad.

## Comunicación y acceso seguro

Las siguientes reglas aplican para que tengas un acceso seguro a tus sistemas (laptop, cuentas, etc.) y comunicación (correo, etc.)

### Uso de contraseñas

* Utiliza una contraseña única para todas las cuentas que crees.
* Utiliza una herramienta como [pwgen](https://github.com/jbernard/pwgen) o
  [1password](https://1password.com) para generar contraseñas aleatorias.
* Usa una herramienta como GnuPG para encriptar contraseñas si es que necesitas compartirla con alguien.

### Cifrado

* Utiliza [encriptación de disco][disco] en tu laptop.
* Utiliza PGP en un correo si quieres que alguien confíe que lo escribiste.
* Utiliza PGP para revisar un correo si quieres saber quien lo escribió.
* Utiliza PGP para encriptar correos si quieres estar seguro que nadie los pueda leer.
* Cuida muy bien de tus llaves.
* Confía totalmente en las llaves que has verificado en persona o mediante un video chat seguro.
* No compartas tus llaves con nadie, incluyendo servicios como Keybase.
* Guarda por lo menos un respaldo de tu llave privada y certificados en un lugar seguro, como memoria USB.

[disco]: https://theintercept.com/2015/04/27/encrypting-laptop-like-mean/

## Seguridad física

Las siguientes reglas aplican a como proteger físicamente nuestras laptops y dispositivos móviles que pueden contener datos de cliente o usuario.

* Bloquea tu dispositivo cuando estés lejos de él.
* No olvides tus dispositivos en un área no segura.
* Instale una herramienta de rastreo de dispositivos y datos remotos como [Prey].

[Prey]: https://www.preyproject.com/

## Seguridad de la aplicación

Las siguientes reglas aplican a como desarrollamos software a favor de nosotros mismos y los clientes.

### Transmitir información

* No aceptes contraseñas o tokens de sesión sobre HTTP.
* Utiliza HTTPS para todo el tráfico web.
* Utiliza HTTPS desde el inicio; es más complicado agregarlo después.
* Redirecciona el tráfico HTTP a HTTPS.
* Utiliza [HSTS](http://tools.ietf.org/html/rfc6797) para cumplir con el tráfico HTTPS.
* Utiliza cookies de seguridad.
* Evite las URL relativas.
* Usa software original.
* No visites páginas de contenido dudoso.

### Almacenamiento de información

* No imprimas contraseñas en logs.
* No guardes contraseñas en texto plano, encripta.
* No encriptes contraseñas usando cifrado reversible.
* No encriptes contraseñas usando métodos de cifrado rotos como MD5 o SHA1.

### Prevenir vulnerabilidades

Durante el desarrollo del código base, da seguimiento a las alertas de seguridad en las compilaciones de integración continua con herramientas como [Bundler Audit].

[Bundler Audit]: https://robots.thoughtbot.com/handling-security-issues-in-open-source-projects#one-thing-end-users-can-do

## Manejo de vulnerabilidades

Las siguientes reglas aplican a como manejamos incidentes de seguridad.

### Revisión, registro y seguimiento

Cuando un mensaje encriptado aparece, publica el cambio a un nuevo [Constable] thread en el interés de seguridad, y guarda el thread actualizado cuando nuevos mensajes aparezcan.

[Constable]: https://constable.io
