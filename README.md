# Transforming Monolithic Applications to Microservices with Mono2Micro

![](https://ibm-cloud-architecture.github.io/modernization-playbook/static/215a27d8fbf89d8d756427f855bc4f3a/e8c66/1-m2m.png)

## Contents
  - [Contents](#contents)
  - [Why this tutorial matters?](#why-this-tutorial-matters)
  - [Tutorial sessions](#tutorial-sessions)
    - [Session 1: Background and Case-Studies](#session-1-background-and-case-studies)
    - [Session 2: Assessing applications and recommending microservice partitioning with Mono2Micro](#session-2-assessing-applications-and-recommending-microservice-partitioning-with-mono2micro)
    - [Session 3: Automated Conﬁguration Discovery](#session-3-automated-conﬁguration-discovery)
    - [Session 4: Validating Transformed Applications](#session-4-validating-transformed-applications)
  - [Hands-on Lab](#hands-on-lab)
    - [Overview](#overview)
    - [Prerequisites](#prerequisites)
      - [Setup](#setup)
    - [Part 1: Instrumenting your java code to collect runtime traces](#part-1-instrumenting-your-java-code-to-collect-runtime-traces)

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

## Hands-on Lab

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

### Part 1: Instrumenting your java code to collect runtime traces
