#!/bin/bash

# Capítulo III: Movimiento Ondulatorio
dir="fisica3/03_movimiento_ondulatorio"
mkdir -p "$dir"

declare -A temas=(
  ["3.1_ondas_mecanicas"]="3.1 Ondas mecánicas"
  ["3.2_tipos_de_ondas"]="3.2 Tipos de ondas"
  ["3.3_frente_de_ondas"]="3.3 Frente de ondas"
  ["3.4_ecuacion_diferencial_del_movimiento_ondulatorio"]="3.4 Ecuación diferencial del movimiento ondulatorio"
  ["3.5_velocidad_de_grupo"]="3.5 Velocidad de grupo"
  ["3.6_ondas_transversales_en_una_cuerda"]="3.6 Ondas transversales en una cuerda"
  ["3.7_ondas_longitudinales_en_una_barra"]="3.7 Ondas longitudinales en una barra"
  ["3.8_ondas_longitudinales_de_presion_en_una_columna_de_gas_encerrada"]="3.8 Ondas longitudinales de presión en una columna de gas encerrada"
  ["3.9_ondas_estacionarias"]="3.9 Ondas estacionarias"
  ["3.10_intensidad_de_la_onda"]="3.10 Intensidad de la onda"
  ["3.11_ondas_sonoras"]="3.11 Ondas sonoras"
  ["3.12_efecto_doppler"]="3.12 Efecto Doppler"
)

for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# TOC opcional sin el prefijo 'fisica3/'
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo III: Movimiento Ondulatorio"
echo ""
for archivo in $(printf "%s\n" "${!temas[@]}" | sort); do
  echo "   03_movimiento_ondulatorio/$archivo"
done
