#!/bin/bash

# Capítulo 3: Potencial Eléctrico
dir="03_potencial_electrico"
mkdir -p "$dir"

declare -A temas=(
  ["3.1_diferencia_de_potencial"]="3.1 Diferencia de potencial"
  ["3.2_potencial_debido_a_un_sistema_de_cargas_puntuales"]="3.2 Potencial debido a un sistema de cargas puntuales"
  ["3.3_determinacion_del_campo_electrico_a_partir_del_potencial"]="3.3 Determinación del campo eléctrico a partir del potencial"
  ["3.4_calculo_de_v_para_distribuciones_continuas_de_carga"]="3.4 Cálculo de V para distribuciones continuas de carga"
  ["3.5_superficies_equipotenciales_energia_potencial_electrostatica"]="3.5 Superficies equipotenciales. Energía potencial electrostática"
)

# Crear archivos .md con título
for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree para pegar en Sphinx
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo 3: Potencial Eléctrico"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/$archivo"
done
