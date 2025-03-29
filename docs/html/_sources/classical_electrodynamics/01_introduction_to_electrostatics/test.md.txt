# Fundamentos matematicos

## Variedades diferenciales

Una variedad diferencial $\mathcal{M}$ es una generalización matemática
del concepto de curvas y superficies suaves, como una esfera o un plano,
extendida a espacios de dimensiones superiores. Formalmente, es un
espacio topológico que, localmente, es homeomorfo al espacio euclidiano
$\mathbb{R}^m$, donde $m$ es la dimensión de la variedad. Decir que un
espacio es localmente homeomorfo a $\mathbb{R}^m$, significa que, en
regiones pequeñas, la variedad se comporta como el espacio euclidiano de
dimensión $m$, aunque globalmente pueda tener una estructura más
compleja y no ser homeomorfa a $\mathbb{R}^m$, en su totalidad.

Este homeomorfismo local permite asignar a cada punto de $\mathcal{M}$
un conjunto de $m$ números, llamados coordenadas locales. Si
$\mathcal{M}$ no es globalmente homeomorfa a $\mathbb{R}^m$, es
necesario introducir múltiples sistemas de coordenadas locales para
cubrirla completamente. Para que la variedad sea ademas diferencial, se
requiere que las transiciones entre estos sistemas de coordenadas sean
suaves (diferenciables). Esta condición es crucial, ya que permite
extender las herramientas del cálculo diferencial e integral a estos
espacios más generales. Estrictamente la **variedad diferencial**
$\mathcal{M}$ de dimensión $m$ se define mediante las siguientes
condiciones [@Nakahara2003]:

1.  **Espacio topológico**: $\mathcal{M}$ es un espacio topológico.

2.  **Atlas y cartas**: $\mathcal{M}$ está equipado con una familia de
    pares $\{(U_i, \phi_i)\}$, donde:

    - $\{U_i\}$ es una familia de conjuntos abiertos que cubren
      $\mathcal{M}$, es decir, $\bigcup_i U_i = \mathcal{M}$.

    - $\phi_i$ es un **homeomorfismo** que mapea cada $U_i$ a un
      subconjunto abierto $\tilde{U}_i$ de $\mathbb{R}^m$. Esto
      significa que $\phi_i: U_i \to \tilde{U}_i \subset \mathbb{R}^m$.

    Cada par $(U_i, \phi_i)$ se llama una **carta**, y la colección
    completa $\{(U_i, \phi_i)\}$ se denomina un **atlas**.

3.  **Coordenadas locales**: Para cada punto $p \in U_i$, el
    homeomorfismo $\phi_i$ asigna $m$ números reales
    $\{x^1(p), \dots, x^m(p)\}$, que se conocen como las **coordenadas
    locales** de $p$. Estas coordenadas permiten describir localmente la
    variedad como un subconjunto abierto de $\mathbb{R}^m$.

4.  **Transiciones suaves**: Si dos conjuntos abiertos $U_i$ y $U_j$ se
    solapan, es decir, $U_i \cap U_j \neq \emptyset$, entonces la
    función de transición $\psi_{ij} = \phi_i \circ \phi_j^{-1}$ debe
    ser **infinitamente diferenciable** (suave). Esta función mapea las
    coordenadas de $\phi_j(U_i \cap U_j)$ a las coordenadas de
    $\phi_i(U_i \cap U_j)$, asegurando que los cambios entre sistemas de
    coordenadas sean suaves.

En el contexto de esta tesis, estas estructuras permiten describir de
manera rigurosa y flexible la geometría del espacio-tiempo en 5
dimensiones, donde se estudia una familia de soluciones de agujeros
negros en teorías de Gauss-Bonnet. Estas teorías, que generalizan la
relatividad general al incluir términos de curvatura de orden superior,
requieren un entendimiento minucioso de la geometría diferencial para
derivar y analizar las ecuaciones de campo.

- **Rama "menos"** ($f(r)_-$): Al tomar el signo negativo se obtiene la
  rama que, en el límite $\alpha\to0$, se reduce a la solución clásica
  de Schwarzschild--AdS en 5D. Es decir, al expandir en series de
  $\alpha$ se tiene

  $$
  f(r)_- = k + \frac{r^2}{l^2} - \frac{c_1}{r^2l^2} + \mathcal{O}(\alpha)
  $$

  lo cual permite identificar la constante de integración con el
  parámetro de masa del agujero negro (redefiniendo, si conviene,
  $M=c_1/l^2$).

- **Rama "más"** ($f(r)_+$): La otra posibilidad corresponde a la
  solución con el signo positivo. Esta rama no posee el límite de
  Einstein ($\alpha\to0$) y se conoce como la solución exótica. Dado que
  no se recupera la gravedad clásica en este límite, generalmente se
  descarta por razones de consistencia física y estabilidad.
