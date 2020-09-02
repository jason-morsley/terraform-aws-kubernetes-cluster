#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  all_cidr_block = "0.0.0.0/0" # All possible IP address range
  
  bucket_name = "${var.name}-${random_pet.this.id}"

  name = "multiple-node-example"

  cluster_id_tag = {
    "kubernetes.io/cluster/${local.name}" = "owned" 
  }
  
  node_name = null_resource.node_name_loop.node_name_value
  
}

variable "node_name_value" {}

resource "null_resource" "node_name_loop"{
  
  for_each = var.number_of_nodes
  
    node_name_value = "${var.ec2_name}-${each.key}"
}