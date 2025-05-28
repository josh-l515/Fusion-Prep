#!/bin/bash

# Capítulo 10: Ecuaciones de Maxwell y Ondas Electromagnéticas
dir="10_maxwell_ondas_electromagneticas"
mkdir -p "$dir"

declare -A temas=(
  ["10.1_corriente_desplazamiento"]="10.1 Corriente de desplazamiento de Maxwell"
  ["10.2_ecuaciones_maxwell"]="10.2 Ecuaciones de Maxwell"
  ["10.3_ecuacion_ondas"]="10.3 La ecuación de ondas para las ondas electromagnéticas"
  ["10.4_radiacion_electromagnetica"]="10.4 Radiación electromagnética"
)

# Crear archivos .md con títulos
for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree para Sphinx
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo 10: Ecuaciones de Maxwell y Ondas Electromagnéticas"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/$archivo"
done
