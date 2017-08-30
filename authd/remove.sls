---
{% from "authd/map.jinja" import authd with context -%}

authd_removed:
  service.dead:
    - enable: False
    - name: {{ authd.service }}
  pkg.removed:
    - name: {{ authd.package }}
    - require:
      - service: {{ authd.service }}
