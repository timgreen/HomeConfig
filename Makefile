sync-all:
	ansible-playbook all.yml

galaxy-install:
	ansible-galaxy collection install -r requirements.yml

lint:
	ansible-lint all.yml

new-role:
	mkdir -p roles/${role}/tasks
	echo -e -n "- name: stow ${role}\n  command: stow -v -t ~ -d {{ role_path }}/files -S . --no-folding\n  register: output\n  changed_when: '\"LINK\" in output.stderr'" > roles/${role}/tasks/main.yml
	mkdir -p roles/${role}/meta
	echo -e -n "dependencies:\n  - role: skeleton" > roles/${role}/meta/main.yml
