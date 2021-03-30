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
What we provided was the best assessment the Zipline Team is able to provide based on the logs enabled and provided by the customer.  
- The customer did not have sufficient logging at several levels which would be required to determine with any certainty how this event occurred within the EKS application/container/cluster.  
- The Zipline Team provides analysis and assistance with AWS Service logs, even if the customer had had application logging enabled, we would not be able to provide application, container, or host-level forensics to diagnose an application vulnerability.  
- The evidence provided indicates that the actor had access to 1 AWS user credential and 1 AWS instance credentials, with no apparent link between the two. 
- Although we can’t say with certainty, given that the EC2 instance credentials were used outside AWS and not on the instance itself, this indicates that there may have been a vulnerable application running on a container which leaked the instance credentials.  
- Furthermore, the customer’s security team informed the Zipline Team that SSH was not configured on the instance and no other known CLI method was enabled, this provides additional credibility to the indications that an application-level vulnerability may have allowed the actor to gain access to the instance credentials.


#### EKS Security Review ####
Ahead of the meeting, I had pointed out the EKS Best Practices guide and asked the customer to review the security best practices. But the customer came very unprepared for the meeting and could not even produce a diagram that showed their architectire and deployment footprint. Here are some of the important points gathered about their deployment:
- All Java based applications
- Source code repositories are in Github. There used to be some public repos but in the aftermath they have made them all private
- Using JFrog as the image registry
- They are using Istio 
- Traffic ingresses from the edge on their CDN, take a few hops and then makes it to AWS API Gateway endpoints which are private. 
- They have VPC PrivateLink bridging API Gateway and the NLB fronting the services in their EKS cluster.
- EKS cluster is private. 
- They are running workloads such as Kafka and ElasticSearch as StatefulSets in their cluster
- User authentication to EKS cluster uses Okta. Okta groups are mapped to IAM roles. 
- Even after the incident, the customer was using AWS credentials hard-coded as environment variables to enable their workloads to access S3.
- They are using RDS databases but are not managing credentials using AWS Security Manager.

The customer asked if they could have a prescriptive list of security best practices. 
I walked them through the recommendations in the EKS Best Practices guide under Image Security, Runtime Security, Pod Security etc. We did not have time to cover every aspect of secrity and suggested that the customer read through that document and address the gaps much like how they conduct a WAR.












