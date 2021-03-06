#       _____   ____  
#      / ____| |___ \ 
#     | (___     __) |
#      \___ \   |__ < 
#      ____) |  ___) |
#     |_____/  |____/ 

# SIMPLE STORAGE SERVICE

module "kube-config-yaml" {

  source = "./../terraform-aws-s3-object"
  # source = "jason-morsley/s3-object/aws"

  bucket_name = var.bucket_name

  key     = "/${local.kube_config_filename}"
  content = rke_cluster.this.kube_config_yaml
  
}