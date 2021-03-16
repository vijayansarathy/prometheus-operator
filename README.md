
## Cimpress/VistaPrint ##
### Attendees ###
VistaPrint CARE Team, Tunis
Cayce Marston - CSM
Donny Omosa - TAM

### Meeting Date: March 11, 2021###

### Bacground ###
Cimpress sells cutomized products (business cards, yard signs, T-shirts, etc.) on their e-commerce web site. They have several subsidiaries and VistaPrint is the biggest one, accounting for nearly 60-70% of their revenues. They have developed MCP - Mass Customization Platform comprising of several dozen microservices that powers their e-commerce site. They have several development teams spread all over the US and Europe that have been given the autonomy to develope microservices with technologies of their choosing and expose them using well-defined APIs that other teams can easily consume.

Though AWS is their main Cloud platform that accounts for >90% of the spend on Cloud, several teams developing microservices on K8s were using GKE. A big reason for this was that GitLab is their choice for source control and it had better integrations with GKE. Cimpress recenly signed a 5 year, ~125M EDP and following that there has been a push to move all production services to AWS, including the ones running on GKE.

The account team SA recently condiucted a Well-Architected Framework Review for the CARE Tech team.  It was requested by Jeremy Potash, Director of Technology.  This WAFR was completed on Wednesday of last week.  To net it out, the #1 follow-on activity was a review of the CARE Tech team’s container architecture for their planned migration.  They plan to “flip the switch” on their migration in 2-3 weeks.
###
