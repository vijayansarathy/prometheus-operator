#### Meeting on March 30, 2021 ####


#### Attendees ####
Suma Potluri (Arlo)
Satish (Arlo)
Wedge Martin (AWS)
Sarathy, Viji (AWS)


#### Background ####
Customer neeed advice on how best to use a CloudWatch metric for autoscaling workloads in EKS. They have been using a third-party tools for autoscaling and reported issues with this tool.


#### Autoscaling Discussion ####

- Customer is trying to autoscale EKS workloads based on the CloudWatch metric for SQS, namely, **NumberOfMessagesSent**
- As this is a monotone increasing value, they will have to compute a rate-metric based on this before it can be used for autoscaling. They are doing this using CloudWatch metric math expressions.
- The third party tool they are using is none other than [CloudWatch Custom Metrics Adapter for Kubernetes](https://github.com/awslabs/k8s-cloudwatch-adapter) to compute this metric and feed it to the Kubernetes HPA for autoscaling.
- They reported that some of the metric values computed by the adapter were erroneous which affected autoscaling.
- They also clarified that when they use AWS CLI (aws cloudwatch get-metric-data) to compute the metric values with the same metric expressions, the values were OK.
- The details of the conversation with the customer and some of my suggestions are capture in this [Github issue](https://github.com/awslabs/k8s-cloudwatch-adapter/issues/76)

Bottom line is that the customer issue happens to be something related to the way the adpater works and they are asking for official suppory from AWS for this adapter because they intend to use it for other autoscaling scenarios in EKS clusters. The project was published under the awslabs Github organization. AFAIK, AWS does not officially support projects under this org. It is open source after all and the code is not complex and so I provided some guidance to the customer about making some simple code changes and trying a few things wit their own build. But it is all strictly _caveat emptor_.












