# **AI Services Landing Zone Extension** <!-- omit from toc -->
## **Table of Contents** <!-- omit from toc -->
- [**1. Introduction**](#1-introduction)
- [**2. Design Overview**](#2-design-overview)
- [**3. Security View**](#3-security-view)
- [**4. Network View**](#4-network-view)
- [**5. Runtime View**](#5-runtime-view)


&nbsp; 

## **1. Introduction**
Welcome to the **AI Services Landing Zone Extension**.

The AI Services Landing Zone (LZ) Extension is a secure cloud environment, designed with best practices to simplify the onboarding of AI Services workloads and enable the continuous operations of their cloud resources. This reference architecture provides an automated landing zone **configuration**.

&nbsp; 

## **2. Design Overview**
| ID    | DOMAIN                | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ----- | --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1** | **General**           | - [One-OE](../../one-oe/) LZ deployed as a foundation. </br>- The AI Services LZ Extension will extend the One-OE LZ and add AI Services Workloads example. </li> </ul>                                                                                                                                                                                                                                                                                                                                                           |
| **2** | **Tenancy Structure** | Extend the standard landing zone compartment structure with additional compartments for AI Services-related resources: </br>- Parent AI services compartment.</br>- AI service.                                                                                                                                                                                                                                                                                              |
| **3** | **Groups & Policies** | Additional groups and associated policies are deployed to manage AI service compartment resources.                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **4** | **Network Structure** | Optional shared VCN and related elements will be added - to setup private endpoint for AI Services.                                                                                                                                                                                                                                                                                                                                                                                      |
| **5** | **Runtime**           | - There are be **three deployment steps** to provision this landing zone: **(1)** The One-OE LZ will be used as an initial setup and **(2)** extended with the AI Services LZ Extension Runtime configurations. </br> - Note that the **'Operation/(OP)**' column on the next sections identifies the two moment in time when OCI resources are created. <br>- For more details refer to the [Runtime](#5-runtime-view) section. |


&nbsp; 

## **3. Security View**


### **3.1 Compartments**

The AI Services LZ Extension  includes the following compartments:
> [!NOTE]
> Compartments help you organize and control access to your resources. A compartment is a collection of related resources (such as cloud networks, compute instances, or block volumes) that can be accessed only by those groups that have been given permission by an administrator in your organization.

<img src="diagrams/compartments.png" width="1000" height="value">

&nbsp; 

The following table provides details on the compartments presented above, their level of deepness in the tenancy, and objectives. 

| ID     | OP    | LEVEL | NAME                     | OBJECTIVES                                     |
| ------ | ----- | ----- | ------------------------ | ---------------------------------------------- |
| CMP.00 | OP#01 | 0     | cmp-lzp-platform-genai-cluster  | Parent for shared genai cluster resources                  |
| CMP.00 | OP#01 | 0     | cmp-lzp-p-platform-genai-cluster   | Holds project platform genai cluster resources                      |
| CMP.00 | OP#01 | 0     | cmp-lzp-p-projects-genai-project1 | Holds genai project1 resources |
| CMP.01 | OP#01 | 0     | cmp-lzp-p-projects-genai-project2 | Holds genai project2 resources |
| CMP.00 | OP#01 | 0     | cmp-lzp-p-projects-dig-asst-project1 | Holds digital assistant resources |
| CMP.00 | OP#01 | 0     | cmp-lzp-p-projects-vision-project1 | Holds vison project resources |
| CMP.00 | OP#01 | 0     | cmp-lzp-p-projects-speech-project1 | Holds speech project resources |
| CMP.00 | OP#01 | 0     | cmp-lzp-p-projects-language-project1 | Holds language project resources |
| CMP.00 | OP#01 | 0     | cmp-lzp-p-projects-doc-understanding-project1 | Holds document understanding project resources |

&nbsp; 

## **4. Network View**
The following diagram presents the network structure of the AI Services LZ Extension.


<img src="diagrams/network.png" width="1000" height="value">

&nbsp; 

## **5. Runtime View**


This chapter presents the AI Services LZ Extension operations scenarios.

The operations scenarios are one of the most important elements of this design, as they represent the use cases and its key activities on the AI Services LZ Extension that create or update resources.

An operation scenario is normally triggered by a service request, on a ticketing system. In a more formal definition, it should be seen as an operational process, which is a set of correlated activities executed as one unit of work, with its own frequency. The owner of each scenario will be the cloud operations team which has associated OCI Groups and Policies that allow the management of those resources.



The AI Service LZ Extension has three operation scenarios described in the following table.



| DEPLOYMENT                                         | DEPLOYMENT SCENARIOS DESCRIPTION                                                                                                                  | TIME EFFORTS                          |
| ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------- |
| **[One OE LZ](../../one-oe/)**                   | **Deploy One-OE Landing ZOne**. Cover Core network resources (Hub VCN), Core IAM resources (compartments, group, policies), and security services.          | **< 1h**                              |
| **[GenAI](./genai/)**                        | **Deploy Genai extension**. Include AI service IAM resources (Compartment, Groups, Policies) | **< 15m**                             |
| **[Digital Assistant](./digital_assistant/)**            | **Deploy Digital Assistant extension**. Include AI service IAM resources (Compartment, Groups, Policies) and optional network resources (Spokes VCNs, Table Routes, Security Lists) |  **< 30m** (excluding deployment time) |

&nbsp; 

&nbsp; 

# License <!-- omit from toc -->

Copyright (c) 2024 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](/LICENSE) for more details.
