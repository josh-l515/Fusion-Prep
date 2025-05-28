#!/bin/bash

# Capítulo 8: Inducción Magnética
dir="08_induccion_magnetica"
mkdir -p "$dir"

declare -A temas=(
  ["8.1_flujo_magnetico"]="8.1 Flujo magnético"
  ["8.2_fem_faraday"]="8.2 Fem inducida y ley de Faraday"
  ["8.3_ley_lenz"]="8.3 Ley de Lenz"
  ["8.4_fem_movimiento"]="8.4 Fem de movimiento"
  ["8.5_corrientes_foucault"]="8.5 Corrientes de Foucault o turbillonarias"
  ["8.6_inductancia"]="8.6 Inductancia"
  ["8.7_energia_magnetica"]="8.7 Energía magnética"
  ["8.8_circuitos_rl"]="8.8 Circuitos RL"
  ["8.9_superconductores"]="8.9 Propiedades magnéticas de los superconductores"
)

# Crear archivos .md con títulos
for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree para Sphinx
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo 8: Inducción Magnética"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/$archivo"
done
