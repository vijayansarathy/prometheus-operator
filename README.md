This is the third meeting in a continuing series of discussions with Pega about their migration from monolith to microservices journey.

#### Discussion about Centralized Logging ####
- Customer is a SaaS solution provider and have several hundred customers. In their legacy infrastructure, they provision services for each customer in an isolated environment using a separate VPC per customer.
- They are contemplating a similar model of one EKS cluster per customer in their microservices architecture. This could lead to hundreds of EKS clusters. They want to better understand various aspects of multi-tenancy in Kubernetes before they decide to adopt it in their new architecture. 
- Current EKS cluster is hosting services for just one tenant. The cluster has about 30 nodes and 250 pods. 
- The main application in their stack is what they call a "Pega Instance" which is Java EE application running under Tomcat in a container.
- Vast majority of the application logs are emitted by the Pega instance. They are currently using FluentD for shipping logds to various destinations - Splunk, CloudWatch, ElasticSearch
- They mentioned that they ran into throttling issues with CloudWatch, laregly due to the logs sent over to CW from the Pega instance. This in turn puts back pressure on FluentD. Asked if they could provide specific metrics around the volume of logs emitted by Pega instance. Asked them to check if they have increased default limits on the account which are usually to set to relatively low values. Need to also consult with CloudWatch service team about this.
- I recommended that they use FluentBit instead of FluenbtD as the former enables delivering logs at large scale in a more resource-efficient way. Referenced this [blog](https://aws.amazon.com/blogs/containers/fluent-bit-integration-in-cloudwatch-container-insights-for-eks/) from CloudWatch team.
