#!/bin/bash

# Capítulo 9: Circuitos de Corriente Alterna
dir="09_corriente_alterna"
mkdir -p "$dir"

declare -A temas=(
  ["9.1_ca_resistencia"]="9.1 Corriente alterna en una resistencia"
  ["9.2_circuitos_ca"]="9.2 Circuitos de corriente alterna"
  ["9.3_transformador"]="9.3 El transformador"
  ["9.5_circuitos_lc_lcr"]="9.5 Circuitos LC y LCR sin generador"
  ["9.6_fasores"]="9.6 Fasores"
  ["9.7_lcr_con_generador"]="9.7 Circuitos LCR con generador"
)

# Crear archivos .md con títulos
for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree para Sphinx
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo 9: Circuitos de Corriente Alterna"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/$archivo"
done
