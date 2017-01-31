{% from "csync2-iWatcher/map.jinja" import iWatcher with context %}

iWatcher-executable-file:
  file.managed:
    - name: {{ iWatcher.executable }}
    - source: salt://csync2-iWatcher/templates/iWatcher.jinja
    - template: jinja
    - mode: 755

iWatcher-service-file:
  file.managed:
    - name: /etc/systemd/system/iWatcher.service
    - source: salt://csync2-iWatcher/templates/iWatcher_service.jinja
    - template: jinja

enable-iWatcher:
  service.enabled:
    - name: iWatcher

csync2-install:
  pkg.installed:
    - name: csync2

inotify-tools-install:
  pkg.installed:
    - name: inotify-tools
