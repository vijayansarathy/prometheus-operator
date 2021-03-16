### Additional Comments from Customer Meeting on March 10, 2021 ###

- Customer has been running workloads on Kuberntes for about 4 years now, using self-managed cluster provisioned withe Kops
- One of the main reasons for not adopting EKS earlier was that it was available only in 2 of the 3 regiosn that they needed it.
- Their product is a data visualization platform that has 20+ years of technology knowhow built into it. The core component of their platform is called the Engine.
- They have a need for directing incoming traffic to specific set of Pods. This sounded like similar to session stickiness. I could not fully fathom why they were doing this based on the coarse-grained explanations during the call. Anyway, this use case make service mesh like Istio unsuitable for their environment.
- They are using MongoDB as the database. Using MongoDB Atlas, which is a hosted solution. 
- Most of the important data resides on EFS volume which is mounted to the Engine pods.
- They are using Classic LB in combination with NGINX Ingress Controller, with SSL termination at the Ingress Controller.
- Heavy on websockets.
- They have about 40 worker nodes in their cluster at stready state. Cluster capacity goes upto about 100 at peak.
- Run a lot of batch workloads

## Migration Challenges ###

- Discussion about doing a zero-outage cutover from their Kops cluster to EKS
- Suggested using Route53 weighted routing to handle the transition
- All of their services are statelss and hence can be running simulatanoeusly in both clusters.
- They can run both clusters in the same VPC and therefore share data on the EFS volumes between both the clusters.
- The biggest challenge is their encryption service which makes use of HashiCorp Vauld under the covers and also perisists lots of encryption keys to DynamoDB. They mentioned that they can't have this service deployed in both clusters (Kops & EKS) and talking to the same DynamoDB database. 
- Services in their cluster talk to this encryption service using K8s ClusterIP/DNS name. 
- Suggested look into whether they can cut everything over to the EKS cluster except for the encryption service and have the service in EKS cluster talk to the encryption service in Kops cluster through an internal load balancer. Then, move the encryption service over to the EKS cluster. 
- They said that they can tolerate an outage of 10 minutes at the most but that is the last resort.
- They are going to do more investigations around the migration of this encruption service.

## Next Steps ##
Asked the customer to setup another meeting where we do a deep dive on exactly how this all-important encryption serivce works so that we can come up with a migration strategy. Reaching out to a HashiCorp Partner SA @ AWS who is well-versed in Vault to find out if he can offer any guidance.
