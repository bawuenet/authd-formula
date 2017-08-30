---
{% from "authd/map.jinja" import authd with context -%}

authd_package:
  pkg.installed:
    - name: {{ authd.package }}
