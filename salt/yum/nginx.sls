nginx.repo:
  file.managed: 
    - name: /etc/yum.repos.d/nginx.repo
    - source: salt://yum/files/nginx.repo
    - template: jinja
    - defaults: 
      os_type: {{ grains['os'].lower() }}
      os_release: {{ grains['osrelease_info'][0] }}
