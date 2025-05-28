#!/bin/bash

# Capítulo 5: Corriente Eléctrica y Circuitos de Corriente Continua
dir="05_corriente_y_cc"
mkdir -p "$dir"

declare -A temas=(
  ["5.1_corriente_y_ley_de_ohm"]="5.1 Corriente y movimiento de cargas. Resistencia y ley de Ohm"
  ["5.2_energia_en_circuitos"]="5.2 La energía en los circuitos eléctricos"
  ["5.3_asociaciones_de_resistencias"]="5.3 Asociaciones de resistencias"
  ["5.4_reglas_de_kirchhoff"]="5.4 Reglas de Kirchhoff"
  ["5.5_circuitos_rc"]="5.5 Circuitos RC"
)

# Crear archivos .md con título
for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree para pegar en Sphinx
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo 5: Corriente Eléctrica y Circuitos de Corriente Continua"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/$archivo"
done
