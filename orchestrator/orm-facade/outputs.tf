# ####################################################################################################### #
# Copyright (c) 2023 Oracle and/or its affiliates,  All rights reserved.                                  #
# Licensed under the Universal Permissive License v 1.0 as shown at https: //oss.oracle.com/licenses/upl. #
# ####################################################################################################### #

output "provisioned_identity_resources" {
  description = "Provisioned identity resources"
  value       = module.terraform-oci-open-lz.provisioned_identity_resources
}

output "provisioned_networking_resources" {
  description = "Provisioned networking resources"
  value       = module.terraform-oci-open-lz.provisioned_networking_resources
}

