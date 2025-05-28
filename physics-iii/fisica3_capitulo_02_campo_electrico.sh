#!/bin/bash

# Capítulo II: Campo Eléctrico
dir="capitulo_02_campo_electrico"
mkdir -p "$dir"

declare -A temas=(
  ["2.1_campo_electrico_i_distribuciones_discretas_de_carga"]="2.1 Campo Eléctrico I: Distribuciones Discretas de carga"
  ["2.2_lineas_de_campo_electrico"]="2.2 Líneas de Campo Eléctrico"
  ["2.3_campo_de_un_dipolo_electrico"]="2.3 Campo de un Dipolo Eléctrico"
  ["2.4_accion_del_campo_electrico_sobre_las_cargas"]="2.4 Acción del campo eléctrico sobre las cargas"
  ["2.5_campo_electrico_ii_distribuciones_continuas_de_carga"]="2.5 Campo Eléctrico II: Distribuciones Continuas de Carga"
  ["2.6_calculo_del_campo_electrico_mediante_la_ley_de_coulomb"]="2.6 Cálculo del Campo Eléctrico Mediante la Ley de Coulomb"
  ["2.7_ley_de_gauss"]="2.7 Ley de Gauss"
  ["2.8_calculo_del_campo_electrico_con_la_ley_de_gauss_utilizando_simetria"]="2.8 Cálculo del Campo Eléctrico con la ley de Gauss utilizando simetría"
  ["2.9_carga_y_campo_en_la_superficie_de_los_conductores"]="2.9 Carga y Campo en la Superficie de los Conductores"
)

# Crear archivos .md con título
for archivo in "${!temas[@]}"; do
  ruta="$dir/$archivo.md"
  echo "# ${temas[$archivo]}" >"$ruta"
done

# Mostrar toctree para pegar en Sphinx
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo II: Campo Eléctrico"
echo ""
for archivo in "${!temas[@]}"; do
  echo "   $dir/$archivo"
done
