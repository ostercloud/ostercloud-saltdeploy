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

python-pyrax:
    pip.installed:
        - name: pyrax
        - prereq:
            - pkg: python-pip
