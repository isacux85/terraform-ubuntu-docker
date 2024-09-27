# terraform-ubuntu-docker
Proyecto de practica.

Este proyecto despliega con la herramienta de terraform sobre la nube OpenSource de CloudStack Apache un servidor con Ubuntu 22.04, una partición a parte del disco primario donde se instalara docker.  

Previo tener instalado terraform:
https://developer.hashicorp.com/terraform/tutorials/docker-get-started/install-cli

Tener las credenciales con los permisos necesarios para acceder a la api de la nube.

Clonar proyecto, abrirlo por ejemplo con vscode y ejecutar los comandos de terraform:
- terraform init
- terraform plan
- terraform apply

Importante, los valores de las variables de conexión se las paso desde un archivo .json dentro de un directorio fuera del proyecto, esto es una buena practica y no expone datos sensibles.
El comando seria: terraform apply --var-file="../nombre-tu-dir/vars.tfvars.json" .Aplica para terraform plan y destroy.
Esta forma no te pide las credenciales con cada comando.
