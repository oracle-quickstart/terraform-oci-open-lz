# Copyright (c) 2023 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

locals {
  #Local var used as util to avoind the length call in the code
  compartments = module.cislz_compartments.compartments
}