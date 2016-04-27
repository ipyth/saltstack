zabbix:
  source_name: zabbix-3.0.2.tar.gz
  version: zabbix-3.0.2
  dirs: 
    base: /opt/
    home: /opt/zabbix/
    soft: /opt/src/

zabbix_server:
  listenip: 0.0.0.0
  listenport: 10051
  sbin: sbin/zabbix_server

zabbix_agentd:
  make_option: "--prefix=/opt/zabbix/ --enable-agent"
  sbin: sbin/zabbix_agentd

