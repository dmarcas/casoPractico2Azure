variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "West Europe"
}

variable "vm_size" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_D1_v2" # 3.5 GB, 1 CPU 
}

variable "vm_size_2" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard D2s v3" # 8 GB, 2 CPU 
}