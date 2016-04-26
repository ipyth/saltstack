nginx: 
  pkg.installed:
    - name: nginx
    - version: 1.8.1-1.el6.ngx
    - fromrepo: nginx
    - refresh: True
    - unlese: rpm -q nginx
