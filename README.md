#### Additional Comments from Customer Meeting on March 10, 2021 ####

Customer wanted us to do a review of their current architecture on EKS.
Here are the salient points.

- They will start onboarding production workloads to EKS starting April.
- They have had several cloud native applications developed in the last few years and they expect to migrat them all to EKS in about a year.
- Some of their biggest applications (like Spectrum on Demand) have monlolithic architecture and it will not be ready until well into 2022 for migration.
- Their applications depend on ~1TB of data that has to be provisioned either on EBS or EFS storage.
- Using Terraform scripts for cluster provisioning
- Each set of applications that make up a "product" are deployed into a separate namespace.
- They provision a separate Ingress Controller + NLB per namespace so that they can easily segregate traffic amongst different products. They mentioned that they had some issues getting the source IP of request even with PROXY protocol turned on in NLB. I suggested that they move over to using NLB in IP mode which is a better deployment option and also supports preserving source IP without PROXY protocol.
- They are using Let's Encrypt + Cert Manager for all their certificate needs. SSL traffic is terminated at the Ingress Controller.
- Their Cloud Platform team which owns operating the cluster has developed their own home-grown service that development teams use to deploy services to the cluster. Essentially a wrapper on top of 'kubectl".
- One of the vakue-add services their Cloud Platform team provides to other development teams is the ability to provision RDS database instanaces needed by microserivces developed by each team. However, the way they have implemented this did not look right to me. They ask the development teams to fill out sort of a request for RDS instance and then they use Terraform to provision this database before the team is ready to deploy their microservices. What they need here is a customer controller that can handle the provisioning of RDS. ACK service controller for RDS is not ready yet. I suggested that they look into K8s Service Catalog which is an extension API that enables applications running in K8s clusters to easily use external other manages services such as RDS.
- They are using Prometheus, AlertManager and Grafana for metrics collection, monitoring and alerting.
- They do plan on adopting Amazon Managed Prometheus and Managed Grafana when they are both GA and have 100% feature parity with self-managed Prom/Grafana.
- They had some concerns about IP exhaustion in their VPC but, surprisingly, had not heard of the customer networking option supported by the VPC CNI plugin! Suggested that they use that and provisiong Pod IPs from a separate CIDR.
