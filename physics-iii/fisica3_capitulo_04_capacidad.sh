#!/bin/bash

# Capítulo 4: Capacidad
dir="04_capacidad"
mkdir -p "$dir"

declare -A temas=(
  ["4.1_capacidad"]="4.1 Capacidad"
  ["4.2_almacenamiento_de_la_energia_electrica"]="4.2 Almacenamiento de la energía eléctrica"
  ["4.3_condensadores_baterias_y_circuitos"]="4.3 Condensadores, baterías y circuitos"
  ["4.4_dielectricos"]="4.4 Dieléctricos"
  ["4.5_estructura_molecular_de_un_dielectrico"]="4.5 Estructura molecular de un dieléctrico"
)

# Crear archivos .md con título
for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree para pegar en Sphinx
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo 4: Capacidad"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/$archivo"
done
