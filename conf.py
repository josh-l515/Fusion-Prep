# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html
# -- Path setup --------------------------------------------------------------
import os
import sys
from pathlib import Path

sys.path.append(str(Path(".").resolve()))
# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Fusion-Prep'
copyright = '2025, Josué David Huallpa Aimituma'
author = 'Josué David Huallpa Aimituma'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["myst_parser", "nbsphinx",  'sphinxcontrib.katex']

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

katex_inline = [r'$', r'$']  # Para ecuaciones en línea
katex_display = [r'$$', r'$$']  # Para ecuaciones en bloque

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'pydata_sphinx_theme'
html_static_path = ['_static']

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
            "url": "https://x.com/PyData",
            "icon": "fa-brands fa-x-twitter",
        },
        {
            "name": "GitHub",
            "url": "https://github.com/pydata/pydata-sphinx-theme",
            "icon": "fa-brands fa-github",
        },
  
    ],
    # "use_edit_page_button": True,

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


