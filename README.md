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
- Provision on the fly environments..
- Lot of github








