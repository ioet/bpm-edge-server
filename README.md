# Edge server

Request are handled at port: 9081
This is an edge server, all the traffic should be done using this service. 


Currently there are two services registered:

- zuul.routes.people-service.url=http://localhost:8081
- zuul.routes.skills-service.url=http://localhost:8082 

Incoming request to the above listed services are done in this way:


- http://edge-server-ip:9081/people-service
- http://edge-server-ip:9081/skills-service