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

#### Notes from Meeting on April 22, 2021 ####

This was a follow up to meeting with the customer on April 1.
The last meeting was supposed to be a general overview and ended up being a bit of deep dive (from the customer's point of view) and so they wanted to have another meeting to go over some of the same topic with some of the members of their DevOps Team.

Ray Jose from DevOps - PRH
Eric Bruce from Cloud/K8s Team - PRH
Greg Start from Unix Virtualization - PRH
Viji Sarathy (AWS) - SSA
Victor Falconieri (AWS) - AM

- Ray asked about choosing between using Traefik + NLB and an ALB for routing traffic to their EKS services. Pointed out many improvements in the lates AWS Load Balancer Controller and the ability now to handle Ingress resources from multiple namespaces with a single instance of ALB. Pointed out the upper limits on the number of rules per listerner which may necessitate the use of more than 1 ALB depending on the number of service and the granularoty of L7 rules.
- The discussion again centered around the issue of certificate provisioning. Following the last meeting, I had provided guidance around the support for using multiple TLS certificates in an ALB instance (referred customer to this [blog post](https://aws.amazon.com/blogs/aws/new-application-load-balancer-sni/#ALB) as well). There were more discussions on this topic - about how they might manage the certificate for the more than 500 domains that they handle. Much of the discussion about packing multiple domain names into the same certificate using SANs was orthogonoal to containers/EKS per se. 
- When deploying an Ingress with TLS in onjunction with Cert Manager and Let's Encrypt, the certificate is made available in a Kubernetes Secret specified in the Ingress. Customer asked how would this work if the Ingress has to use a certificate provisioned by ACM. I pointed out the ability to reference an ACM certificate using the **alb.ingress.kubernetes.io/certificate-arn** annotation in the Ingress, specifying the ARN of one or more certificate managed by AWS Certificate Manager. 
- Customer asked if I could send them a POC of this which I agreed to.
- Cutomer wanted to know more about how IRSA feature works under the hood which I explained.
- They asked if this would work in a cross-account setting. The answert is yes and I pointed them to this [blog](https://aws.amazon.com/blogs/containers/cross-account-iam-roles-for-kubernetes-service-accounts/) that shows them how.


