#### Meeting on March 29,2021 ####
Purpose of the meeting was to conduct a security review of customer EKS deployment.


#### Attendees ####

Mick Morse (MalwareBytes)
Jon Paul Lussier (MalwareBytes)
Josh Funk (MalwareBytes)
Pavel Zamoshin (MalwareBytes)
Paul Wagner (MalwareBytes)
Niazi, Ali (AWS)
Gupta, Anuj (AWS)
Sarathy, Viji (AWS)


#### Background ####
Customer is expanding EKS deployments and working on observability solution for their EKS clusters. They have plans to use EKS/Fargate in future. They are looking for guidance and best practices on EKS observability setup. 


- Customer has been using ECS for production workloads 
- Running about 1600 containers on ECS
- Workloads are spread across more than a dozen ECS clusters.
- Cited multi-tenancy or the lack thereof as one of the primary reasons for migrating to EKS from ECS
- They expect to start moving productoion workloads to EKS next quarter
- They also have workloads that are running non-containerized, some of them running on Beanstalk
- They are using ECS/Fargate to run some ephemeral tassk and scheduled tasks
- They have stood up a Dev EKS cluster and are doing a MVP for multi-tenancy
- Considering various monitoring/loggin solutions


#### O11y Discussion ####

- Customer first wanted clarification about what AWS recommends for logging in EKS environment. They had seen the [recent blog post](https://aws.amazon.com/blogs/containers/fluent-bit-integration-in-cloudwatch-container-insights-for-eks) that discusses in detail the beneftis of using FluentBit for log collection. Advised them to start with FluentBit if they starting off with a clean slate
- Customer wanted clarifications about how to send logs to different destinations such as Kinesis, CloudWatch etc. with FluentBit
- Customer was not familiar with metrics gathering optiosn using CloudWatch Container Insights. Explained to them how the agent is deployed as a daemonset to collect system metrics and as a Deployment to collect Prometheus metrics.
- Explained about recent release of Managed Prometheus and Managed Grafana.
- Suggested that they get started on instrumenting their current ECS workloads using Prometheus client library and test out metrics collection. Pointed out the recent blog post that could be leveraged for gathering Prometheus metrics from ECS workloads.












