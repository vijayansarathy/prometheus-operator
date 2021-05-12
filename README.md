#### Additional Notes from Meeting on April 1, 2021 ####

- Customer has been running containerized workloads using Giant Swarm, a managed Kubernetes service.
- They have about 28 clusters which are split roughly evenly between three environments - Production, QA and Dev
- Clusters are all running Kubernetes version 1.18
- There are about **400-500 nodes in all clusters**. All worker nodes use an AMI based on Flatcar Container Linux 
- Total number of **5000-6000 Pods** in all clusters. Everything runs on AWS.
- Each cluster runs in a separate VPC. They way Giant Swarm service works is that VPC provisiining itself is handled by the service. There is a lot of communication between services running in different clusters. To enable this, they are using a Transit Gateway. Even though they can setup the Gateway in such a way as to limit who can talk to whom, they have put any such access control mechanisms in place. Every VPC can talk to every other VPC. The nature of their workloads is such that they need this kind of setup.
- Before moving to Giant Swarm, they were running their K8s workloads in a self-managed Kops cluster. They were using far fewer clusters per environment when it was all self-managed. 
- The data plane nodes in their Giant Swarm clusters are also managed by the service vendor. They are sort of similar to EKS Managed Nodegroups but don't have the same level of customizability in terms of choosing your own AMI and using cusom bootstrapping scripts via UserData in a Launch Template/Configuration.
- Their current EKS footprint is rather small.
- **They are all in on EKS and want to migrate all their Giant Swarm clusters over to EKS**.
- **Their current contract with Giant Swarm expires by the end of 2021**.
- They want to **be on solid ground with their EKS migration efforts no later than Oct**. so that they can let Giant Swarm know whether they will be renewing the contract.
- They have already done 1 migration and mentioned it took about 3 weeks to complete. They were able to take a Velero backup of their Giant Swarm cluster and use that to stand up an EKS cluster. Then they did a DNS cutover. They are using Route53. This is a good sign as this is an indication that their services will port over more or less seamlessly to EKS. They don't expect any problems as they were able to migarte things over to Giant Swarm from Kop when that migration happened 
- They are making using of PSPs for pod security. Though the Flatcar OS supports SE Linux features, they are not making use of them. So they said they will be fine running their EKS workloads using AL2 based EKS optimized AMIs.
- They have been using Kiam on their clusters and plan to use IRSA on EKS.
- They are spending nearly $50K/month on Transit Gateway charges and want to cut down on it.
- They want to adopt the deployment model of provisioning multiple clusters in the same VPC, with cluster assigned a separate set of subnets. 





