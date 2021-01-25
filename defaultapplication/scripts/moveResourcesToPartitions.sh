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
echo "##########################################################"
echo "Copying Non-Java resources from Monolith to Web Partition"
echo "##########################################################"
echo ""

cp $MONOLITHPATH/pom.xml $MONOLITHWEBPATH
echo "----> $MONOLITHWEBPATH/pom.xml added to project"

cp $MONOLITHPATH/DefaultWebApplication/pom.xml $MONOLITHWEBPATH/DefaultWebApplication/pom.xml
echo "----> $MONOLITHWEBPATH/DefaultWebApplication/pom.xml added to project"


cp -r $MONOLITHPATH/DefaultWebApplication/src/main/webapp $MONOLITHWEBPATH/DefaultWebApplication/src/main
echo "----> $MONOLITHWEBPATH/DefaultWebApplication/src/main/webapp added to project"

cp $MONOLITHPATH/DefaultApplication-ear/pom.xml $MONOLITHWEBPATH/DefaultApplication-ear/pom.xml
echo "----> $MONOLITHWEBPATH/DefaultApplication-ear/pom.xml added to project"

mkdir -p $MONOLITHWEBPATH/DefaultApplication-ear/src/main/

cp -r $MONOLITHPATH/DefaultApplication-ear/src/main/liberty $MONOLITHWEBPATH/DefaultApplication-ear/src/main
echo "----> $MONOLITHWEBPATH/DefaultApplication-ear/src/main/liberty resources added to project"

cp -r $MONOLITHPATH/DefaultApplication-ear/src/main/application $MONOLITHWEBPATH/DefaultApplication-ear/src/main
echo "----> $MONOLITHWEBPATH/DefaultApplication-ear/src/main/application resources added to project"

echo ""

### Copying Non-Java resources from Monolith to Partition0 partition
echo "#################################################################"
echo "Copying Non-Java resources from Monolith to Partition0 partition"
echo "#################################################################"
echo ""


cp $MONOLITHPATH/pom.xml $MONOLITHPARTITION0PATH
echo "----> $MONOLITHPARITION0PATH/pom.xml added to project"

cp $MONOLITHPATH/DefaultWebApplication/pom.xml $MONOLITHPARTITION0PATH/DefaultWebApplication/pom.xml
echo "----> $MONOLITHPARTITION0PATH/DefaultWebApplication/pom.xml added to project"

cp -r $MONOLITHPATH/DefaultWebApplication/src/main/webapp $MONOLITHPARTITION0PATH/DefaultWebApplication/src/main
echo "----> $MONOLITHPARTITION0PATH/DefaultWebApplication/src/main/webapp added to project"

cp -r $MONOLITHPATH/DefaultWebApplication/src/main/resources $MONOLITHPARTITION0PATH/DefaultWebApplication/src/main
echo "----> $MONOLITHPARTITION0PATH/DefaultWebApplication/src/main/resources added to project"

cp $MONOLITHPATH/DefaultApplication-ear/pom.xml $MONOLITHPARTITION0PATH/DefaultApplication-ear/pom.xml
echo "----> $MONOLITHPARTITION0PATH/DefaultApplication-ear/pom.xml added to project"

mkdir -p $MONOLITHPARTITION0PATH/DefaultApplication-ear/src/main/

cp -r $MONOLITHPATH/DefaultApplication-ear/src/main/liberty $MONOLITHPARTITION0PATH/DefaultApplication-ear/src/main
echo "----> $MONOLITHPARTITION0PATH/DefaultApplication-ear/src/main/liberty resources added to project"

cp -r $MONOLITHPATH/DefaultApplication-ear/src/main/application $MONOLITHPARTITION0PATH/DefaultApplication-ear/src/main
echo "----> $MONOLITHPARTITION0PATH/DefaultApplication-ear/src/main/application resources added to project"

cp -r $MONOLITHPATH/DefaultApplication-ear/src/main/resources $MONOLITHPARTITION0PATH/DefaultApplication-ear/src/main
echo "----> $MONOLITHPARTITION0PATH/DefaultApplication-ear/src/main/resources Database resources added to project"



### Refactoring Web Partition
#echo "###########################"
#echo "Refactoring Web Partition"
#echo "###########################"
#echo ""

#cp $MICROSERVICESWEBPATH/pom.xml $MONOLITHWEBPATH
#echo "----> $MONOLITHWEBPATH/pom.xml updated"

#cp $MICROSERVICESWEBPATH/Dockerfile $MONOLITHWEBPATH
#echo "----> $MONOLITHWEBPATH/Dockerfile added to project"

#cp $MICROSERVICESWEBPATH/DefaultWebApplication/pom.xml $MONOLITHWEBPATH/DefaultWebApplication/pom.xml
#echo "----> $MONOLITHWEBPATH/DefaultWebApplication/pom.xml updated"





