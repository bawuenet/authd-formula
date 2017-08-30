---
{% from "authd/map.jinja" import authd with context -%}

authd_service:
  service.running:
    - name: {{ authd.service }}
    - enable: True
    - require:
      - pkg: {{ authd.package }}
