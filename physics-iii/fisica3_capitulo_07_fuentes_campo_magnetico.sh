#!/bin/bash

# Capítulo 7: Fuentes de Campo Magnético
dir="07_fuentes_campo_magnetico"
mkdir -p "$dir"

declare -A temas=(
  ["7.1_campo_cargas_movimiento"]="7.1 Campo magnético creado por cargas puntuales en movimiento"
  ["7.2_biot_savart"]="7.2 Campo magnético creado por corrientes eléctricas: ley de Biot y Savart"
  ["7.3_ley_gauss_magnetismo"]="7.3 Ley de Gauss para el magnetismo"
  ["7.4_ley_ampere"]="7.4 Ley de Ampère"
  ["7.5_magnetismo_materia"]="7.5 El magnetismo en la materia"
)

# Crear archivos .md con títulos
for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree para Sphinx
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo 7: Fuentes de Campo Magnético"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/$archivo"
done
