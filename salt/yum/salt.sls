saltstack.repo:
  file.managed: 
    - name: /etc/yum.repos.d/saltstack.repo
    - source: salt://yum/files/saltstack.repo
    - user: root
    - group: root
    - mode: 644
