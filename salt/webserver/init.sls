httpd:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: httpd

/var/www/index.html:                        
  file.managed:
    - name: /var/www/html/index.html                                                           
    - source: salt://webserver/index.html.jinja
    - template: jinja   
    - require:                              
      - pkg: httpd                         

iptables:
    pkg:
        - installed
    service.running:
        - enabled: True
        - reload: True
        - watch:
            - file: /etc/sysconfig/iptables
        - require:
            - pkg: iptables
    file.managed:
        - name: /etc/sysconfig/iptables
        - source: salt://webserver/iptables.jinja
        - template: jinja
        - require:
            - pkg: iptables
