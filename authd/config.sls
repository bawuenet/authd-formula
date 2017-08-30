---
{% from "authd/map.jinja" import authd with context -%}

authd_systemd_override:
  file.managed:
    - name: /etc/systemd/system/{{ authd.unit }}.service.d/override.conf
    - source: salt://authd/files/auth.override
    - template: jinja
    - makedirs: True
    - onchanges_in:
      - module: authd_systemd_reload

authd_systemd_reload:
  module.run:
    - name: service.systemctl_reload
