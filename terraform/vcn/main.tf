terraform {
  
  backend "oci" {
    bucket = "bucket-tag"
    key = "tf_demo_native_backend.tfstate"
    workspace_key_prefix = "demo/"
    namespace = "id3kvohtwgjy"

  }
}
provider "oci" {
  region               = var.region
  tenancy_ocid         = var.tenancy_ocid
  auth                 = "securitytoken"
  config_file_profile  = "upst"
}

resource "oci_core_virtual_network" "fvass_vcn" {
  cidr_block     = var.vcn_cidr_block
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_display_name
}
