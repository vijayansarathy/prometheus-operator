#### Additional Notes from Customer Meeting on March 10, 2021 ####

- Customer is very well versed in Kubernetes and have been running self-manages K8s for 4+ years now. They have been doing it the hard way, literally speaking, because they spun up their environment based on Hightower's [Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way) tutorial and have been maintaining it. They are now ready move over to EKS.
- They feel that the current support for [provisioning and managing Spot instances in managed node groups](https://aws.amazon.com/blogs/containers/amazon-eks-now-supports-provisioning-and-managing-ec2-spot-instances-in-managed-node-groups/) falls way short of what they can do with Spot when using self-managed node groups. 
- Interested in support for Bottlerocket in manages node groups
- They are interested in adopting App Mesh but feel that it lacks several key features - custom filters, host-path rewrite, rate limiting. 
- They are using Istio in conjunction with NLB with SSL termination at the NLB. Mentioned about SNI information getting lost at Istio when they reoriginate traffic from NLB.
- They mentioned that the kubelet on worker nodes running EKS-optimized AMI does not expose Prometheus metrics.
- They would like to see more of the add-ons supported in the EKS Console - cluster autoscaler, node-termination handler.
- They are gatheting control plane audit logs but they would like some kind of integration with AWS Audit Manager so that they can stay abreast of any compliance exceptions.
- Using open source [Concourse](https://concourse-ci.org/) for CICD. Mentioned that a big deterrent for not adopting Flux-based GitOps was that there is still a disconnect between Flxu and AWS infrastructure such as, for example, managing IAM roles to be associated with service accounts when using IRSA.
- They use IAM role based authN for their EKS cluster. Users first authenticate against their corporate identity system and are then mapped to an IAM role. However, when multiple users are assuming the same IAM role to talk their EKS cluster, there is no mechanism to propagate the original user identity. This is very important for their secuity team. They have to sift through the CloudTrail logs to connect the dots here. 


#### Takeaways ####
- Customer could benefit from a roadmap discussion on AppMesh as well as EKS
- They would like the IAM authenticator for EKS to propagate additional information like the original user identity. 
- 
