mypackages:
    pkg.installed:
        - pkgs:
            - vim-common
            - screen
            - python
            - curl
            - git
            - python

python-pip:
    pkg.installed:
        - pkg: python-pip

python-hgtools:
    pip.installed:
        - name: hgtools
        - require:
            - pkg: python-pip

python-pyrax:
    pip.installed:
        - name: pyrax
        - require:
            - pip: hgtools
