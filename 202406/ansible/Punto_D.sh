cd ~/UTN-FRA_SO_Examenes/202406/ansible
vim roles/2do_parcial/templates/datos_alumno.j2
vim roles/2do_parcial/templates/datos_equipo.j2
vim roles/2do_parcial/vars/main.yml
vim roles/2do_parcial/tasks/main.yml
vim inventory/hosts
vim puntoD.yml
ansible-playbook -i inventory/hosts puntoD.yml
