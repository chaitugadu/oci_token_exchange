terraform {
  
  backend "s3" {
    bucket = "bucket-TE"
    region = "us-ashburn-1"
    key = "tf_demo_native_backend.tfstate"
    use_lockfile = true
    
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    skip_metadata_api_check     = true
    use_path_style              = true

    endpoints = { s3 = "https://id3kvohtwgjy.compat.objectstorage.us-ashburn-1.oraclecloud.com" } 
  }
}

provider "oci" {
  region               = var.region
  tenancy_ocid         = var.tenancy_ocid
  auth                 = "SecurityToken"
  config_file_profile  = "DEFAULT"
}


