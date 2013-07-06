mypackages:
    pkg.installed:
        - pkgs:
            - vim-common
            - screen
            - python
            - curl
            - git
            - python
            - python-pip

python-hgtools:
    pip.installed:
        - name: hgtools
        - prereq:
            - pkg: python-pip

python-pyrax:
    pip.installed:
        - name: pyrax
        - prereq:
            - state: python-hgtools
