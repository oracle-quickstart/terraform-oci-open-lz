# ####################################################################################################### #
# Copyright (c) 2024 Oracle and/or its affiliates,  All rights reserved.                                  #
# Licensed under the Universal Permissive License v 1.0 as shown at https: //oss.oracle.com/licenses/upl. #
# Author: Cosmin Tudor                                                                                    #
# Author email: cosmin.tudor@oracle.com                                                                   #
# Last Modified: Thu Feb 08, 2023                                                                         #
# Modified by: andre.correa@oracle.com                                                                    #
# ####################################################################################################### #

module "oci_open_lz_orch_compartments" {
  source                     = "git::https://github.com/oracle-quickstart/terraform-oci-cis-landing-zone-iam.git//compartments?ref=v0.1.9"
  providers                  = { oci = oci.home }
  tenancy_ocid               = var.tenancy_ocid
  compartments_configuration = var.compartments_configuration
  compartments_dependency    = var.compartments_dependency
  tags_dependency            = var.tags_dependency
}

module "oci_open_lz_orch_groups" {
  source               = "git::https://github.com/oracle-quickstart/terraform-oci-cis-landing-zone-iam.git//groups?ref=v0.1.9"
  providers            = { oci = oci.home }
  tenancy_ocid         = var.tenancy_ocid
  groups_configuration = var.groups_configuration
}

module "oci_open_lz_orch_dynamic_groups" {
  source                       = "git::https://github.com/oracle-quickstart/terraform-oci-cis-landing-zone-iam.git//dynamic-groups?ref=v0.1.9"
  providers                    = { oci = oci.home }
  tenancy_ocid                 = var.tenancy_ocid
  dynamic_groups_configuration = var.dynamic_groups_configuration
}

module "oci_open_lz_orch_policies" {
  depends_on             = [ module.oci_open_lz_orch_compartments, module.oci_open_lz_orch_groups, module.oci_open_lz_orch_dynamic_groups ]
  source                 = "git::https://github.com/oracle-quickstart/terraform-oci-cis-landing-zone-iam.git//policies?ref=v0.1.9"
  #source                 = "../../terraform-oci-cis-landing-zone-iam/policies"
  providers              = { oci = oci.home }
  tenancy_ocid           = var.tenancy_ocid
  policies_configuration = var.policies_configuration
  compartments_dependency = var.compartments_dependency
}
