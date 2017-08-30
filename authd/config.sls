---
{% from "authd/map.jinja" import authd with context -%}

{% if salt['pillar.get']('authd:passphrase') -%}
authd_passwd_file:
  file.managed:
    - name: {{ salt['pillar.get']('authd:pwdfile', '/etc/ident.key') }}
    - contents: |
        {{ salt['pillar.get']('authd:passphrase') }}

    - user: {{ authd.user }}
    - group: {{ authd.user }}
    - mode: 0600
{% endif -%}

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
