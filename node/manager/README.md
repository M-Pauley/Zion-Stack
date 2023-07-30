# Zion Cluster
Management Node
    ZionDev00.cyberpunkcity.org
    10.0.50.50
================================================
Hardware Specs and Features
Dell PowerEdge R710
    - 2x, Xeon 4 core (8t)
    - 96GB DDR-3 RAM
    - 8x, 500GB SAS HDDs
    - 4x internal 10/100/1000 NIC Ports
    - UPS connected via USB, power is shared with network equipment.
    - Enable nested virtualization features.

================================================
System Intentions and Features
    - MaaS rack+region controller
    - Juju controller
    - Automation utilities for cluster management
    - Development tools for cluster support and GitHub integration.
    - System wide rsyslog server and monitoring.

================================================
Node Setup

    1.) Install and configure the OS and supporting software.
        - Ubuntu 22.02 LTS (with or without desktop environment.)
        - Dell System Utilities - OMSA and DSU
        - KVM, KVM Manager, LXD
        - Required and recommended software.
            - Go Task (Maybe create taskfiles to automate installation)
            - Ansible
            - UPS Utility
        - VNC Server
    2.) Install MaaS
        - Create VM
            2 CPU, 8GB RAM, 1 NIC,1 x 40GB storage
        - https://maas.io/docs/how-to-do-a-fresh-install-of-maas
            - Ansible install does not have rack+region controller.
        - Add management node as a KVM/LXD host.
        - Install Juju CLI utility.
    3.) Install Juju
        https://docs.openstack.org/project-deploy-guide/charm-deployment-guide/latest/install-juju.html
    4.) Install OpenStack
        https://docs.openstack.org/project-deploy-guide/charm-deployment-guide/latest/install-openstack.html
    5.) Install Kubernetes on OpenStack VMs.
        MicroK8s - https://microk8s.io/
        Charmed K8s - https://ubuntu.com/kubernetes/docs/install-manual
        