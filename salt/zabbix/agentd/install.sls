{% set dirs = pillar['zabbix']['dirs'] %}
{% for (dir,path) in dirs.items() %}
{{ path }}: 
  file.directory:
    - makedirs: True
{% endfor %}

zabbix_source: 
  file.managed: 
    - name: {{ pillar['zabbix']['dirs']['soft'] }}{{ pillar['zabbix']['source_name'] }}
    - source: salt://zabbix/files/{{ pillar['zabbix']['source_name'] }}

extract_zabbix: 
  cmd.run:
    - cwd: {{ pillar['zabbix']['dirs']['soft'] }}
    - names: 
      - tar zxf {{ pillar['zabbix']['source_name'] }}
    - unless: test -d {{ pillar['zabbix']['dirs']['soft'] }}{{ pillar['zabbix']['version'] }}
    - require: 
      - file: zabbix_source

zabbix_compile:
  cmd.run: 
    - cwd: {{ pillar['zabbix']['dirs']['soft'] }}{{ pillar['zabbix']['version'] }}
    - names: 
      - ./configure {{ pillar['zabbix_agentd']['make_option'] }} > /dev/null && make > /dev/null && make install > /dev/null && echo "Success" 
    - unless: test -f {{ pillar['zabbix']['dirs']['home'] }}{{ pillar['zabbix_agentd']['sbin'] }}
    - require: 
      - cmd: extract_zabbix


