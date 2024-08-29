# Sovereign Controls Implementation <!-- omit from toc -->

## Table of contents <!-- omit from toc -->
- [Summary](#summary)
- [1. Groups](#1-groups)
- [2. Policies](#2-policies)
- [3. Quota Policies](#3-quota-policies)

## Summary
This guide covers implementation of principles outlined in the [Sovereign Controls addon](./readme.md) document. As an example we're going to implement restrictions for a German customer using EU Sovereign Cloud and who wants to restrict data to the `eu-frankfurt-2` region. However, configuration files can be modified to specifically fit the sovereign requiremnts of any customer.

## 1. Groups
If a certain user group needs to be restricted to provisioning resources in a specific region, it's recommended to create a region-specific group. As IAM Groups are global resources, we denote the region specificity using a naming convention, e.g., `grp-${region}-security-admins`. You can see an example configuration in the [identity.auto.tfvars.json](./identity.auto.tfvars.json) file, section `groups_configuration`. These groups can either extend the default groups provided by a landing zone or replace them if only a specific region is required.

> [!WARNING]
> Groups and policies controlling access permisions to IAM need to be always applied in the [Home Region](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingregions.htm#The) otherwise they have no effect.

## 2. Policies
Policies are applied to region specifric groups created in the previous step. All policies in Sovereign Landing Zone addon use the same permissions as in [One-OE](../../blueprints/one-oe) LZ, but with addition of a condition to limit the permission to a specific region e.g.
```
Allow group grp-str-security-admins to manage all-resources in tenancy where request.region = 'str'
```

## 3. Quota Policies
Use Quota Policies in Oracle Cloud Infrastructure to control resource creation based on a region within Compartments/Tenancy. Quota Policies limit the number of resources that can be created in a Compartment/Tenancy based on the region. In this example the customer wants to make sure there's no quota available in the regions other than `eu-frankfurt-2` region.
```
zero compute-core quota /*/ in tenancy where request.region != 'eu-frankfurt-2'
zero database quota /*/ in tenancy where request.region != 'eu-frankfurt-2'
zero vcn quota /*/ in tenancy where request.region != 'eu-frankfurt-2'
zero filesystem quota /*/ in tenancy where request.region != 'eu-frankfurt-2'
zero object-storage quota /*/ in tenancy where request.region != 'eu-frankfurt-2'
```

> [!NOTE]
> The provided list of Quota Policies is not exhausitve and includes only the most common services used for storing data. See [Available Quota by Service](https://docs.oracle.com/en-us/iaas/Content/Quotas/Concepts/resourcequotas_topic-Available_Quotas_by_Service.htm) for a full list.

Additionally for a multi-Tenancy set-up [Governance Rules](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/organization_management_overview.htm#governance_rules) in Organizations service can be used to impose restriction on Child Tenancy
