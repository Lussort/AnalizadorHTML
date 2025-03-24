package analizador;

import java.io.*;

public class Principal {
    public static void main(String[] args) {
        try {
            // Archivo de entrada (el HTML)
            Reader lector = new BufferedReader(new FileReader("entrada html.txt"));

            // Archivo de salida para los tokens
            PrintWriter salida = new PrintWriter("salida.txt");

            // Analizador generado por JFlex
            Analizador analizador = new Analizador(lector);

            // Redirigir la salida del analizador al archivo
            analizador.setSalida(salida);

            // Ejecutar el análisis
            analizador.yylex();

            // Cerrar el archivo de salida
            salida.close();

            System.out.println("Análisis completado. Revisa salida.txt");

        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
