#### Meeting on March 18,2021 ####

#### Attendees ####
Eric Bomarsi (SA)
Viji Sarathy (SSA)
Bhavna Sarathy (GTM)
Omar Lari (BDM)
Jake Farell (Acquia)
Ed Brennan (Acquia)
Matt Morley (Acquia)


#### Limitations of Provisionong Mega Clusters ####

The issue they have with provisioning large/mega clusters is not so much about the number of worker nodes that they might need as it is about running out of ENIs. Note that what we are talking about is not the [limits on primary and secondary ENIs attached to worker nodes](https://github.com/awslabs/amazon-eks-ami/blob/master/files/eni-max-pods.txt) as pods land on them. This is related to the ENIs used by various AWS Managed Services such as ElastiCache, Aurors, EFS Mount Targats etc. Customer mentioned that they were informed that there is a hard limit of 1200. We need to discuss this internally with a Networking SME. 

During the course of discussions, the customer mentioned that they have 150 EKS clusters and provision about 35-40K persistent volumes. Need to clarify if those are the numbers they are looking at or if it is what they have today.

#### Complaints about Secrets Manager Costs ####

Customer pointed out that they estimate a monthly spend of 70K on storing database credentials, connection strings in AWS Secrets Managers for the 1000s of instances of Aurors database that they will provison. Today, they are using Percona MySQL. They have a single-tenant environment for each customer - basically dedicated EC2 instances. They retrieve the tenant-specific credentials for the databases from their storage and deploy that to the EC2 instance. When they move to running a Pod in EKS, then they will expose the credentials using K8s Secrets but the latter is seeded from secrets from AWS Secrets Manager. Customer's contention is that they should not have to incur any charges to make two AWS services (Pod in EKS and Aurora database) talk to each other. In their calculation, the use of AWS Secrets Manager for this use case should be free!! This is more of a sales issues than a technical one.

#### Support for Tags in IRSA ####
What the customer wants here is the support for tag-based permissions so that they can add tags to the **Condition** element of an IAM policy and tailor the policy’s permissions and limits its actions and resources. This will allow them to drastically cut down the number of IAM roles/polcies to be creates for using IRSA across 1000s of K8s service accounts. They would like to use K8s labels/annotations from the pods for these tags. Somethign as follows, perhaps.

```json
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action":[
            "dynamodb:*"
         ],
         "Resource":"*",
         "Condition":{
            "StringEquals":{
               "k8s:DatabaseTag/Customer":"XYZ"
            }
         }
      }
   ]
}
```
so that a Pod with a K8s label "DatabaseTag/Customer" set to the value "XYZ" will be allowed to have DynamoDB access






