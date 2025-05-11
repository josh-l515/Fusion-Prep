#!/bin/bash

# Capítulo IX: Dinámica de Rotación
dir="09_dinamica_rotacion"
mkdir -p "$dir"

declare -A temas=(
  ["9.1_ecuaciones_rotacion"]="9.1 Ecuaciones del movimiento para la rotación de un cuerpo rígido"
  ["9.2_energia_cinetica_rotacion"]="9.2 Energía cinética de rotación"
  ["9.3_trabajo_potencia"]="9.3 Trabajo y potencia"
  ["9.4_rotacion_traslacion"]="9.4 Rotación y traslación"
  ["9.5_precesion"]="9.5 Precesión"
  ["9.6_problemas_aplicacion"]="9.6 Problemas de aplicación"
)

for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree (opcional)
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo IX: Dinámica de Rotación"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/${archivo}"
done
