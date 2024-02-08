# ####################################################################################################### #
# Copyright (c) 2024 Oracle and/or its affiliates,  All rights reserved.                                  #
# Licensed under the Universal Permissive License v 1.0 as shown at https: //oss.oracle.com/licenses/upl. #
# Author: Cosmin Tudor                                                                                    #
# Author email: cosmin.tudor@oracle.com                                                                   #
# Last Modified: Thu Feb 08, 2023                                                                         #
# Modified by: andre.correa@oracle.com                                                                    #
# ####################################################################################################### #

module "oci_open_lz_orch" {
  source = "../"

  tenancy_ocid         = var.tenancy_ocid
  region               = var.region
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  private_key_password = var.private_key_password

  compartments_configuration   = local.compartments_configuration_from_input_json_yaml_file
  groups_configuration         = local.groups_configuration_from_input_json_yaml_file
  dynamic_groups_configuration = local.dynamic_groups_configuration_from_input_json_yaml_file
  policies_configuration       = local.policies_configuration_from_input_json_yaml_file
  network_configuration        = local.network_configuration_from_input_json_yaml_file

  compartments_dependency      = local.compartments_dependency
  networks_dependency          = local.networks_dependency
  tags_dependency              = local.tags_dependency
}