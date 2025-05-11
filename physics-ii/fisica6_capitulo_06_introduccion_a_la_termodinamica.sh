#!/bin/bash

# Capítulo VI: Introducción a la Termodinámica
dir="fisica6/06_introduccion_a_la_termodinamica"
mkdir -p "$dir"

# Declaración de temas
declare -A termodinamica=(
  ["6.1_primera_ley_termodinamica"]="6.1 Primera ley de la termodinámica"
  ["6.2_transformacion_isobárica"]="6.2 Transformación isobárica"
  ["6.3_transformacion_adiabatica"]="6.3 Transformación adiabática"
  ["6.4_dilatacion_libre"]="6.4 Dilatación libre"
  ["6.5_transformacion_isocorica"]="6.5 Transformación Isocórica"
  ["6.6_teoria_cinetica_de_los_gases"]="6.6 Teoría cinética de los gases"
  ["6.7_ecuacion_de_estado_de_un_gas_ideal"]="6.7 Ecuación de estado de un gas ideal"
  ["6.8_ley_de_dalton"]="6.8 Ley de Dalton"
  ["6.9_calor_especifico_de_un_gas_ideal"]="6.9 Calor específico de un gas ideal"
  ["6.10_proceso_reversible"]="6.10 Proceso reversible"
  ["6.11_ciclo_de_carnot"]="6.11 Ciclo de Carnot"
  ["6.12_eficiencia"]="6.12 Eficiencia"
  ["6.13_enunciado_de_kelvin_planck"]="6.13 Enunciado de Kelvin-Planck"
  ["6.14_enunciado_de_clausius"]="6.14 Enunciado de Claussius"
  ["6.15_teorema_de_carnot"]="6.15 Teorema de Carnot"
  ["6.16_entropia"]="6.16 Entropía"
  ["6.17_entropia_y_segunda_ley_termodinamica"]="6.17 Entropía y la segunda ley de la termodinámica"
)

# Crear archivos para cada tema
for archivo in "${!termodinamica[@]}"; do
  ruta="$dir/$archivo.md"
  mkdir -p "$dir"
  echo "# ${termodinamica[$archivo]}" >"$ruta"
done

# TOC opcional sin el prefijo 'fisica6/'
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo VI: Introducción a la Termodinámica"
echo ""
for archivo in $(printf "%s\n" "${!termodinamica[@]}" | sort); do
  echo "   06_introduccion_a_la_termodinamica/$archivo"
done
