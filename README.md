# Zion-Stack
High-level overview of concepts for HomeLab.
Zion Cluster - LOKI.
----------------------------------------------------------------
Linux/OpenStack/Kubernetes/Infrastructure supporting VMs and Containers 
on a small number of nodes with the potential to scale. 

The stack should be easily deployable with minimal configuration editing,
largely automated, and repeatable.

        Software Versions:
            Ubuntu 22.04 LTS (Jammy)
            MAAS 3.3.3 - Snap
            Juju 2.9.43 - Snap
            OpenStack 2023.1 (Antelope) - Charm Store

Linux:
    Currently supporting Ubuntu 22.04 (Jammy) and basing installation/deployment from 
    official Canonical and OpenStack guides. 
    
    Supported OS should be a major release. Ubuntu LTS, RHEL/CentOS, etc

OpenStack:
    Charmed/Juju - A lot of overhead for a small footprint requirement. Maybe VM it.
    OpenStack Deployment Tools - Heavy on configuration YAML files being correct.
    MicroStack - Installation steps could easily be scripted.
    Devstack - Small footprint, could be scripted or possibly deployed with Ansible.
    
Kubernetes:
    Charmed/k8s - Already have a Juju controller installed for MaaS.
    k8s - Standard Kubernetes.
    k3s - Lightweight, good support.
    microk8s - Easy to get up and running quickly.

Infrastructure:
    Canonical MaaS - Deploy Ubuntu 22.04 LTS, manage network and storage configuration.
    Cilium - Deploy Bare metal OS. Configuration of node handled by Ansible.
    Foreman/Satellite - Have to study it a bit more.

Zion Cluster - The Hardware.
----------------------------------------------------------------
The Management Node - Dell PowerEdge R710
    Linux - Installed manually, configure with Go Task or Bash scripts.
    OpenStack - Control, Compute, Storage Node.
    Kubernetes - Control Node (Dashboard, DNS, Registry, etc.).
    Infrastructure - MaaS Server, Juju Controller.

The Compute Nodes - Dell PowerEdge VRTX Chassis with 4x Dell PowerEdge M520 Blades.
    Linux - Provisioned by The Management Node.
    OpenStack - Compute, Storage Node.
    Kubernetes - Provisioned VM for WorkerNode.
    Infrastructure - Controlled by The Management Node.

The Network - Ubiquity UniFi System
----------------------------------------------------------------
Router - UDM Pro SE
    Infrastructure VLAN - 10.0.99.xx
        - DHCP server is MaaS
        - Provides MaaS and PXE Boot

    External VLAN - 10.0.55.xx
        - DHCP from Router.
        - Provides gateway to the interwebs.
        - Outside traffic forwards to LoadBalancer.

    Internal VLAN - 10.0.