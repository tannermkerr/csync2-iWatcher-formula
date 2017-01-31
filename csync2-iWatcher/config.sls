{% from "csync2-iWatcher/map.jinja" import iWatcher, csync2 with context %}

iWatcher-config:
  file.managed:
    - name: /etc/iWatcher.conf
    - source: salt://csync2-iWatcher/templates/iWatcher_config.jinja
    - template: jinja

csync2-config:
  file.managed:
    - name: /etc/csync2_{{ iWatcher.flavour }}.cfg
    - source: salt://csync2-iWatcher/templates/csync2.jinja
    - template: jinja

append-csync2-service:
  file.append:
    - name: /etc/services
    - text:
      - "csync2        30865/tcp           # cluster synchronization tool"

csync2-key:
  file.managed:
    - name: {{ csync2.key_loc }} 
    - source: salt://csync2-iWatcher/csync2.key
    - mode: 600
