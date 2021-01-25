########################################
# Build Image
########################################
FROM maven:3.6-jdk-8-slim as build

WORKDIR /app
COPY . .

###RUN mvn dependency:resolve
###RUN mvn package

RUN mvn clean
RUN mvn install



########################################
# Production Image
########################################
#FROM open-liberty:microProfile2-java8-ibm
FROM openliberty/open-liberty:full-java8-ibmjava-ubi

# Add build files
COPY --from=build --chown=1001:0 /app/DefaultApplication-ear/target/DefaultApplication.ear /config/apps/DefaultApplication.ear
COPY --from=build --chown=1001:0 /app/DefaultApplication-ear/src/main/liberty/config/ /config/
COPY --from=build --chown=1001:0 /app/DefaultApplication-ear/target/liberty/wlp/usr/shared/resources/derby-10.13.1.1.jar /liberty/usr/shared/resources/

COPY --from=build --chown=1001:0 /app/DefaultApplication-ear/src/main/resources/DefaultDB.zip /liberty/usr/servers/defaultServer/resources/

USER root
RUN yum update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum
RUN yum install --disableplugin=subscription-manager unzip -y && rm -rf /var/cache/yum
RUN mkdir -p /liberty/usr/servers/defaultServer/resources/
RUN unzip /liberty/usr/servers/defaultServer/resources/DefaultDB.zip -d /liberty/usr/servers/defaultServer/resources/
RUN yum install --disableplugin=subscription-manager curl -y && rm -rf /var/cache/yum
RUN chmod -R 777 /liberty/usr/servers/defaultServer/resources/ 
USER 1001
