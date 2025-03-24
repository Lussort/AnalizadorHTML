Analizador léxico de documentos HTML utilizando Java y JFlex
Este repositorio contiene el desarrollo de un analizador léxico construido con el lenguaje de programación Java 21 y la herramienta JFlex, cuyo propósito es identificar y clasificar los componentes principales de documentos HTML. El proyecto fue realizado como parte de un trabajo académico del curso de Compiladores

El sistema recibe como entrada un archivo de texto que contiene contenido en formato HTML y genera como salida un archivo que presenta los tokens reconocidos por el analizador. Entre los elementos que se identifican se incluyen etiquetas de apertura y cierre (por ejemplo, <html>, </body>, <h1>), atributos de etiquetas (como class="...", id="...", href="..."), comentarios HTML (<!-- Esto es un comentario -->), entidades HTML (&lt;, &gt;, &amp;, &quot;, &apos;) y contenido textual que se encuentra entre las etiquetas.

El proyecto incluye los siguientes archivos:

Analizador.flex: contiene las reglas léxicas definidas mediante expresiones regulares. Este archivo es procesado por JFlex para generar el analizador en Java.

Analizador.java: archivo generado automáticamente por JFlex. No debe ser modificado manualmente.

Principal.java: clase principal que ejecuta el analizador, lee el archivo de entrada y genera el archivo de salida.

entrada html.txt: archivo de entrada con contenido HTML, sobre el cual se realiza el análisis.

salida.txt: archivo generado por el programa, que contiene la lista de tokens reconocidos por el analizador.

Para ejecutar el proyecto, es necesario contar con Java 21, NetBeans (u otro entorno compatible), y el archivo ejecutable de JFlex. El analizador se ejecuta compilando Principal.java y asegurando que el archivo de entrada se encuentre en el directorio adecuado. Al finalizar, se genera un archivo de salida con el listado de tokens identificados.