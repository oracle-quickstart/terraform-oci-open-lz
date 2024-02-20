# ####################################################################################################### #
# Copyright (c) 2023 Oracle and/or its affiliates,  All rights reserved.                                  #
# Licensed under the Universal Permissive License v 1.0 as shown at https: //oss.oracle.com/licenses/upl. #
# Author: Cosmin Tudor                                                                                    #
# Author email: cosmin.tudor@oracle.com                                                                   #
# Last Modified: Tue Feb 20 2024                                                                          #
# Modified by: Pablo Alonso, email: pablo.alonso@oracle.com                                               #
# ####################################################################################################### #

provider "oci" {
  region               = var.home_region
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  private_key_password = var.private_key_password
  ignore_defined_tags  = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

terraform {
  required_version = "< 1.3.0"
  required_providers {
    oci = {
      source                = "oracle/oci"
      version               = "<= 5.16.0"
      configuration_aliases = [oci]
    }
  }
  experiments = [module_variable_optional_attrs]
}