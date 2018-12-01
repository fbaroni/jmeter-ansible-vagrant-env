# Instalación y Ejecucion de un entorno de pruebas usando VirtualBox + Vagrant + Ansible  + JMeter

### Pasos de instalación de entorno VirtualBox + Vagrant + Ansible + JMeter

1. Ejecutar script `dependencies.sh`. Este script instalará *GIT*, *VirtualBox*, *Vagrant* y *Ansible*
2. Ejecutar script `infraestructure_reqs.sh`. Este script instalará todas las dependencias de la infraestructura virtual hecha con *Vagrant* y *Ansible*
3. Ejecutar script `sudo apt install jmeter -y`. Este script instalará *JMeter*

### Ejectuar infraestructura virtual usando VirtualBox y Vagrant 

1. Posicionarse en directorio **infraestructure** 
2. Ejecutar el comando `vagrant up`

### Ejecución de plan JMeter

* Se puede abrir con *JMeter* el archivo **plan.jmx** para ejecutarlo visualmente 
* Ejecutar script `jmeter_execute.sh` el cual ejecuta el plan según las variables definidas en el mismo archivo al comienzo del mismo