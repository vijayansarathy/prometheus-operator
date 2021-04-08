#### Additional Notes from Meeting on March 29, 2021 ####

- Customer is setting up multiple EKS environments for their R&D teams. 
- Right now, every R&D team is doing its own, each on a different path. They want to standardize across all teams using EKS with managed node groups
- They are planning on provisioning on big cluster and employing the standard approach of using K8s namespaces to segregate team worksloads.
- They have about 200 Pods deployed in their cluster now. 
- They are looking into moving applications running from 100s of servers into the EKS cluster
- Some workloads are being migrated from ECS to EKS.
- They are using AWS VPC CNI pluging with custom networking.The main driver for this was that they have a large CIDR that is used by many VPCs internally and is not done right and therefore they don't have enough IPs in the primary CIDR of the VPC.
- They are looking into whether they should use Fargate instead of MNG for EKS.
- They were concerned about the limit on the number of Fargate Pods per accoubt which is set to 1000. They anticipate easily exceeding this number when all their workloads eventually run on EKS. I clarified that this is just a soft limit which can be increased.
- The other questions they raised about limits on Fargate Pods is this: Upstream Kubernetes 1.20 supports clusters with no more than 5000 nodes. In Fargate, every Pod that lands on the cluster presents itself as a node to the control plane. Given this, is there going to be a limit of 5000 Fargate Pods? 
- They were also concerned about the cold start issues on Fargate and asked if anything will be done to address it. 
- They are SNAT'ing all the Pod traffic with the IP address of the worker node to reduce the number of routable IP addresses. They asked for guidance on best practices around this. I referred them to this [blog](https://aws.amazon.com/blogs/containers/eks-vpc-routable-ip-address-conservation) which is the only referenceable architecture we have on this topic.

















