#### Additional Notes from Meeting on April 1, 2021 ####

- Customer has been leveraging AWS for production workloads for about 3-4 years. They have also been using containerized workloads for that long.
- Their containerized workloads on AWS run on ECS.
- For on-premise compute, they have use Docker on VMs initially and then moved to using Rancher (because they liked the UI)
- 2 years ago, they started setting stadards around the use of Kubernetes for running containerized workloads.
- They have been running K8s on-premise using Rancher 2.4/2.5. Worker nodes in the cluster are VMWare instances running RHEL.
- Plan is to move all Rancher workload to AWS, and refactor them (if needed) to run on EKS
- All their K8s clusters will be using EKS. 
- They want to migarate away from running K8s on-premise. So they don't have any interest in EKS-A or EKS-D
- They are dealing with about 150 applications. Many of them of small applications written in PHP, Node.js using React talking to MySQL or Oracle databases. There are no big monoliths here.
- User traffic is low on most of the applications
- One of their big challlenges has been around certificate provisionong and automating that process. They have about 500 domains and they control most of them. They have looked at using Certificate Manager in conjunction with Let's Encrypt but were concerned about the reliability of Cert Manager. 
- They were also looking for guidance on automating deployments. Some of the applications are static websites provisioned using CFN and Gitlab CI. The code churn in some of the applications is cyclical. They were not familiar with GitOps based deployment strategy and gave them an overview of it and offered to do a demo.
- Other discussions around securing the deployments revealed that they were not familiar with feature likes IRSA and Security Group for Pods.
- Timeframe for moving applications to EKS; about 13-15 in 2021.
- I have advised the account team to get some guidance from the customer about whether they want a deep dive in any particular area as they don't seem to be very familar with EKS. Based on what we hear from them, we will setup subsequent customer engagements.

