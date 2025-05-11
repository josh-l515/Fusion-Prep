#!/bin/bash

# Capítulo VIII: Momentum Angular
dir="08_momentum_angular"
mkdir -p "$dir"

declare -A temas=(
  ["8.1_momentum_angular_particula"]="8.1 Momentum angular de una partícula y de un sistema de partículas"
  ["8.2_conservacion_momentum"]="8.2 Conservación del Momentum Angular"
  ["8.3_momentum_cuerpo_rigido"]="8.3 Momentum angular de un cuerpo rígido"
  ["8.4_momento_inercia"]="8.4 Cálculo del momento de inercia de masas discretas y continuas – teorema de los ejes paralelos"
  ["8.5_aplicaciones"]="8.5 Aplicaciones y problemas"
)

for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree (opcional)
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo VIII: Momentum Angular"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/${archivo}"
done
