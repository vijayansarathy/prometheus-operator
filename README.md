
## Cimpress/VistaPrint ##
Meeting Date: March 11, 2021

### Attendees ###
VistaPrint CARE Team, Tunis
Cayce Marston - CSM
Donny Omosa - TAM



### Bacground ###
Cimpress sells cutomized products (business cards, yard signs, T-shirts, etc.) on their e-commerce web site. They have several subsidiaries and VistaPrint is the biggest one, accounting for nearly 60-70% of their revenues. They have developed MCP - Mass Customization Platform comprising of several dozen microservices that powers their e-commerce site. They have several development teams spread all over the US and Europe that have been given the autonomy to develop microservices with technologies of their choosing and expose them using well-defined APIs that other teams can easily consume.

Though AWS is their main Cloud platform that accounts for >90% of the spend on Cloud, several teams developing microservices on K8s were using GKE. A big reason for this was that GitLab is their choice for source control and it had better integrations with GKE. Cimpress recenly signed a 5 year, ~125M EDP and following that there has been a push to move all production services to AWS, including the ones running on GKE.

The account team SA recently condiucted a Well-Architected Framework Review for the CARE Tech team.  It was requested by Jeremy Potash, Director of Technology.  This WAFR was completed on Wednesday of last week.  To net it out, the #1 follow-on activity was a review of the CARE Tech team’s container architecture for their planned migration.  They plan to “flip the switch” on their migration in 2-3 weeks.
###

The stack that was reviewed was a relatively straightforward deployment.
- Stack comprises Node.js microservices taking to other shared services in the backend, about 10-12.
- EKS cluster comprises worker nodes of type t3.medium. 
- Cluster Autoscaler is used to scale out capacity from 5-15 nodes. I suggested that they follow deployment strategies recommended in the EKS Best Practices guide.
- Their services are integrated with New Relic which is used for all their metrics collection, monitoring and alerting needs.
- They are using ALB in conjunction with NGINX Ingress Controller with the former doing a pass-through and latter handling all L7 routing. Not sure what the rationale was for this deployment as NGINX Controller is typically seen in a setting with NLB. I suggested that they switch to using AWS Load Balancer Controller and use NLB in IP mode with NGINX
- They are using self-managed worker nodes. I suggested that they switch over to using managwed worker nodes.
- Suggested using IRSA and prevent access to IMDS.
- They are sending all application logs to New Relic.
- They were unsure about setting the right CPU/memory limits for their Pods. I suggested that they use VPA to right-size the Pods and use those resource limits.

### Observation ###
The customer is finally getting around to adopting EKS for their microservices and moving away from GKE. Their migration from monolith to microservices architecture is still underway and the service that power their US/Canada site are yet to be migrated over. So, we can expect to see more workloads launched on EKS over the course of this year.

