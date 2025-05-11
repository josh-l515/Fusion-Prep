#!/bin/bash

# Capítulo II: Vectores
dir="02_vectores"
mkdir -p "$dir"

declare -A temas=(
  ["2.1_magnitudes_escalaras"]="2.1 Magnitudes escalares"
  ["2.2_magnitudes_vectoriales"]="2.2 Magnitudes vectoriales"
  ["2.3_vectores_suma_y_diferencia"]="2.3 Vectores, suma y diferencia.-métodos algebraicos y geométricos"
  ["2.4_componentes_cartesianas"]="2.4 Componentes cartesianas de un vector en el plano y en espacio"
  ["2.5_operaciones_con_vectores"]="2.5 Operaciones con vectores: producto escalar, vectorial y sus aplicaciones"
  ["2.6_aplicaciones_triple_producto"]="2.6 Aplicaciones: triple producto escalar y vectorial"
)

for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo II: Vectores"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/${archivo}"
done
