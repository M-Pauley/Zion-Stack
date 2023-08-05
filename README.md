# Zion-Stack

High-level overview of concepts for a Fully-Managed Kubernetes on OpenStack HomeLab.  

---

## Zion Cluster - The Stack.

Linux/OpenStack/Kubernetes/Infrastructure to support VMs and Containers on a small number of nodes with the potential to scale as-needed.  
The stack should be easily deployable with minimal configuration editing, largely automated, and repeatable.  

- Software Versions:  
    - Ubuntu 22.04 LTS (Jammy)  
    - MAAS 3.3.3 - Snap  
    - Juju 2.9.43 - Snap  
    - OpenStack 2023.1 (Antelope) - Charm Store  

### Linux:

- Currently supporting Ubuntu 22.04 (Jammy) and basing installation/deployment from official Canonical and OpenStack guides.  

- Supported OS should be a major release. Ubuntu LTS, RHEL/CentOS, etc.  

### OpenStack & Kubernetes:

- Uses current OpenStack release version.  
- Deployable via well-documented guides and methods.  
- Create easy to follow configurations and script as much as possible.  
- Maintain high-level of compatibility and security.  

### Infrastructure:

- Use and support commodity hardware.  
- Fit all requirements for Cloud Environment.  
- Simple manageability with minor interaction.  

Overall, this should be a simple means to deploy a VM and container-based cloud stack for minimal management and minimal frustration. It should also follow well-supported hardware/software/documents/forums/communities. 

---

## Zion Cluster - The Hardware.

### The Management Node  

- Linux - Installed manually, configure with Go Task or Bash scripts.  
- OpenStack - Control, Compute, Storage Node.  
- Kubernetes - Control Node (Dashboard, DNS, Registry, etc.).  
- Infrastructure - MaaS Server, Juju Controller.  

### The Compute Nodes  

- Linux - Provisioned and basic configuration by The Management Node.  
- OpenStack - Compute, Storage Node.  
- Kubernetes - Provisioned VM for WorkerNode.  
- Infrastructure - Controlled by The Management Node.  

### The Network  

- Uses Ubiquity UniFi Hardware.  
- Configure VLANs for infrastructure, external, and internal networks.  
- Preferrably configure bonded NICs for fault tolerance where possible/practical.  

---

## Zion Cluster - The Begining

1. Setup the Workstation.  
2. Install Host OS on the Compute Nodes.  
3. Deploy OpenStack to the Compute Nodes.  
4. Create OpenStack Virtual Machines and install k8s.  
5. Deploy the payload :fireworks: (Kubernetes workload).  