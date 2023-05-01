#!/bin/bash

# Inicializar contador de registros
total_registros=0

# Leer archivo de texto
while read -r line; do
  # Extraer segundo y tercer campo del registro
  field2=$(echo "$line" | cut -d "|" -f 2)
  field3=$(echo "$line" | cut -d "|" -f 3)

  # Verificar si archivo físico existe
  if test -e "$field2"; then
    # Contar número de líneas del archivo físico
    num_lines=$(wc -l < "$field2")

    # Imprimir archivo y número de registros
    echo "Archivo: $field2, Registros: $num_lines"

    # Añadir al contador total de registros
    total_registros=$((total_registros + num_lines))

    # Comparar número de líneas con tercer campo del registro
    if ((num_lines != field3)); then
      echo "El número de líneas del archivo $field2 no coincide con el valor en el registro del archivo."
    fi
  else
    echo "El archivo físico $field2 no existe."
  fi
done < control.txt

#generacion de log

echo "El archivo $archivo tiene $lineas lineas." >> archivo.log
