# Transforming Monolithic Applications to Microservices with Mono2Micro

![](https://ibm-cloud-architecture.github.io/modernization-playbook/static/215a27d8fbf89d8d756427f855bc4f3a/e8c66/1-m2m.png)

## Contents

- [Transforming Monolithic Applications to Microservices with Mono2Micro](#transforming-monolithic-applications-to-microservices-with-mono2micro)
  - [Contents](#contents)
  - [Why this tutorial matters?](#why-this-tutorial-matters)
  - [Tutorial sessions](#tutorial-sessions)
    - [Session 1: Background and Case-Studies](#session-1-background-and-case-studies)
    - [Session 2: Assessing applications and recommending microservice partitioning with Mono2Micro](#session-2-assessing-applications-and-recommending-microservice-partitioning-with-mono2micro)
    - [Session 3: Automated Conﬁguration Discovery](#session-3-automated-conﬁguration-discovery)
    - [Session 4: Validating Transformed Applications](#session-4-validating-transformed-applications)
  - [Preparing for the Hands-on Lab](#preparing-for-the-hands-on-lab)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Sample Application](#sample-application)
  - [The Hands-on Lab](#the-hands-on-lab)
    - [Part 1: Instrumenting your java code to collect runtime traces](#part-1-instrumenting-your-java-code-to-collect-runtime-traces)
    - [Part 2: Instrumenting your java code to collect runtime traces](#part-2-instrumenting-your-java-code-to-collect-runtime-traces)

## Why this tutorial matters?

Enterprises are progressively migrating production workloads to the cloud to take advantage of cloud-native characteristics such as faster infrastructure and service delivery, flexibility, scalability, reliability, and security. Monolithic applications must often be fragmented into cloud-native designs, such as microservices, in order to take advantage of these characteristics.

A microservice encompasses a small, well-defined set of business functions and communicates with other services using lightweight mechanisms, which are frequently implemented as RESTful APIs. According to a recent research, just 20% of enterprise workloads are in the cloud, and those that are were predominantly developed for native cloud architectures. This leaves approximately 80% of legacy applications on-premises, awaiting refactoring and modernization in preparation for the cloud.

This tutorial will examine the rationale for updating and transferring legacy systems to the cloud, backed by illustrative industrial case studies. Then, we'll walk through a step-by-step tool-supported approach for transitioning a monolithic Java program into microservices. Following that, a hands-on virtual lab will allow participants to apply their newly acquired knowledge to a real-world enterprise application. Finally, we will finish the tutorial with a discussion of interesting future paths for study in the field of application modernization more broadly.

## Tutorial sessions

### Session 1: Background and Case-Studies

We will kick-off the tutorial with an introductory session that will motivate the challenge of application modernisation. First, we'll go through the theoretical and practical foundations of a microservice architecture. Then we'll talk about why application modernisation is such a difficult task. Following that, we will go through an overview of practitioners' demands as well as the trials and tribulations of embarking on the application modernization path. The presentation finishes with a case study and some cutting-edge methods to application modernisation. The session concludes with a case study and some state-of-the-art approaches for application modernization.

**Presenter:** Jin Xiao

**Slides:** TBD

### Session 2: Assessing applications and recommending microservice partitioning with Mono2Micro

In this session, we will go through methodologies for analyzing application code and extracting runtime traces in depth. We'll show how we can use this to (a) reason about application behavior, (b) extract business logic, and (c) find optimum microservice candidates. We will talk about how AI may be used to provide microservice suggestions automatically using static and/or dynamic analysis approaches. We will investigate clustering, graph embedding, and evolutionary search strategies in order to generate module partitions with desirable qualities such as strong cohesion and low coupling. The session concludes with a review of several software metrics for evaluating the quality and efficiency of decomposition.

**Presenter:** Anup Kalia

**Slides:** TBD

### Session 3: Automated Conﬁguration Discovery

This session is about managing the configuration of refactored monolithic apps. When restructuring monolithic applications into a microservice architecture, determining which microservice requires which configuration parameter may be difficult and time-consuming. For example, if you switch frameworks at the same time, such as from SprintBoot to Quarkus, it becomes more difficult since the configuration format, parameter names, and values may change. This session will go through ways for dealing with such difficulties. In particular, we explain ways for discovering configuration information in programs, as well as approaches for transforming it from the source format you have to the target format you want.

**Presenter:** John Rofrano

**Slides:** TBD

### Session 4: Validating Transformed Applications

This session focuses on strategies for verifying the transformation of a monolithic program to a microservice application. In this session, we will first explain a broad approach to test-driven modernization, which consists of a series of stages for implementing testing in diverse modernization situations in an effective and efficient manner. Then, we'll show you a tool that implements some of the approach's phases, specifically for unit testing Java apps. The program allows for automated test creation as well as differential testing. It generates tests based on a unique coverage criterion that is tailored to application partitioning (but also applicable more broadly) and exercises methods based on combinations of different types of method parameters, with the goal of validating inter-partition communication in the transformed application. The program uses combinatorial test design (CTD) to method signatures to construct a CTD model from which an automated test plan with varying interaction levels is built. Following that, a test generator creates test sequences that cover the test plan and publishes them as executable JUnit test cases. We will use an example Java program to showcase the tool, with tests built on the monolithic application version and performed against the converted application.

**Presenter:** Saurabh Sinha

**Slides:** TBD

## Preparing for the Hands-on Lab

In this virtual lab, you will:

1) Run Mono2Micro’s Bluejay tool to analyze the Java source code, instrument it, and produce the analysis files that will be used as input to the Mono2Micro’s AI engine.

2) Use Mono2Micro’s Flicker tool to gather time stamps and use case data as you run test cases against the instrumented version of the monolith application.

3) Use Mono2Micro’s Oriole analyzer tool (AIPL) to produce the initial microservices recommendations.

4) Use Mono2Micro’s UI tool to visualize the microservice recommendations and modify the initial recommendations to further customize the microservice recommendations.

### Prerequisites

The following prerequisites must be completed prior to beginning this lab:

- A UNIX based operating system (windows users please enable [WSL support](https://docs.microsoft.com/en-us/windows/wsl/install))
- The latest Docker (3.5.2)
- Git CLI (needed to clone the GitHub repo)
- Java 1.8.0
- Maven 3.6.3 (or above)
- 3 GB free storage for the Mono2Micro Docker images and containerized microservices

### Setup

_NOTE: Windows users, please use WSL._

1. Download and install [docker](https://docs.docker.com/get-docker/).
   _(For windows, see instructions [here](https://docs.docker.com/desktop/windows/wsl/))_

2. Pull the docker images for `mono2micro-aipl` and `mono2micro-ui`:

    ```sh
    docker pull ibmcom/mono2micro-bluejay

    docker pull ibmcom/mono2micro-aipl

    docker pull ibmcom/mono2micro-ui
    ```

3. Verfiy

    ```sh
    docker images | grep ibmcom
    ```

    You should see the following:

    ```sh
    ibmcom/mono2micro-bluejay   latest    090f164b442e   6 weeks ago   359MB
    ibmcom/mono2micro-aipl      latest    06671bd874e4   6 weeks ago   478MB
    ibmcom/mono2micro-ui        latest    06a651a522bb   6 weeks ago   2.87GB
    ```

4. A sample application ([see below](#sample-application)) that will be used in this tutorial will available in this repository. Please clone a copy of this repository before the session.

    ```sh
    git clone https://github.com/rahlk/ASE21-Tutorial
    ```

### Sample Application

We will use a sample application to demonstrate how Mono2Micro works. The sample monolithic application performs two simple functionalities, in the backend:

   * Snoop: to check for requests and display information about it; and
   * Hit Count: to demonstrate various methods that can be used to increment a counter, e.g.,  existing sessions, application
   attributes, and request attributes, etc.

There is also a front end component with a simple UI which includes the HTML, JSPs, and Servlets, all needed to run the application and interact with it on a browser. Something like this:

![](https://ibm-cloud-architecture.github.io/modernization-playbook/static/d6d9799edb7beab1d12d94d4634d4924/f79d7/34-defaultapp-9080.png)

## The Hands-on Lab

### Part 1: Instrumenting your java code to collect runtime traces

In this part of the tutorial, you will run **BlueJay** , which instruments the monolithic Java program to log entry and exit times in each method. In essense, it performs a static analysis  to gather a detailed overview of the Java code in the monolith, for use by Mono2Micro’s AI analyzer tool to come up with recommendations on how to partition the monolith application.

To run BlueJay, we use the following command:

  ```sh
  docker run -e LICENSE=accept --rm -it -v /your/absolute/path/to/defaultapplication/:/var/application ibmcom/mono2micro-bluejay /var/application/monolith out
  ```

  ![Screen Shot 2021-11-11 at 11 43 29 AM](https://user-images.githubusercontent.com/1433964/141336296-a3783766-f9ea-40f6-ad0a-1a3990fd365c.png)

__Note: The command displays the directory where the output files were generated, as illustrated below.__

In this example: `/your/absolute/path/to/defaultapplication/monolith-klu`

If you look inside `/your/absolute/path/to/defaultapplication/monolith-klu`, you'll see the following:

![image](https://user-images.githubusercontent.com/1433964/141337140-8494bbb9-4bf7-4a8b-b6ab-e9f91668e0b3.png)

Bluejay creates two .json files in the in the monolith-klu directory:

- refTable.json
- symTable.json

These json file capture various details and metadata about each Java class such as:

- method signatures
- class variables and types
- class containment dependencies (when one classes uses another class as a instance variable type, or method return/argument type)
- class inheritance
- package dependencies
- source file locations

You can look at the instrumentation in the code, for example:

```sh 
vim /your/absolute/path/to/defaultapplication/monolith-klu/DefaultWebApplication/src/main/java/HitCount.java
```

As illustrated below, you will find `System.out.println(…)` statements for the entry and exit of each method in the classes.

This trace data captures the Thread ID and Timestamp during the test case execution flow, which you will perform later in the lab. 

![Screen Shot 2021-11-11 at 12 00 53 PM 1](https://user-images.githubusercontent.com/1433964/141338567-b9cbc4ba-13c6-48d8-9b40-5112f61bb2d5.png)

Finally, change the permissions on `monolith-klu` directory, so that it can be updated by the current user.

```sh
sudo chmod -R 777 /your/absolute/path/to/defaultapplication/monolith-klu
```

### Part 2: Instrumenting your java code to collect runtime traces

The next step is to run test cases against the instrumented monolith application to capture runtime data for analysis. Since this is a simple application, you will run the test cases manually using the applications web UI. There are only two use cases for this simple application.: Snoop and Hit Count.

As these use cases are run on the instrumented monolith application, you will use Mono2Micro’s Flicker tool to record use case labels and the start and stop times of when that use case or scenario was run. 

