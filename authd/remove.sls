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

authd_passwd_file_removed:
  file.absent:
    - name: {{ salt['pillar.get']('authd:pwdfile', '/etc/ident.key') }}

authd_systemd_override_removed:
  file.absent:
    - name: /etc/systemd/system/{{ authd.unit }}.service.d/override.conf
