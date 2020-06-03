#      _____              __  __ 
#     |_   _|     /\     |  \/  |
#       | |      /  \    | \  / |
#       | |     / /\ \   | |\/| |
#      _| |_   / ____ \  | |  | |
#     |_____| /_/    \_\ |_|  |_|
#           _____       _      
#          |  __ \     | |     
#          | |__) |___ | | ___ 
#          |  _  // _ \| |/ _ \
#          | | \ \ (_) | |  __/
#          |_|  \_\___/|_|\___|
#


module "iam-role" {

  source = "jason-morsley/iam/aws"

  name = var.iam_role_name

  assume_role_policy = file("${path.module}/role.json")

  role_policy = file("${path.module}/policy.json")

}