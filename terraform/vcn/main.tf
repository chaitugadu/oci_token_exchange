terraform {
  
  backend "oci" {
    depends-on [ oci_core_virtual_network.fvass_vcn]
    bucket = "bucket-tag"
    key = "tf_demo_native_backend.tfstate"
    workspace_key_prefix = "demo/"
    namespace = "id3kvohtwgjy"
    config_file_profile = "upst"
    auth = "securitytoken"
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

