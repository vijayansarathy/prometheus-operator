#### Meeting on March 25,2021 ####

#### Attendees ####
Steve Flinchbaugh (Kustomer)
Patrick Ng ((Kustomer)
Greifenberger, Jonathan (AWS)
Cintron, Daniel (AWS)
Sarathy, Bhavna (AWS)
Sarathy, Viji (AWS)


#### Background ####
Kustomer has a customer service CRM platform
Context: Kustomer architecture involves 100's of micro-services (ECS backed) along with large no of load balancers (around 70 ALB's) with multiple functionalities being tested by different teams at different intervals. The teams have been testing the services they develop in their respective local environments. Given the many dependencies that each team's services have, it is becoming increasingly difficult for them to do the testing locally.Customer is looking to create disposable QA environments that can be brought up and used for testing at will. 

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









