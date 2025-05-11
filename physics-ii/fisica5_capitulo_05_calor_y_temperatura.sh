#!/bin/bash

# Capítulo V: Calor y Temperatura
dir="fisica5/05_calor_y_temperatura"
mkdir -p "$dir"

# Declaración de temas
declare -A calor_temperatura=(
  ["5.1_ley_cero_termodinamica"]="5.1 Ley cero de la termodinámica"
  ["5.2_concepto_de_temperatura"]="5.2 Concepto de temperatura"
  ["5.3_dilatacion_por_temperatura"]="5.3 Dilatación por temperatura"
  ["5.4_dilatacion_de_liquidos"]="5.4 Dilatación de líquidos"
  ["5.5_calor"]="5.5 Calor"
  ["5.6_cantidad_de_calor"]="5.6 Cantidad de calor"
  ["5.7_calor_especifico"]="5.7 Calor específico"
  ["5.8_cambios_de_estado"]="5.8 Cambios de estado"
  ["5.9_propagacion_del_calor"]="5.9 Propagación del calor"
  ["5.10_diferencia_entre_calor_y_trabajo"]="5.10 Diferencia entre calor y trabajo"
)

# Crear archivos para cada tema
for archivo in "${!calor_temperatura[@]}"; do
  ruta="$dir/$archivo.md"
  mkdir -p "$dir"
  echo "# ${calor_temperatura[$archivo]}" >"$ruta"
done

# TOC opcional sin el prefijo 'fisica5/'
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo V: Calor y Temperatura"
echo ""
for archivo in $(printf "%s\n" "${!calor_temperatura[@]}" | sort); do
  echo "   05_calor_y_temperatura/$archivo"
done
