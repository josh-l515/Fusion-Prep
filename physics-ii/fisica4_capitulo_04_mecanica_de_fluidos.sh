#!/bin/bash

# Capítulo IV: Mecánica de Fluidos
dir="fisica4/04_mecanica_de_fluidos"
mkdir -p "$dir"

# Parte I: Hidrostática
declare -A hidrostatica=(
  ["4.1_fluido"]="4.1 Fluido"
  ["4.2_densidad"]="4.2 Densidad"
  ["4.3_peso_especifico"]="4.3 Peso específico"
  ["4.4_densidad_relativa"]="4.4 Densidad relativa"
  ["4.5_presion"]="4.5 Presión"
  ["4.6_variacion_de_la_presion"]="4.6 Variación de la presión en un fluido en reposo"
  ["4.7_equilibrio_liquidos_no_miscibles"]="4.7 Equilibrio de los líquidos no miscibles en vasos comunicantes"
  ["4.8_fuerza_ejercida_pared_recipiente"]="4.8 Fuerza ejercida sobre la pared de un recipiente"
  ["4.9_principio_de_pascal"]="4.9 Principio de Pascal"
  ["4.10_principio_de_arquimedes"]="4.10 Principio de Arquímedes"
  ["4.11_manometro"]="4.11 Manómetro"
  ["4.12_fuerzas_moleculares_liquidos"]="4.12 Fuerzas moleculares en los líquidos"
  ["4.13_tension_superficial"]="4.13 Tensión superficial"
  ["4.14_formacion_de_una_gota_liquida"]="4.14 Formación de una gota líquida"
  ["4.15_formacion_de_una_burbuja_jabon"]="4.15 Formación de una burbuja de jabón"
  ["4.16_ascenso_liquidos_tubos_capilares"]="4.16 Ascenso de líquidos en tubos capilares"
  ["4.17_aplicaciones_tension_superficial"]="4.17 Aplicaciones de la tensión superficial"
)

# Parte II: Hidrodinámica
declare -A hidrodinamica=(
  ["4.18_lineas_de_flujo"]="4.18 Líneas de flujo"
  ["4.19_principio_fundamentales"]="4.19 Principio fundamentales"
  ["4.20_tipos_de_flujo"]="4.20 Tipos de flujo"
  ["4.21_ecuacion_de_continuidad"]="4.21 Ecuación de continuidad"
  ["4.22_ecuacion_de_bernoulli"]="4.22 Ecuación de Bernoulli"
  ["4.23_teorema_de_torricelli"]="4.23 Teorema de Torricelli"
  ["4.24_tubo_de_venturi"]="4.24 Tubo de venturi"
  ["4.25_tubo_de_pitot"]="4.25 Tubo de Pitot"
  ["4.26_flujo_de_fluidos_viscosos"]="4.26 Flujo de fluidos viscosos"
  ["4.27_numero_de_reynolds"]="4.27 Número de Reynolds"
  ["4.28_ley_de_stokes"]="4.28 Ley de Stokes"
)

# Crear archivos para Hidrostática
for archivo in "${!hidrostatica[@]}"; do
  ruta="$dir/hidrostatica/$archivo.md"
  mkdir -p "$dir/hidrostatica"
  echo "# ${hidrostatica[$archivo]}" >"$ruta"
done

# Crear archivos para Hidrodinámica
for archivo in "${!hidrodinamica[@]}"; do
  ruta="$dir/hidrodinamica/$archivo.md"
  mkdir -p "$dir/hidrodinamica"
  echo "# ${hidrodinamica[$archivo]}" >"$ruta"
done

# TOC opcional sin el prefijo 'fisica4/'
echo -e "\n.. toctree::"
echo "   :maxdepth: 2"
echo "   :caption: Capítulo IV: Mecánica de Fluidos"
echo ""
for archivo in $(printf "%s\n" "${!hidrostatica[@]}" | sort); do
  echo "   04_mecanica_de_fluidos/hidrostatica/$archivo"
done
for archivo in $(printf "%s\n" "${!hidrodinamica[@]}" | sort); do
  echo "   04_mecanica_de_fluidos/hidrodinamica/$archivo"
done
