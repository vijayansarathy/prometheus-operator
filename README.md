**Background** 
Thompson Reuters is embarking on moving a "massive amount of services; 1000s of services" to EKS. All these services pertain to their Content Research Modernization effort. They have signed a half billion dollar EDP to move their most critical apps to AWS and modernize on containers. They are in a POC phase to finalize tech stack they want to run on. The existing applications are running on EC2's, some in the on-prem data centers, ECS and Lambdas as well. Their footpring on ECS (which is the only containerization platform in use in Prodction) is very small. They are doing a POC with EKS. 

**Customer Attendees**
Dan Bugent, Senior Architect
Jeff Wheeler, Director of API Platform
Henry Yan - Service Mesh Team Lead
Ming - Software Architect
Bob - Architect
Viji Sarathy - AWS, Container SSA
Bhavna Sarathy - AWS, Containers GTM Specialist
Srinivas Shaik - AWS, SA
Sidharth Chauhan - AWS, SA

**AWS Attendees**
Viji Sarathy - Container SSA
Bhavna Sarathy - Containers GTM Specialist
Srinivas Shaik - Account SA
Sidharth Chauhan - Account SA

**Notes from First Customer Meeting on July 6**

TR's architects presented details about how they intent to have 100s of AWS accounts where several AWS managed services consumed by their containerized workloads will reside. They plan on provisioning 3 separate EKS clusters for each of the three big categories namely, RAS, VAR and GCS. 
They want to dive deep into lot of areas such as:
- Managing north-south traffic using API Gateway or CloudFront
- Managing east-west traffic with Ingress Controllers.
- Facilitating communication between services across different clusters
- Better understand deployment choices with AppMesh
- GitOps based deployment.

**Istio vs. AppMesh:** 
Though their platform team is experience with Istio, they have concerns about technical support for Istion in their production environments. They have experimented with Istio. Their architecture team's (Dan and Bob) strategy is to leverage AWS Services if the capability exists. Hence, there is a lot of interest in App Mesh. 

We will be following up the initial discovery call with a series of meeting, each focussing on deep-dives into one or more of these specific areas.


