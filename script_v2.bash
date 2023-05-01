#!/bin/bash

# ruta del archivo de texto
archivo_texto="/Users/torres./Desktop/Scripting/control.txt"

# contador de registros
cont_registros=0

# leer todas las líneas del archivo de texto
while read linea; do

  # extraer el segundo y tercer campo de la línea
  campo2=$(echo "$linea" | cut -d "|" -f 2)
  campo3=$(echo "$linea" | cut -d "|" -f 3)

  # verificar si existe el archivo físico con el mismo nombre que el segundo campo
  archivo_fisico="/Users/torres./Desktop/Scripting/$campo2"
  if [[ -e "$archivo_fisico" ]]; then
    echo "El archivo físico $campo2.txt existe."
  else
    echo "El archivo físico $campo2.txt no existe."
  fi

  # contar número de líneas del archivo físico
  num_lineas=$(wc -l < "$archivo_fisico")

  # agregar número de líneas al contador de registros
  cont_registros=$((cont_registros + num_lineas))

done < "$archivo_texto"

# comparar contador de registros con el número de registros en el archivo de texto
#!/bin/bash

# Leer archivo de texto
while read -r line; do
  # Extraer segundo y tercer campo del registro
  field2=$(echo "$line" | cut -d "|" -f 2)
  field3=$(echo "$line" | cut -d "|" -f 3)

  # Verificar si archivo físico existe
  if test -e "$field2"; then
    # Contar número de líneas del archivo físico
    num_lines=$(wc -l < "$field2")

    # Comparar número de líneas con tercer campo del registro
    if ((num_lines != field3)); then
      echo "El número de líneas del archivo $field2 no coincide con el valor en el registro del archivo."
    fi
  else
    echo "El archivo físico $field2 no existe."
  fi
done < archivo_texto

