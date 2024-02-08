# ####################################################################################################### #
# Copyright (c) 2023 Oracle and/or its affiliates,  All rights reserved.                                  #
# Licensed under the Universal Permissive License v 1.0 as shown at https: //oss.oracle.com/licenses/upl. #
# Author: Cosmin Tudor                                                                                    #
# Author email: cosmin.tudor@oracle.com                                                                   #
# Last Modified: Thu Nov 16 2023                                                                          #
# Modified by: Cosmin Tudor, email: cosmin.tudor@oracle.com                                               #
# ####################################################################################################### #


output "provisioned_identity_resources" {
  description = "Provisioned identity resources"
  value = {
    compartments   = module.oci_open_lz_orch_compartments.compartments,
    groups         = module.oci_open_lz_orch_groups.groups,
    memberships    = module.oci_open_lz_orch_groups.memberships,
    dynamic_groups = module.oci_open_lz_orch_dynamic_groups.dynamic_groups,
    policies       = module.oci_open_lz_orch_policies.policies
  }
}

output "provisioned_networking_resources" {
  description = "Provisioned networking resources"
  value       = module.oci_open_lz_orch_networking.provisioned_networking_resources
}