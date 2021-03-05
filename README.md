## TimePlay ##
### Attendees ###
The-Binh Le (TimePlay)
Viji Sarathy (SSA, AWS)
Connor Long (TAM, AWS)

### Background ###
Timeplay has a real-time interactive gaming platform.
The platform is a combination of workloads that run directly on EC2 as well as ECS/Fargate

They deploy many player "rooms", each room serves 1000 players (in the future they could consider up to 10,000 players per room, but  this is not our focus for now). Each room employs 10 - 15 independent cluster/service/tasks running on ECS/Fargate. Each task has its dedicated cluster + service. They use Application Auto Scaling with target tracking policy for autoscaling based on CPU usage. 

In addition to ECS/Fargate tasks, each room also employs a number of EC2 instances. Most of them are of the t2|t3 family.
Aside from these, they use g4dn.xlarge (no scaling) instance as their game server and and one (or more) r5.4xlarge instances which run streaming components of their platform.
