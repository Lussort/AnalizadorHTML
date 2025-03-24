%%
%public
%class Analizador
%unicode
%line
%column
%type int

%{
  private java.io.PrintWriter salida;

  // Método para que Principal.java le pase el PrintWriter
  public void setSalida(java.io.PrintWriter salida) {
    this.salida = salida;
  }

  // Método para imprimir tokens
  private void imprimir(String tipo, String lexema) {
    if (salida != null) {
      salida.println(tipo + ": " + lexema);
    } else {
      System.out.println(tipo + ": " + lexema);
    }
  }
%}

DIGITO = [0-9]
LETRA = [a-zA-Z]
ID = {LETRA}({LETRA}|{DIGITO}|[-_])*
ESPACIO = [ \t\n\r]+
TEXTO = [^<>&\"]+
ENTIDAD = &lt;|&gt;|&amp;|&quot;|&apos;
ATRIBUTO = {ID}=\"[^\"]*\"

%%

{ESPACIO}                         { /* ignorar */ }

"<!--"([^])*"-->"                 { imprimir("Comentario", yytext()); }

"<"({ID})                         { imprimir("Etiqueta de apertura", yytext()); }
"</"({ID})">"                     { imprimir("Etiqueta de cierre", yytext()); }

{ATRIBUTO}                        { imprimir("Atributo", yytext()); }
">"                               { imprimir("Fin de etiqueta", yytext()); }

{ENTIDAD}                         { imprimir("Entidad HTML", yytext()); }
{TEXTO}                           { imprimir("Texto", yytext()); }

.                                 { imprimir("Simbolo desconocido", yytext()); }

<<EOF>>                           { return 0; }
