# devops-interview-project-Final

Requirements: Python 3.10+, Docker

To get things started:

Run docker-compose.yml found in the main directory to build the containers using this command (docker-compose -f docker-compose.yml build)

Follow by this command to startup the containers (docker-compose -f docker-compose.yml up)

When all services are up and running: open any browser and type in these urls :
1. http://localhost:3050/token  - Generate a Token with one of these user's (username:alice,password:password, username:bob,password:password, username:charlie,password:password)

2. http://localhost:3050/transaction - Use a token generated on step 1 to perform a transaction.

3. http://localhost:8001/ - This is Redis Insight Container it provides an intuitive and efficient graphical interface for Redis, allowing you to interact with your databases and manage your data.
- To login: select Connect to Redis DB using port and hostname - Hostname is 169.10.0.10 and Port is 6379 and for DB choose anything.

# The structure of the project

- docker-compose will take care of building and running the services. No need to run each service manually.
- This file will build and run 6 containers for us. (Auth-API,Transaction API, Loyalty Worker, Redis, RedisInsight, NGINX)
- You will notice that I used static IP for each service. This was done on purpose to solve a problem with the Redis container.
- When Redis IP was Dynamic it would affect Transaction API and Loyalty-Worker and RedisInsight whenever IP changes or re-build a container.
- I used NGINX as a routing proxy to pass traffic to the correct microservice and to implement path-based routing.

