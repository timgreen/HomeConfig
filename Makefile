galaxy-install:
	ansible-galaxy collection install -r requirements.yml

lint:
	ansible-lint

list-tags:
	ansible-playbook local.yml --list-tags --tags mini,cli,gui

new-role:
	ansible-galaxy init roles/${role}

clean-up-broken-symlinks:
	find ~/.* -xtype l -maxdepth 5 -delete
	find ~/sh -xtype l -delete
	find ~/bin -xtype l -delete
