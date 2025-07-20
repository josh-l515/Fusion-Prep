# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html
# -- Path setup --------------------------------------------------------------
import os
import sys

sys.path.insert(0, os.path.abspath('.'))
# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "J's PhysiXLab"
copyright = '2025, Josué David Huallpa Aimituma'
author = 'Josué David Huallpa Aimituma'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["myst_parser", 
              "nbsphinx", 
              'sphinx_copybutton',]  # esta es la extensión para el botón de copiar]

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

# katex_inline = [r'$', r'$']  # Para ecuaciones en línea
# katex_display = [r'$$', r'$$']  # Para ecuaciones en bloque

myst_enable_extensions = [
    "colon_fence",
    "linkify",
    "substitution",
    "dollarmath",  # <-- esta línea permite ecuaciones en $...$ y $$...$$
    "attrs_block", # Activa el uso de metadata desde los archivos .md 
    "deflist",            # Opcional, listas de definiciones
]

math_number_all = True  # Numera todas las ecuaciones con etiqueta
numfig = True           # Para referencias como figuras, tablas, ecuaciones, etc.
# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'pydata_sphinx_theme'
html_static_path = ['_static']

html_baseurl = "https://josh-l515.github.io/Fusion-Prep/"


html_theme_options = {
    "external_links": [
        {
            "url": "https://pydata.org",
            "name": "PyData Website",
        },
        {
            "url": "https://numfocus.org/",
            "name": "NumFocus",
        },
        {
            "url": "https://numfocus.org/donate",
            "name": "Donate to NumFocus",
        },
    ],
    "header_links_before_dropdown": 4,
    "icon_links": [
        {
            "name": "X",
            "url": "https://x.com/DHAJosh1",
            "icon": "fa-brands fa-x-twitter",
        },
        {
            "name": "GitHub",
            "url": "https://github.com/josh-l515/Fusion-Prep",
            "icon": "fa-brands fa-github",
        },
  
    ],
    "use_edit_page_button": True,

    # [left, content, right] For testing that the navbar items align properly
    "footer_start": ["copyright"],
    "footer_center": ["sphinx-version"],
    # "back_to_top_button": False,
    # "search_as_you_type": True,
    "show_toc_level": 2,

    # "show_prev_next": False,  # Ocultar botones de navegación anteriores/siguientes
    # "navbar_end": ["navbar-icon-links"],  # Personalizar enlaces al final de la barra
    "show_nav_level": 2,  # Mostrar subniveles en la navegación lateral
    "collapse_navigation": True,  # Colapsar automáticamente subniveles
    "navigation_depth": 3,  # Profundidad máxima de navegación en el sidebar
    # "secondary_sidebar_items": ["page-toc", "edit-this-page"],  # Elementos en la barra lateral
}

html_context = {
    # "github_url": "https://github.com", # or your GitHub Enterprise site
    "github_user": "josh-l515",
    "github_repo": "Fusion-Prep",
    "github_version": "main",
    "doc_path": "",
    "default_mode": "light",
}

html_sidebars = {
    "**": [
        "search-field.html",
        "sidebar-nav-bs.html", 
        # "custom-this-page.html",  # Bloque personalizado
    ]
}
html_show_sourcelink = True
