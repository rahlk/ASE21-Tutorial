#!/bin/sh


WORKDIR="/home/ibmadmin/m2m-ws-sample"
echo $WORKDIR
#ls $WORKDIR

DEFAULTAPPLICATIONPATH="$WORKDIR/defaultapplication"
echo $DEFAULTAPPLICATIONPATH
#ls $DEFAULTAPPLICATIONPATH

MONOLITHPATH="$DEFAULTAPPLICATIONPATH/monolith"
echo $MONOLITHPATH
#ls $MONOLITHPATH

MONOLITHWEBPATH="$DEFAULTAPPLICATIONPATH/monolith-web"
echo $MONOLITHWEBPATH
#ls $MONOLITHWEBPATH

MONOLITHPARTITION0PATH="$DEFAULTAPPLICATIONPATH/monolith-partition0"
echo $MONOLITHPARTITION0PATH
#ls $MONOLITHPARTITION0PATH

MICROSERVICESPATH="$DEFAULTAPPLICATIONPATH/microservices"
echo $MICROSERVICESPATH
#ls $MICROSERVICESPATH


MICROSERVICESWEBPATH="$MICROSERVICESPATH/defaultapp-web"
echo $MICROSERVICESWEBPATH
#ls $MICROSERVICESWEBPATH


MICROSERVICESPARTITION0PATH="$MICROSERVICESPATH/defaultapp-partition0"
echo $MICROSERVICESPARTITION0PATH
#ls $MICROSERVICESPARTITION0PATH


ANALYSISPATH="$DEFAULTAPPLICATIONPATH/mono2micro-analysis"
echo $ANALYSISPATH
#ls $ANALYSISPATH

ANALYSISCUSTOMPATH="$DEFAULTAPPLICATIONPATH/mono2micro-analysis-custom"
echo $ANALYSISCUSTOMPATH
#ls $ANALYSISCUSTOMPATH


#ead -s -p "Enter Password for sudo: " sudoPW


sudo chmod -R 777 $MONOLITHPARTITION0PATH
echo "----> Updated permissions on $MONOLITHPARTITION0PATH"

sudo chmod -R 777 $MONOLITHWEBPATH
echo "----> Updated permissions on $MONOLITHWEBPATH"

### Copying Non-Java resources from Monolith to Web Partition
echo "########################################################"
echo "Copying Refactored Non-Java resources to Web Partition"
echo "########################################################"
echo ""


cp $MICROSERVICESWEBPATH/pom.xml $MONOLITHWEBPATH
echo "----> pom.xml - Added Cardinal Utility module to be built"
echo "----> $MONOLITHWEBPATH/pom.xml updated"
echo ""

cp $MICROSERVICESWEBPATH/Dockerfile $MONOLITHWEBPATH
echo "----> $MONOLITHWEBPATH/Dockerfile added to project"
echo ""

cp $MICROSERVICESWEBPATH/DefaultWebApplication/pom.xml $MONOLITHWEBPATH/DefaultWebApplication/pom.xml
echo "----> pom.xml - removed dependency on java persistence, not used in web front-end service"
echo "----> $MONOLITHWEBPATH/DefaultWebApplication/pom.xml updated"
echo ""

cp $MICROSERVICESWEBPATH/DefaultApplication-ear/pom.xml $MONOLITHWEBPATH/DefaultApplication-ear/pom.xml
echo "----> pom.xml - removed stanza for Derby dattbase configuration. Added dependency to build Cardinal Utility application module"
echo "----> $MONOLITHWEBPATH/DefaultApplication-ear/pom.xml updated"
echo ""

cp $MICROSERVICESWEBPATH/application/pom.xml $MONOLITHWEBPATH/application/pom.xml
echo "----> pom.xml - Added new pom.xml to build the Cardinal utilities application jar"
echo "----> $MONOLITHWEBPATH/application/pom.xml updated"
echo ""

cp $MICROSERVICESWEBPATH/DefaultApplication-ear/src/main/liberty/config/server.xml $MONOLITHWEBPATH/DefaultApplication-ear/src/main/liberty/config/server.xml
echo "----> server.xml - Removed database datasoures not used in web fron-end service"
echo "----> $MONOLITHWEBPATH/DefaultApplication-ear/src/main/liberty/config/server.xml updated"
echo ""

cp $MICROSERVICESWEBPATH/labfiles/Increment.java $MONOLITHWEBPATH/DefaultWebApplication/src/main/java/com/ibm/defaultapplication/Increment.java
echo "----> Increment.java - Removed @Id annotation from method to work around known issue in Cardinal code generation"
echo "----> $MONOLITHWEBPATH/DefaultWebApplication/src/main/java/com/ibm/defaultapplication/Increment.java Updated"
echo ""

echo "===== Web Partition Refactoring complete! ====="
echo ""

### Copying Non-Java resources from Monolith to Partition0 partition
echo "############################################################"
echo "Copying Refactored Non-Java resources Partition0 partition"
echo "###########################################################"
echo ""


cp $MICROSERVICESPARTITION0PATH/pom.xml $MONOLITHPARTITION0PATH
echo "----> pom.xml - Added Cardinal Utility module to be built"
echo "----> $MONOLITHPARTITION0PATH/pom.xml updated"
echo ""

cp $MICROSERVICESPARTITION0PATH/Dockerfile $MONOLITHPARTITION0PATH
echo "----> $MONOLITHPARTITION0PATH/Dockerfile added to project"
echo ""


cp $MICROSERVICESPARTITION0PATH/DefaultWebApplication/pom.xml $MONOLITHPARTITION0PATH/DefaultWebApplication/pom.xml
echo "----> pom.xml - added dependency to build Cardinal Utility application module"
echo "----> $MONOLITHPARTITION0PATH/DefaultWebApplication/pom.xml updated"
echo ""


cp $MICROSERVICESPARTITION0PATH/DefaultApplication-ear/pom.xml $MONOLITHPARTITION0PATH/DefaultApplication-ear/pom.xml
echo "----> pom.xml - added dependency to build Cardinal Utility application module"
echo "----> $MICROSERVICESPARTITION0PATH/DefaultApplication-ear/pom.xml updated"
echo ""

cp $MICROSERVICESPARTITION0PATH/application/pom.xml $MONOLITHPARTITION0PATH/application/pom.xml
echo "----> pom.xml - Added new pom.xml to build the Cardinal utilities application jar"
echo "----> $MONOLITHPARTITION0PATH/application/pom.xml updated"
echo ""


cp $MICROSERVICESPARTITION0PATH/DefaultWebApplication/src/main/java/com/ibm/defaultapplication/JAXRSConfiguration.java $MONOLITHPARTITION0PATH/DefaultWebApplication/src/main/java/com/ibm/defaultapplication/JAXRSConfiguration.java
echo "----> JAXRSConfigurationom.java - Cardinal Utility class moved to src folder in class path. Package name to match src location"
echo "----> $MONOLITHPARTITION0PATH/DefaultWebApplication/src/main/java/com/ibm/defaultapplication/JAXRSConfiguration.java $MONOLITHPARTITION0PATH/DefaultWebApplication/src/main/java/com/ibm/defaultapplication/JAXRSConfiguration.java Moved"
echo ""

cp $MICROSERVICESPARTITION0PATH/DefaultWebApplication/src/main/java/com/ibm/defaultapplication/IncrementActionService.java $MONOLITHPARTITION0PATH/DefaultWebApplication/src/main/java/com/ibm/defaultapplication/IncrementActionService.java
echo "----> IncrementActionService.java - Removed conflicting import on javax.naming.context (Known issue in Cardinal code generation)"
echo "----> $MONOLITHPARTITION0PATH/DefaultWebApplication/src/main/java/com/ibm/defaultapplication/JAXRSConfiguration.java $MONOLITHPARTITION0PATH/DefaultWebApplication/src/main/java/com/ibm/defaultapplication/IncrementActionService.java Updated"
echo ""



echo ""
echo "===== Partition0 Partition Refactoring complete! ====="
echo ""





