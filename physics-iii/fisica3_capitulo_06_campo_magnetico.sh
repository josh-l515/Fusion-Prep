#!/bin/bash

# Capítulo 6: El Campo Magnético
dir="06_campo_magnetico"
mkdir -p "$dir"

declare -A temas=(
  ["6.1_fuerza_campo_magnetico"]="6.1 Fuerza ejercida por un campo magnético"
  ["6.2_movimiento_carga_campo_magnetico"]="6.2 Movimiento de una carga puntual en un campo magnético"
  ["6.3_momentos_sobre_espiras_e_imanes"]="6.3 Momentos de fuerza sobre espiras de corriente e imanes"
  ["6.4_efecto_hall"]="6.4 Efecto Hall"
)

# Crear archivos .md con título
for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree para pegar en Sphinx
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo 6: El Campo Magnético"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/$archivo"
done
