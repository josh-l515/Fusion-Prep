#!/bin/bash

# Capítulo I: Elasticidad
dir="fisica2/01_elasticidad"
mkdir -p "$dir"

declare -A temas=(
  ["1.1_solidos"]="1.1 Sólidos"
  ["1.2_fuerzas_elasticas"]="1.2 Fuerzas elásticas"
  ["1.3_elasticidad"]="1.3 Elasticidad"
  ["1.4_deformacion"]="1.4 Deformación"
  ["1.5_esfuerzo"]="1.5 Esfuerzo"
  ["1.6_ley_de_hooke"]="1.6 Ley de Hooke"
  ["1.7_deformacion_longitudinal"]="1.7 Deformación longitudinal o unilateral"
  ["1.8_deformacion_multilateral"]="1.8 Deformación Multilateral o Volumétrica"
  ["1.9_deformacion_cizalladura"]="1.9 Deformación por cizalladura"
  ["1.10_deformacion_lateral"]="1.10 Deformación lateral"
  ["1.11_torsion"]="1.11 Torsión"
  ["1.12_energia_elastica"]="1.12 Energía elástica acumulada en una barra"
)

for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# TOC opcional
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo I: Elasticidad"
echo ""
for archivo in $(printf "%s\n" "${!temas[@]}" | sort); do
  echo "   $dir/$archivo"
done
