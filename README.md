## TimePlay ##
### Attendees ###
The-Binh Le (TimePlay)
Viji Sarathy (SSA, AWS)
Connor Long (TAM, AWS)

### Background ###
Timeplay has a real-time interactive gaming platform.
The platform is a combination of workloads that run directly on EC2 as well as ECS/Fargate

- They deploy many player "rooms", each room serves 1000 players. 
- Each room employs 10 - 15 independent cluster/service/tasks running on ECS/Fargate. 
- Each task has its dedicated cluster + service. 
- They use Application Auto Scaling with target tracking policy for autoscaling based on CPU usage. 
- The number of tasks per room may scale out to anywhere from 30-50. 
- They can have up to 100 rooms at peak which makes it a total of about 3000-5000 tasks/containers.

In addition to ECS/Fargate tasks, each room also employs a number of EC2 instances. 
- Most of them are of the t2|t3 family.
- Aside from these, they use g4dn.xlarge (no scaling) instance as their game server (one such instance can serve 2-3 rooms)
- One (or more) r5.4xlarge instances which run streaming components of their platform. 

Currently, they have 8 rooms (1,000 players/each) for production, but within a month or so, they will need 3 - 4 additional rooms with 1,000 players each.

## Scaling Challenge ##
The games run for set periods of time (Thursdays for 3 hours from 10-1pm EST, as an example). They know exactly when the game will start and finish. These games are always planned in advance (minimum 1 week notice that a game will be taking place at a future date). Currently, they run these games by spinning up the entire infrastructure several hours before the game actually starts. They expect to grow from their current weekly players (6000 today) to 10,000 in the next 1-2 months. **The customer's main concern is that it takes about 60 seconds for ECS tasks to spin up on Fargate. Given the real-time, interactive nature of their application, they want tasks to spin up in a few seconds!!** Currently, they have to cap the number of players/room who can enter their game to 6000 because of the inability to scale up in a couple seconds. 

Container images are about 100 MBytes. They are pulled down from Artifactory over the Internet to be deployed to Fargate. Certainly this issue should be addressed if they want to address lightning-fast scale out. But this is not the long-pole in the tent.

## Customer Asks ##
Any guidance from service team about how the customer can meet their scaling challenges on Fargate will be helpful.
