#      _____                 _                 
#     |  __ \               | |                
#     | |__) |__ _ _ __   __| | ___  _ __ ___  
#     |  _  // _` | '_ \ / _` |/ _ \| '_ ` _ \ 
#     | | \ \ (_| | | | | (_| | (_) | | | | | |
#     |_|  \_\__,_|_| |_|\__,_|\___/|_| |_| |_|

# https://www.terraform.io/docs/providers/random/r/pet.html
resource "random_pet" "shared-scripts" {
  length = 3 
}