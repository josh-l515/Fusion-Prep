#!/bin/bash

# Capítulo III: Estática
dir="03_estatica"
mkdir -p "$dir"

declare -A temas=(
  ["3.1_concepto_de_fuerza"]="3.1 Concepto de fuerza"
  ["3.2_torque_momento"]="3.2 Torque o momento de una fuerza con respecto a un punto y respecto a un eje"
  ["3.3_sistema_de_fuerzas"]="3.3 Sistema de fuerzas: cupla o par de fuerzas, fuerzas concurrentes y fuerzas coplanares"
  ["3.4_teorema_de_varignon"]="3.4 Teorema de Varignon: aplicaciones"
  ["3.5_equilibrio"]="3.5 Equilibrio"
  ["3.6_aplicaciones"]="3.6 Aplicaciones"
)

for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree para Sphinx
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo III: Estática"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/${archivo}"
done
