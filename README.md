#### Meeting on March 26,2021 ####
Purpose of the meeting was to conduct a security review of customer EKS deployment.


#### Attendees ####

Holicka, George (HBC)
Blyuss, Igor (HBC)
Perri, Stephen (AWS)
Bertolazzi, Renan (AWS)
Sarathy, Bhavna (AWS)
Sarathy, Viji (AWS)


#### Background ####
On Match 16, 2021 an attacker gained access to the access key used by the application in an EKS cluster. With this, the attacker was able to obtain read and write access to Secrets Manager using the AWS API, list and read S3 buckets, describe EC2 instance, and ECS/EKS clusters. AWS Support assisted with reviewing and containing the breach and was looked into reviewing VPC Flow logs and CloudTrail logs to identify how the attacker could have obtained the access key.

#### Assesement from Zipline Team ####
The customer engaged the Zipline Team and here is their take on the incident:
What we provided was the best assessment the Zipline Team is able to provide based on the logs enabled and provided by the customer.  The customer did not have sufficient logging at several levels which would be required to determine with any certainty how this event occurred within the EKS application/container/cluster.  The Zipline Team provides analysis and assistance with AWS Service logs, even if the customer had had application logging enabled, we would not be able to provide application, container, or host-level forensics to diagnose an application vulnerability.  At this evidence provided indicates that the actor had access to 1 AWS user credential and 1 AWS instance credentials, with no apparent link between the two.  Although we can’t say with certainty, given that the EC2 instance credentials were used outside AWS and not on the instance itself, this indicates that there may have been a vulnerable application running on a container which leaked the instance credentials.  Furthermore, the customer’s security team informed the Zipline Team that SSH was not configured on the instance and no other known CLI method was enabled, this provides additional credibility to the indications that an application-level vulnerability may have allowed the actor to gain access to the instance credentials.



#### Current Challenges ####
Issues faced currently:
- Being able to handle deployments across multiple services with different versions  across environments
- Handling orchestration. 
- Provision on the fly environments.

One of the main pain points for the customer is that they did not have a service discovery mechansim in their cluster. They were not familiar with AWS CloudMap and I gave them a overview of the service and also demonstrated a working example of ECS service discivery with CloudMap. Most of their services are stateless and can run on Fargate.

Suggested the following approach as a potential/viable solution for provisioning disposable testing environments for development teams:
- Provision a stable version of services that can be used by other dependent services and register them with CloudMap so that they are discoverable.
- Leverage AWS CloudMap for registering other managed services like RDS instances used by services.
- Provision ALBs in IP mode with target groups for services that need to be exposed for external access
- Deploy services to ECS/Fargate and register with ALB so that development teams can test them and then tear them down.









