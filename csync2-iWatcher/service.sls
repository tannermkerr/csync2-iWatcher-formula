include:
  - csync2-iWatcher.install
  - csync2-iWatcher.config

iWatcher-service:
  service.running:
    - name: iWatcher
    - enable: True
    - require:
      - sls: csync2-iWatcher.install
    - watch: 
      - file: /etc/iWatcher.conf
      - file: {{ pillar['iWatcher']['executable'] }}
