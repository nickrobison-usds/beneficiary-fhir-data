terraform {
  required_version = "~> 0.12"
}

provider "aws" {
  version = "~> 2.25"
  region = "us-east-1"
}

module "stateful" {
  source = "../../../modules/stateful"

  db_config = { 
    instance_class    = "db.r5.24xlarge"
    iops              = 16000
    allocated_storage = 16000
  }

  db_import_mode = {
    enabled = true
    maintenance_work_mem = "4194304"
  }

  env_config = {
    env               = "prod"
    tags              = {application="bfd", business="oeda", stack="prod", Environment="prod"}
  }  
}
