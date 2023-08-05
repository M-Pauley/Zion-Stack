# Zion Cluster
Compute Node
    ZionNode##.cyberpunkcity.org
    10.0.50.##
================================================
Hardware Specs and Features
Dell PowerEdge M520
    - 2x, Xeon 6 core (12t)
    - 96GB DDR-3 RAM
    - 2x, 500GB SAS HDDs
        /dev/sda
        - RAID 0
    - 5x, 600GB SAS HDDs (Shared Storage)
        /dev/sdb
        -RAID 0
    - 4x internal 10/100/1000 NIC Ports.
    - Connected to iSCSI storage.
    - Enable virtualization features.

================================================
System Intentions and Features
    - OpenStack compute, storage, network node.
    - Kubernetes Worker.

================================================
Node Setup

    1.) Commission node via MaaS.
    2.) Configure node.
        - Manually Configure BIOS for PXE Boot from NIC
          that is associated with MaaS network.
        - Configure MaaS for node power control using IPMI(iDRAC) or Redfish.
        - Configure node's Networks and Storage in MaaS.
            - Assign NICs on the same subnets/VLANs to same Fabrics/VLANs in MaaS.
            - Create NIC Bonds and/or Bridges in MaaS.
            - Configure additional storage for OpenStack usage.
    3.) Install Dell utilites via MaaS Commisioning script
        - Alternatively: Use an Ansible Playbook from Management Node after
          MaaS node deployment.
    4.) Deploy Node.