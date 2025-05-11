{# sourcelink.html #}
{% if show_source and has_source and sourcename %}
  <div class="tocsection sourcelink">
    <a href="{{ pathto('_sources/' + sourcename, true)|e }}">
      <i class="fa-solid fa-file-lines"></i> {{ _("HOLA") }}
    </a>
  </div>
{% endif %}

{# Enlaces personalizados definidos en los archivos .md #}
{% if meta and meta.this_page_links %}
  <div class="tocsection custom-links">
    <h3>Recursos</h3>
    <ul>
      {% for label, url in meta.this_page_links %}
        <li><a href="{{ url }}" target="_blank">{{ label }}</a></li>
      {% endfor %}
    </ul>
  </div>
{% endif %}
