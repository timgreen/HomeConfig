sync-all:
	ansible-playbook all.yml

lint:
	ansible-lint all.yml
