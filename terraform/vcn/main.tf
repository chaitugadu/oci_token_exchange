terraform {
  
  backend "oci" {
    bucket = "bucket-tag"
    key = "tf_demo_native_backend.tfstate"
    namespace = "id3kvohtwgjy"
  }
}
provider "oci" {
  region               = var.region
  tenancy_ocid         = var.tenancy_ocid
  auth                 = "securitytoken"
  config_file_profile  = "DEFAULT"
}

resource "oci_core_virtual_network" "fvass_vcn" {
  cidr_block     = var.vcn_cidr_block
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_display_name
}

