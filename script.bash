#!/bin/bash

# Definir el archivo TXT a leer
archivo_txt="/control.txt"

# Leer la primera línea del archivo TXT y almacenarla en una variable
read -r linea < "$archivo_txt"

# Extraer el segundo y tercer campo del registro utilizando el delimitador de pipe "|"
segundo_campo=$(echo "$linea" | cut -d "|" -f 2)
tercer_campo=$(echo "$linea" | cut -d "|" -f 3)

# Verificar si existe el archivo físico con el nombre extraído del segundo campo
if test -e "$segundo_campo"; then
    echo "El archivo físico: $segundo_campo existe."
else
    echo "El archivo físico: $segundo_campo no existe."
fi

# contar número de líneas del archivo físico
num_lineas=$(wc -l < "$segundo_campo")

echo "valor del tercer campo: $num_lineas" 
# comparar el tercer campo con el número de líneas del archivo físico
if [[ "$tercer_campo" -eq "$num_lineas" ]]; then
  echo "El número de líneas del archivo físico coincide con el tercer campo."
else
  echo "El número de líneas del archivo físico no coincide con el tercer campo."
fi
