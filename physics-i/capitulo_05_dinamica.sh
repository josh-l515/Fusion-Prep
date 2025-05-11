#!/bin/bash

# Capítulo V: Dinámica de una partícula
dir="05_dinamica"
mkdir -p "$dir"

declare -A temas=(
  ["5.1_leyes_newton"]="5.1 Leyes de Newton del movimiento: 1ra, 2da y 3ra ley, masa, peso y fuerza - unidades de medida"
  ["5.2_tipos_fuerza"]="5.2 Tipos de fuerza: fuerzas de fricción, fuerzas elásticas, fuerzas en cuerdas y fuerzas de cohesión"
  ["5.3_dinamica_circular"]="5.3 Dinámica del movimiento circular"
  ["5.4_problemas_aplicacion"]="5.4 Problemas de aplicación"
)

for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree (opcional)
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo V: Dinámica de una partícula"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/${archivo}"
done
