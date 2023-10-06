module "vpc" {
    source = "git::https://github.com/coding-kumanan/tf-module-vpc.git?ref=main"
  
}

# We cannot parametrize anything that's added n the source.
# To limit that, we can use a tool called as Terrafile. All it does is clonnes the remote code from the specified branch and make it locally available.