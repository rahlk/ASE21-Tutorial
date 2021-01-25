########################################
# Build Image
########################################
FROM maven:3.6-jdk-8-slim as build

WORKDIR /app
COPY . .

#RUN mvn dependency:resolve
#RUN mvn package

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

ENV APPLICATION_PARTITION0_REST_URL=http://defaultapp-partition0:9080/rest/

USER root
RUN yum update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum
RUN yum install --disableplugin=subscription-manager curl -y && rm -rf /var/cache/yum
RUN chmod -R 777 /liberty/usr/shared/resources/ 
USER 1001

