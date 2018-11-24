# Instalación y Ejecucion de un entorno de pruebas usando VirtualBox + Vagrant + Ansible  + JMeter

### Pasos de instalación de entorno VirtualBox + Vagrant + Ansible

1. Ejecutar script **dependencies.sh**. Este script instalará *GIT*, *VirtualBox*, *Vagrant* y *Ansible*
2. Ejecutar script **infraestructure_reqs.sh**. Este script instalará todas las dependencias de la infraestructura virtual hecha con *Vagrant* y *Ansible*
3. Ejecutar script **jmeter_install.sh**. Este script instalará *JMeter*

### Levantar infraestructura virtual usando VirtualBox y Vagrant 

Posicionarse en directorio **infraestructure** 

### Ejecución de plan JMeter

* Se puede abrir con *JMeter* el archivo **plan.jmx** para ejecutarlo visualmente 
* Ejectura script **jmeter_execute.sh** el cual ejecuta el plan según las variables definidas en el mismo archivo al comienzo del mismo