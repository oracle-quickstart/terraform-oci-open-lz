# ####################################################################################################### #
# Copyright (c) 2024 Oracle and/or its affiliates,  All rights reserved.                                  #
# Licensed under the Universal Permissive License v 1.0 as shown at https: //oss.oracle.com/licenses/upl. #
# Author: Cosmin Tudor                                                                                    #
# Author email: cosmin.tudor@oracle.com                                                                   #
# Last Modified: Thu Feb 08, 2023                                                                         #
# Modified by: andre.correa@oracle.com                                                                    #
# ####################################################################################################### #

module "oci_open_lz_orch_networking" {
  source                  = "git::https://github.com/oracle-quickstart/terraform-oci-cis-landing-zone-networking.git?ref=v0.6.4"
  network_configuration   = var.network_configuration
  # compartments_dependency includes the compartments provided by the user as an external dependency and the compartments provisioned by the module. The line below merges these two maps together.
  compartments_dependency = merge({for k,v in var.compartments_dependency : k => {"id" : v.id}}, {for k, v in module.oci_open_lz_orch_compartments.compartments : k => {"id" : v.id}})
  network_dependency      = var.networks_dependency
}