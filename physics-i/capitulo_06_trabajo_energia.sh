#!/bin/bash

# Capítulo VI: Trabajo y energía
dir="06_trabajo_energia"
mkdir -p "$dir"

declare -A temas=(
  ["6.1_trabajo_fuerza_constante"]="6.1 Trabajo realizado por una fuerza constante – unidades"
  ["6.2_trabajo_fuerza_variable"]="6.2 Trabajo realizado por una fuerza variable en trayectorias rectilínea y curvilínea"
  ["6.3_potencia"]="6.3 Potencia – unidades"
  ["6.4_energia_cinetica"]="6.4 Energía cinética – teorema del trabajo y la energía cinética"
  ["6.5_energia_potencial"]="6.5 Energía potencial: Gravitacional y elástica – Teorema del trabajo y la energía potencial"
  ["6.6_fuerzas_conservativas"]="6.6 Fuerzas conservativas y no conservativas"
  ["6.7_conservacion_energia"]="6.7 Conservación de la energía"
  ["6.8_trabajo_friccion"]="6.8 Trabajo realizado por la fuerza de fricción"
)

for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree (opcional)
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo VI: Trabajo y energía"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/${archivo}"
done
