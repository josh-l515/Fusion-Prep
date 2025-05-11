#!/bin/bash

# Capítulo II: Movimiento Oscilatorio
dir="fisica2/02_movimiento_oscilatorio"
mkdir -p "$dir"

declare -A temas=(
  ["2.1_movimiento_periodico"]="2.1 Movimiento periódico"
  ["2.2_movimiento_oscilatorio"]="2.2 Movimiento oscilatorio"
  ["2.3_movimiento_armonico_simple"]="2.3 Movimiento armónico simple"
  ["2.4_energia_almacenada_mas"]="2.4 Energía almacenada en un M.A.S"
  ["2.5_pendulo_simple"]="2.5 Péndulo simple"
  ["2.6_pendulo_compuesto"]="2.6 Péndulo compuesto"
  ["2.7_pendulo_torsion"]="2.7 Péndulo de Torsión"
  ["2.8_superposicion_mas"]="2.8 Superposición de M.A.S."
  ["2.9_movimiento_oscilatorio_amortiguado"]="2.9 Movimiento oscilatorio amortiguado"
  ["2.10_movimiento_oscilatorio_forzado"]="2.10 Movimiento oscilatorio forzado"
)

for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# TOC opcional sin el prefijo 'fisica2/'
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo II: Movimiento Oscilatorio"
echo ""
for archivo in $(printf "%s\n" "${!temas[@]}" | sort); do
  echo "   02_movimiento_oscilatorio/$archivo"
done
