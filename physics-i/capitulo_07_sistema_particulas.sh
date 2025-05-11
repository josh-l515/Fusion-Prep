#!/bin/bash

# Capítulo VII: Dinámica de un sistema de partículas
dir="07_sistema_particulas"
mkdir -p "$dir"

declare -A temas=(
  ["7.1_centro_de_masa"]="7.1 Centro de masa.- Cálculo del C.M. de distribuciones de masa discreta y continuas: en líneas, áreas y volúmenes"
  ["7.2_movimiento_cm"]="7.2 Movimiento del Centro de Masa de un sistema de partículas"
  ["7.3_cantidad_movimiento"]="7.3 Cantidad de movimiento y Conservación de la Cantidad de Movimiento lineal"
  ["7.4_energia_cinetica"]="7.4 Energía cinética para un sistema de partículas"
  ["7.5_impulso"]="7.5 Impulso y promedio temporal de una fuerza"
  ["7.6_colisiones"]="7.6 Colisiones en una, dos y tres dimensiones"
  ["7.7_problemas_aplicacion"]="7.7 Problemas de aplicación"
)

for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree (opcional)
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo VII: Dinámica de un sistema de partículas"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/${archivo}"
done
