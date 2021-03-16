This is the third meeting in a continuing series of discussions with Pega about their migration from monolith to microservices journey.

#### Discussion about Centralized Logging ####
- Customer is a SaaS solution provider and have several hundred customers. In their legacy infrastructure, they provision services for each customer in an isolated environment using a separate VPC per customer.
- They are contemplating a similar model of one EKS cluster per customer in their microservices architecture. This could lead to hundreds of EKS clusters. They want to better understand various aspects of multi-tenancy in Kubernetes before they decide to adopt it in their new architecture. 
- Current EKS cluster is hosting services for just one tenant. The cluster has about 30 nodes and 250 pods. 
- The main application in their stack is what they call a "Pega Instance" which is Java EE application running under Tomcat in a container.
- Vast majority of the application logs are emitted by the Pega instance. They are currently using FluentD for shipping logds to various destinations - Splunk, CloudWatch, ElasticSearch
- They mentioned that they ran into throttling issues with CloudWatch, laregly due to the logs sent over to CW from the Pega instance. This in turn puts back pressure on FluentD. Asked if they could provide specific metrics around the volume of logs emitted by Pega instance. Asked them to check if they have increased default limits on the account which are usually to set to relatively low values. Need to also consult with CloudWatch service team about this.
- I recommended that they use Fluent Bit instead of FluenbtD as the former enables delivering logs at large scale in a more resource-efficient way. Referenced this [blog](https://aws.amazon.com/blogs/containers/fluent-bit-integration-in-cloudwatch-container-insights-for-eks/) from CloudWatch team.
- FluentD's support for a larget number of output plugins was cited as the main reason why they are using it instead of Fluent Bit.
- The Pega instance also writes logs to a file using Log4J. Asked them to look into whether the application is easily configurable so that these logs can be routed to STDOUT using Log4J's ConsoleAppender. They may have a reason for not emitting certain logs to STDOUT. In that case, I suggested that they write the logs to an EBS volume mounted to the container instead of writing to the write-layer of the image as it does today.
- They are looking into building a log aggregator service which can grab the logs from FluentD and sink it to either Kinesis Data Stream or Kafka topic, separate the logs from each customer to a separate stream and be able to make the logs available to the customer on demand.

