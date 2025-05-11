#!/bin/bash

# Capítulo IV: Cinemática de una partícula
dir="04_cinematica"
mkdir -p "$dir"

declare -A temas=(
  ["4.1_repaso_calculo"]="4.1 Repaso de límites, diferenciales, derivadas, e integrales"
  ["4.2_movimiento_rectilineo"]="4.2 Movimiento rectilíneo: M.R.U, M.R.U.V. y caída libre"
  ["4.3_movimiento_compuesto"]="4.3 Movimiento compuesto"
  ["4.4_movimiento_curvilineo"]="4.4 Movimiento curvilíneo: posición, velocidad y aceleración, componentes tangencial y normal de la aceleración"
  ["4.5_movimiento_circular"]="4.5 Movimiento circular: M.C.U. y M.C.U.V."
  ["4.6_relatividad_movimiento"]="4.6 Relatividad del movimiento"
)

for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree para Sphinx o referencia general
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo IV: Cinemática de una partícula"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/${archivo}"
done
