# Mono2Micro Sample Application

Please read the user guide to learn more about Mono2Micro and the various tasks of application data collecting, running the analysis, viewing the analysis results, and generating starter micrservices java code.

To get you started, here are some examples of monolith applications, data and analysis files, and microservices code

## DefaultApplication - Application Data, Analysis, Source

Monolith source code: ```./defaultapplication/monolith```

Monolith application data: ```./defaultapplication/application-data/```

Mono2Micro analysis (initial recommendations): ```./defaultapplication/mono2micro-analysis```

Mono2Micro analysis (further customized by hand): ```./defaultapplication/mono2micro-analysis-custom```


## DefaultApplication - Refactored to microservices with Mono2Micro

Refer to the Mono2Micro user guide for detailed guidance on how to further develop the initial partitions recommended by the AI analysis to customize the final partitioning of the application (see above), refactor the application's server config files, build config files, and JEE deployment descriptor files, and containerize the partitions to run as these microservices in Docker.

### See the Microservices application in action!

In just a few simple steps below, you can build and deploy the microservices to local docker containers on your workstation, and see them running for yourself. 

**Prerequisites:** 

- Docker 17.06 CE or higher, which supports multi-stage builds

**Steps:** 

Clone this github repository to your local workstation:
```
git clone https://github.com/kpostreich/m2m-ws-sample
```
Change directory to the refactored microservices source code:
```
cd ./m2m-ws-sample/defaultapplication/microservices/
```

First, create a Docker network for the microservices to communicate:
```
docker network create defaultappNetwork

docker network list
```

Build and start the defaultapplication-web container. This container is the web front end. It contains the html, jsp, and servlets servlets. 

```
cd ./defaultapp-web

docker build -t defaultapp-web  . | tee web.out

docker run --name=defaultapp-web --hostname=defaultapp-web --network=defaultappNetwork -d -p 9080:9080 defaultapp-web:latest
```

Build and start the defaultapplication-partition0 container. This container is the Increment Service backend for hitcount. It contains the EJB and Derby DB. 

```
cd ./defaultapp-partition0

docker build -t defaultapp-partition0 . | tee part0.out

docker run --name=defaultapp-partition0 --hostname=defaultapp-partition0 --network=defaultappNetwork -d -p 9081:9080 defaultapp-partition0:latest
```

**Test the Microservices**

Once all the containers have started successfully, the DefaultApplication can be opened at `http://localhost:9080/`

```
- run snoop service from the web browser 

    (The username and password is: user1 / change1me)

- run the hitcount service, choosing each of the following options from the application in the web browser. 
  
  These all run in the defaultapp-web container. 
    a. Servlet instance variable
    b. Session state (create if necessary)
    c. Existing session state only

  This calls the IncrementAction Service in the defaultapp-container0 container. It is an EJB and uses JPA to persist to the Derby database. 
    d. Enterprise Java Bean (JPA)

```

**View the logs in the running containers**

Quickly view the logs from the microservices. 

**Note:** The logging level in the micorservices has been set to **INFO** in order to log the details of cross partition service calla, and the response data. To chnage the logging level, refere to the **Logging** section below. 

```
docker logs defaultapp-web

    INFO: [IncrementAction] Calling service http://defaultapp-partition0:9080/rest/IncrementActionService/getTheValue with form: {}
    [err] Nov 20, 2020 8:20:27 PM com.ibm.defaultapplication.IncrementAction


docker logs defaultapp-partition0

    INFO: [IncrementAction] Calling service http://defaultapp-partition0:9080/rest/IncrementActionService/getTheValue with form: {}
    [err] Nov 20, 2020 8:20:27 PM com.ibm.defaultapplication.IncrementAction
```


## Logging

To modify the level of logging and tracing in the Mono2Mirco generated code and see more or less information about what's happening in the code flow within and between microservices, change the ```DEFAULT_LOG_LEVEL``` variable in the each partition's ```com.ibm.cardinal.util.CardinalLogger``` Java source file located in the ```cardinal-utils``` module. Then rebuild and run the updated services. 





