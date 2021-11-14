# Transforming Monolithic Applications to Microservices with Mono2Micro

![introtext](https://ibm-cloud-architecture.github.io/modernization-playbook/static/215a27d8fbf89d8d756427f855bc4f3a/e8c66/1-m2m.png)

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
    - [Part 1: Instrumenting your Java code](#part-1-instrumenting-your-java-code)
    - [Part 2: Collect runtime traces](#part-2-collect-runtime-traces)
      - [Part 2.1 Build and package the instrumented version of the DefaultApplication](#part-21-build-and-package-the-instrumented-version-of-the-defaultapplication)
      - [Part 2.2 Run the test cases for the DefaultApplication](#part-22-run-the-test-cases-for-the-defaultapplication)
      - [Part 2.3 Review the gathered data](#part-23-review-the-gathered-data)
    - [Part 3. Partitioning the Monolith with AIPL](#part-3-partitioning-the-monolith-with-aipl)
    - [Part 4. Visualizing partitions the Mono2Mirco UI](#part-4-visualizing-partitions-the-mono2mirco-ui)
        - [Part 4.1 Viewing the partitions](#part-41-viewing-the-partitions)
        - [Part 4.2 Customizing & Adjusting Partitions](#part-42-customizing--adjusting-partitions)
        - [Part 4.3 Regenerating the partitions by rerunning AIPL against the customized graph](#part-43-regenerating-the-partitions-by-rerunning-aipl-against-the-customized-graph)

## Why this tutorial matters?

Enterprises are progressively migrating production workloads to the cloud to take advantage of cloud-native characteristics such as faster infrastructure and service delivery, flexibility, scalability, reliability, and security. Monolithic applications must often be fragmented into cloud-native designs, such as microservices, in order to take advantage of these characteristics.

A microservice encompasses a small, well-defined set of business functions and communicates with other services using lightweight mechanisms, which are frequently implemented as RESTful APIs. According to a recent research, just 20% of enterprise workloads are in the cloud, and those that are were predominantly developed for native cloud architectures. This leaves approximately 80% of legacy applications on-premises, awaiting refactoring and modernization in preparation for the cloud.

This tutorial will examine the rationale for updating and transferring legacy systems to the cloud, backed by illustrative industrial case studies. Then, we'll walk through a step-by-step tool-supported approach for transitioning a monolithic Java application into microservices. Following that, a hands-on virtual lab will allow participants to apply their newly acquired knowledge to a sample enterprise application. Finally, we will finish the tutorial with a discussion of interesting future paths for study in the field of application modernization more broadly.

## Tutorial sessions

### Session 1: Background and Case-Studies

We will kick-off the tutorial with an introductory session that will motivate the challenge of application modernization. First, we'll go through the theoretical and practical foundations of a microservice architecture. Then we'll talk about why application modernization is such a difficult task. Following that, we will go through an overview of practitioners' demands as well as the trials and tribulations of embarking on the application modernization path. The presentation finishes with a case study and some cutting-edge methods to application modernization. The session concludes with a case study and some state-of-the-art approaches for application modernization.

**Presenter:** Jin Xiao

**Slides:** TBD

### Session 2: Assessing applications and recommending microservice partitioning with Mono2Micro

In this session, we will go through methodologies for analyzing application code and extracting runtime traces in depth. We'll show how we can use this to (a) reason about application behavior, (b) extract business logic, and (c) find optimum microservice candidates. We will talk about how AI may be used to provide microservice suggestions automatically using static and/or dynamic analysis approaches. We will investigate clustering, graph embedding, and evolutionary search strategies in order to generate module partitions with desirable qualities such as strong cohesion and low coupling. The session concludes with a review of several software metrics for evaluating the quality and efficiency of decomposition.

**Presenter:** Anup Kalia

**Slides:** https://github.com/kaliaanup/ASE21-Tutorial/blob/add_slides/Mono2Micro-Tutorial-ASE-v1.pptx

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
- Java 1.8.0 (or above)
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

5. Let's enter the cloned repository and save the location for future reference.

   ```sh
   cd ASE21-Tutorial/
   export TUTORIAL_REPO=$(pwd)
   ```

6. Verify Java and Maven installations

   ```sh
   java -version
   mvn -version
   ```

   You should see something akin to this:
   ![image](https://user-images.githubusercontent.com/1433964/141499272-172c1ce0-bc46-47b4-929b-7b51006cae95.png)

### Sample Application

We will use a sample application to demonstrate how Mono2Micro works. The sample monolithic application performs two simple functionalities, in the backend:

- Snoop: to check for requests and display information about it; and
- Hit Count: to demonstrate various methods that can be used to increment a counter, e.g.,  existing sessions, application
   attributes, and request attributes, etc.

There is also a front end component with a simple UI which includes the HTML, JSPs, and Servlets, all needed to run the application and interact with it on a browser. Something like this:

![image](https://user-images.githubusercontent.com/1433964/141352835-1a5556e4-a429-4b83-8fc4-e0fee1d3b550.png)

## The Hands-on Lab

### Part 1: Instrumenting your Java code

In this part of the tutorial, you will run **BlueJay** , which instruments the monolithic Java program to log entry and exit times in each method. In essense, it performs a static analysis  to gather a detailed overview of the Java code in the monolith, for use by Mono2Micro’s AI analyzer tool to come up with recommendations on how to partition the monolith application.

To run BlueJay, we use the following command:

  ```sh
  docker run -e LICENSE=accept --rm -it -v $TUTORIAL_REPO/defaultapplication/:/var/application ibmcom/mono2micro-bluejay /var/application/monolith out
  ```

![image](https://user-images.githubusercontent.com/1433964/141353131-c6e91b95-a42e-412f-9dfb-5abef19714f6.png)

__Note: The command displays the directory where the output files were generated, as illustrated below.__

In this example: `$TUTORIAL_REPO/defaultapplication/monolith-klu`

If you look inside `$TUTORIAL_REPO/defaultapplication/monolith-klu`, you'll see the following:
![image](https://user-images.githubusercontent.com/1433964/141353385-28ac669e-5f82-4620-b83c-1ff00e920a93.png)

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
cat $TUTORIAL_REPO/defaultapplication/monolith-klu/DefaultWebApplication/src/main/java/HitCount.java
```

As illustrated below, you will find `System.out.println(…)` statements for the entry and exit of each method in the classes.

This trace data captures the Thread ID and Timestamp during the test case execution flow, which you will perform later in the lab.
![Screen Shot 2021-11-11 at 1 59 54 PM 1](https://user-images.githubusercontent.com/1433964/141354038-a59ae0d8-a71f-46b1-8293-22a39dff6597.png)

Finally, change the permissions on `monolith-klu` directory, so that it can be updated by the current user.

```sh
sudo chmod -R 777 $TUTORIAL_REPO/defaultapplication/monolith-klu
```

### Part 2: Collect runtime traces

The next step is to run test cases against the instrumented monolith application to capture runtime data for analysis. Since this is a simple application, you will run the test cases manually using the applications web UI. There are only two use cases for this simple application.: Snoop and Hit Count.

As these use cases are run on the instrumented monolith application, you will use Mono2Micro’s Flicker tool to record use case labels and the start and stop times of when that use case or scenario was run.

#### Part 2.1 Build and package the instrumented version of the DefaultApplication

1) Go to the `-klu` directory first

   ```sh
   cd $TUTORIAL_REPO/defaultapplication/monolith-klu/
   ```

2) Use maven to install the application

   ```sh
   mvn clean install
   ```

   After this, you'll see a `BUILD SUCCESS`, like so:
  ![image](https://user-images.githubusercontent.com/1433964/141352777-34041df0-cfd9-414d-83f9-3d48b9a153f6.png)

3) Run the scripts below to start the Liberty server

   ```sh
   $TUTORIAL_REPO/defaultapplication/monolith-klu/DefaultApplication-ear/target/liberty/wlp/bin/server start DefaultApplicationServer
   ```

   Now, check to see the server is running:

   ```sh
   $TUTORIAL_REPO/defaultapplication/monolith-klu/DefaultApplication-ear/target/liberty/wlp/bin/server status DefaultApplicationServer
   ```

   You'll see the following:
   ![image](https://user-images.githubusercontent.com/1433964/141352634-0df2b7ba-3078-4118-bbac-b3ee8630fba0.png)

4) Open your browser and navigate to: <http://localhost:9080>. This will open up the `DefaultApplication` and the main HTML page will be displayed.
    ![image](https://user-images.githubusercontent.com/1433964/141352835-1a5556e4-a429-4b83-8fc4-e0fee1d3b550.png)

    You will notice that it only has two features:

      - Snoop Servlet
      - Hit Count Servlet

#### Part 2.2 Run the test cases for the DefaultApplication

Since this is a simple application, you will run the test cases manually using the applications web UI. There are only two use cases for this simple application.

These use cases are _run on the instrumented monolith application_.

You will now use Mono2Micro’s **Flicker** tool to record use case labels and the start and stop times of when that use case or scenario was run.

> :bulb: ***What is Flicker?*** Flicker essentially acts like a stopwatch to record use cases. It is a simple Java based tool that prompts the user for the use case label, and then records the start time. Then prompts again for the stop command after the user finishes running that scenario on the monolith.

_Note: The labels provided to Flicker for each use case should be meaningful as this will come into play later when viewing Mono2Micro’s AI analysis where the classes and flow within the code is associated with the use case labels._

1. Flicker can be found in the root directory of the [ASE21-Tutorial](https://github.com/rahlk/ASE21-Tutorial) repo you pulled. First, let's start the Flicker tool, using the command below:

   ```sh
   cd $TUTORIAL_REPO/Flicker

   java -cp commons-net-3.6.jar:json-simple-1.1.jar:. Flicker -no_ntp
   ```

2. Flicker will ask you to provide a **Label** (see below). Let's run the "snoop" service.
   ![image](https://user-images.githubusercontent.com/1433964/141355838-e0c7f52c-29ac-4939-a998-623f671d90db.png)

3. Run the Snoop test case. Follow the steps below to run the Snoop test case.

   a.  In the web browser, go to <http://localhost:9080/>

   b. From Flicker, provide the label named SNOOP and press ENTER. This starts Flicker’s stopwatch for the snoop test case.
   ![Screen Shot 2021-11-11 at 2 14 11 PM](https://user-images.githubusercontent.com/1433964/141355646-88c72e59-bf38-458c-94dd-aaee9afa20cb.png)

   c. From the Web Browser, click on the Snoop Servlet link in the DefaultApplication HTML page. Snoop requires basic authentication.
   ![Screen Shot 2021-11-11 at 2 23 46 PM](https://user-images.githubusercontent.com/1433964/141356633-f018bcac-8006-4771-aa2b-c716f49977b7.png)

    If prompted for credentials, enter the following username and password:

    Username: **user1**

    Password: **change1me** (that is the number 1 in the password).
   ![Screen Shot 2021-11-11 at 2 18 32 PM](https://user-images.githubusercontent.com/1433964/141356728-bebad712-2d05-4486-9f38-472b8ddd913b.png)

   d. Run snoop multiple times: Just click the Browsers Reload Page button.

   e. When finished, click on the Browsers Back button to return to the applications main HTML page.

   f. In Flicker, enter **STOP**, to stop Flickers stopwatch for the test case
  
    ***Note: STOP must be in upper-case and is Case Sensitive.***

   *Notice Flicker has recorded the START and STOP times for the snoop test case. These timestamps correspond with the timestamps in the Liberty log file, from the instrumented version of the DefaultApplication running in Liberty.*
![Screen Shot 2021-11-11 at 2 27 52 PM](https://user-images.githubusercontent.com/1433964/141357246-a644e0b8-937c-47e9-9e78-0a5990b90209.png)

4. Run the HITCOUNT test case. Follow the steps below:

   a. In Flicker, provide the label named HITCOUNT which will start Flicker’s stopwatch for the snoop test case.
   ![Screen Shot 2021-11-11 at 2 31 39 PM](https://user-images.githubusercontent.com/1433964/141357633-56637604-de38-40ae-98a0-759c7e5aa7ff.png)

   b. From the Web Browser, click on the Hit Count link in the DefaultApplication HTML page. Run hitcount, choosing each of the following options from the application in the web browser and  choosing different **Transaction Type** options.
    ![image](https://user-images.githubusercontent.com/1433964/141358110-cd834855-742f-4164-a961-fd7164db15e3.png)

   c. In Flicker, enter STOP, to stop Flickers stopwatch for the test case

      Flicker has now captured the START and STOP timestamps for the use cases, which corresponds to the timestamps recorded in the Liberty log file from the instrumented version of the DefaultApplication.
      ![Screen Shot 2021-11-11 at 2 52 30 PM](https://user-images.githubusercontent.com/1433964/141360276-f825bd87-744e-442e-a1d3-4f1ff2b11618.png)

   d. Now, type Exit (case sensitive, upper case E) to stop Flicker.

   e. Finally, let's stop the server.

   ```sh
   $TUTORIAL_REPO/defaultapplication/monolith-klu/DefaultApplication-ear/target/liberty/wlp/bin/server stop DefaultApplicationServer
   ```

#### Part 2.3 Review the gathered data

Let's take a quick look at all the data we have generated so far:

1. Symbol and reference tables we obtained from [Part 1](#part-1-instrumenting-your-java-code-to-collect-runtime-traces).

    ```sh
    ls -lh $TUTORIAL_REPO/defaultapplication/monolith-klu
    ```

   ![image](https://user-images.githubusercontent.com/1433964/141367164-ef29c39b-5e8f-42ad-bc41-2dc9a782be31.png)

2. The context file that Flicker generated for the SNOOP and HITCOUNT test cases. This will be found in the flicker folder in the repository root in a file called `context_XXXXX.json`

    ```sh
    cd $TUTORIAL_REPO

    cat Flicker/context_1636658040657.json
    ```

    You'll see something like this:
    ![Screen Shot 2021-11-11 at 3 00 00 PM](https://user-images.githubusercontent.com/1433964/141361259-ad8103f5-78f5-4677-96d0-69c45c074a3a.png)

3. Finally, the liberty log file with the method entry and exit (which we obtain after running the instrumented code).

   ```sh
   cat $TUTORIAL_REPO/defaultapplication/monolith-klu/DefaultApplication-ear/target/liberty/wlp/usr/servers/DefaultApplicationServer/logs/messages.log
   ```

   ![Screen Shot 2021-11-11 at 3 44 58 PM](https://user-images.githubusercontent.com/1433964/141366530-8fcbd128-6fc6-43de-acf4-0b24f0691e53.png)

4. Let's put all the files in a location we can access for the next step

   a. Let's go back to the `defaultapplication` folder, and make dir `application-data` with three sub-directories: `logs`,`contexsts`, and `tables`.

   ```sh
   cd $TUTORIAL_REPO

   mkdir -p $TUTORIAL_REPO/defaultapplication/application-data/contexts $TUTORIAL_REPO/defaultapplication/application-data/logs $TUTORIAL_REPO/defaultapplication/application-data/tables
   ```

   b. Let's move the respective files we generated to the folders:

   ```sh
   cp $TUTORIAL_REPO/Flicker/context_*.json $TUTORIAL_REPO/defaultapplication/application-data/contexts/
   
   cp $TUTORIAL_REPO/defaultapplication/monolith-klu/*.json $TUTORIAL_REPO/defaultapplication/application-data/tables/
   
   cp $TUTORIAL_REPO/defaultapplication/monolith-klu/DefaultApplication-ear/target/liberty/wlp/usr/servers/DefaultApplicationServer/logs/messages.log $TUTORIAL_REPO/defaultapplication/application-data/logs
   ```

      The `application-data` folder should look like so:
      ![image](https://user-images.githubusercontent.com/1433964/141507484-f92d5c69-a49a-4e87-bf70-82f9d367e89f.png)

### Part 3. Partitioning the Monolith with AIPL

Once you have completed the data collection process for the Java monolith under consideration, you can feed the data to the AIPL tool to generate microservices recommendations.

1. Let's change the directory to application-data directory.

   ```sh
   cd $TUTORIAL_REPO/defaultapplication/application-data/
   ```

2. Run the AIPL tool, using the following command:

   ```sh
   docker run -e LICENSE=accept --rm -it -v $TUTORIAL_REPO/defaultapplication/application-data:/var/application ibmcom/mono2micro-aipl
   ```

   When this finishes, you'll see the following:
   ![image](https://user-images.githubusercontent.com/1433964/141658700-73fabcbb-f1ff-48c5-9415-d123dc3c3621.png)

   Here are some of the notable files generated by Mono2Micro:

      a. **Cardinal-Report.html** is a detailed report of all the application partitions, their member classes, outward facing classes, etc

      ```sh
      $TUTORIAL_REPO/defaultapplication/application-data/mono2micro/mono2micro-output/Cardinal-Report.html
      ```

      b. **Oriole-Report.html** is a summary report of all the application partitions and their associated business use cases

      ```sh
      $TUTORIAL_REPO/defaultapplication/application-data/mono2micro/mono2micro-output/Oriole-Report.html
      ```

      c. **final_graph.json** is the full set of application partition recommendations (natural seams and business logic) and associated details, viewable in the Mono2Micro UI

      ```sh
      $TUTORIAL_REPO/defaultapplication/application-data/mono2micro/mono2micro-output/oriole/final_graph.json
      ```

      d. **cardinal/** is a folder that contains a complete set of input files (based on the partitioning) for the next and last stage of the Mono2Micro pipeline, running the code generator

      ```sh
      $TUTORIAL_REPO/defaultapplication/application-data/mono2micro/mono2micro-output/cardinal/
      ```

### Part 4. Visualizing partitions the Mono2Mirco UI

In the last section, you will use the mono2micro UI to view and manipulate the partitioning recommendations generated from the AIPL tool.

##### Part 4.1 Viewing the partitions

   First, let’s take a look at the partitioning recommendations Mono2Micro generated by loading the `final_graph.json` in the graph UI. 

   a.	Launch the Mono2Micro UI using the following command:

   ```sh
   docker run -d -e LICENSE=accept -p 3000:3000 --name=m2mgui ibmcom/mono2micro-ui
   ```

   b. Go to [localhost:3000](http://localhost:3000/) on your browser, and you will see the following UI:
   ![Screen Shot 2021-11-13 at 6 55 44 PM](https://user-images.githubusercontent.com/1433964/141662438-1da36f1c-9fc5-43bd-9356-fb15ce753625.png)

   c. From the UI, click to add the `final-graph.json` file (you'll find this in `$TUTORIAL_REPO/defaultapplication/application-data/mono2micro/mono2micro-output/oriole/final-graph.json`)

   ![image](https://user-images.githubusercontent.com/1433964/141662401-f3cf92d7-9c42-4768-8b18-8280ed44cfcc.png)

   d. From the UI, click 'Maybe Later' to SKIP the tour, and proceed to the results.

   e. As illustrated below, the UI displays the initial recommendations for partitioning the application into microservices. From the UI, you can explore the partition recommendations.

   ![image](https://user-images.githubusercontent.com/1433964/141662497-b5f00d33-a99b-4344-9279-686d8604e28b.png)   


##### Part 4.2 Customizing & Adjusting Partitions

In this section of the lab, you use the Mono2Micro UI and tweak the graph to the desired state.

1. Select a desired node from the current graph and move it to a different partition.
   1. On the left pane, select 'View by' and choose 'custom'

      ![Screen Shot 2021-11-14 at 3 54 24 PM](https://user-images.githubusercontent.com/1433964/141698292-9e8dd261-879a-40be-b14e-d8be201e97ae.png)
   
   2. If asked, select either 'Business Logic' or 'Natural seams':

      ![image](https://user-images.githubusercontent.com/1433964/141698347-b48d0169-d817-4082-b14f-690447016b94.png)
   
   3. Now, add any unobserved classes:

      ![Screen Shot 2021-11-14 at 4 01 36 PM](https://user-images.githubusercontent.com/1433964/141698522-d5fdaf26-ed13-4176-99ec-da8d58cf02e9.png)

      ![image](https://user-images.githubusercontent.com/1433964/141700698-e266fda1-e877-4755-bf4b-3968b2adb3df.png)

   4. Add it to one of your partitions (you can drag/drop it any partitions you like):
      ![Screen Shot 2021-11-14 at 4 04 53 PM](https://user-images.githubusercontent.com/1433964/141698579-1f57cecb-5ba0-4c28-a1b7-a2027cb59caa.png)

   5. Click on the Save icon to save the updated custom view. The customized `final_graph.json` file is **saved to the Downloads folder**. 

      ![Screen Shot 2021-11-14 at 4 06 35 PM](https://user-images.githubusercontent.com/1433964/141698638-b98d43b2-bc3b-4497-a892-9228d1f9d0f1.png)


##### Part 4.3 Regenerating the partitions by rerunning AIPL against the customized graph

1. Copy the customized final_graph.json file from users Downloads folder to a known location by Mono2Micro’s AIPL tool, and name it `custom_graph.json`
   
   > :exclamation: By default, the AIPL tool will look in the root directory of the `application-data` folder where the contexts, logs, and tables are located. 

   So, let's first copy the customized graph to this folder, and rename it to `custom-graph.json` to make it obvious:

   ```sh
   cp ~/Downloads/final_graph.json $TUTORIAL_REPO/defaultapplication/application-data/custom_graph.json 

   cd $TUTORIAL_REPO/defaultapplication/application-data
   ```
   ![Screen Shot 2021-11-14 at 4 24 20 PM](https://user-images.githubusercontent.com/1433964/141699174-fe51a219-7c17-4573-8148-e5da52e9dd7a.png)

2. From the same folder as the `custom-graph.json` (i.e., `$TUTORIAL_REPO/defaultapplication/application-data/`), modify the permissions for config.ini so that we have write permissions:
   
   ```sh
   cd $TUTORIAL_REPO/defaultapplication/application-data/
   
   sudo chmod 777 ./config.ini 
   ```

3. Edit the `config.ini` file to reference the new custom_graph.json file to be used for regenerating the partition recommendations.
   
      a. Modify the config.ini by changing the value for the UserModifiedGraph property to `custom_graph.json`.

      ![Screen Shot 2021-11-14 at 4 56 19 PM](https://user-images.githubusercontent.com/1433964/141700179-b3479f51-e615-41e4-9f2b-4fc791408eec.png)

      b. Save and close the `custom_graph.json`

4. Rerun the AIPL tool with the `regen_p` option to generate the partitioning recommendations based on the updated graph file. 
   
   ```sh
   docker run -e LICENSE=accept --rm -it -v $TUTORIAL_REPO/defaultapplication/application-data:/var/application ibmcom/mono2micro-aipl
   ```

   **Note:** *AIPL created a new folder based on the user modified graph in the following directory: `$TUTORIAL_REPO/defaultapplication/application-data/mono2micro/mono2micro-user-modified`*

      a. List the files/folders of the generated directory.

      ```sh
      ls -l $TUTORIAL_REPO/defaultapplication/application-data/mono2micro/mono2micro-user-modified
      ```

      ![image](https://user-images.githubusercontent.com/1433964/141700379-c82f6246-b94e-4976-a225-c7b824113ec1.png)

      b. View the generated Cardinal report to verify the partitions and exposed services are defined as expected. 

      ```sh
      cd  $TUTORIAL_REPO/defaultapplication/application-data/mono2micro/mono2micro-user-modified

      open ./Cardinal-Report-Modified.html
      ```

      ![Screen Shot 2021-11-14 at 5 07 54 PM](https://user-images.githubusercontent.com/1433964/141700536-60c1d3a4-9146-43f2-9bcc-9229499c1694.png)




