FROM alpine:latest
USER root
RUN mkdir test
WORKDIR test/
RUN apk update && apk add wget zip bash sed gawk openjdk8-jre
RUN wget https://miroir.univ-lorraine.fr/apache/jmeter/binaries/apache-jmeter-5.6.2.zip
RUN unzip apache-jmeter-5.6.2.zip
RUN wget https://www.vinsguru.com/download/87/tag-jmeter-extn-1.1.zip
RUN unzip tag-jmeter-extn-1.1.zip -d ./apache-jmeter-5.6.2/lib/ext/
RUN wget https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.2.1/cmdrunner-2.2.1.jar -O ./apache-jmeter-5.6.2/lib/cmdrunner-2.2.1.jar
RUN wget https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.6/jmeter-plugins-manager-1.6.jar -O ./apache-jmeter-5.6.2/lib/ext/jmeter-plugins-manager-1.6.jar
RUN wget https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-casutg/2.10/jmeter-plugins-casutg-2.10.jar -O ./apache-jmeter-5.6.2/lib/ext/jmeter-plugins-casutg-2.10.jar
ENV PATH=${PATH}:/test/apache-jmeter-5.6.2/bin/
COPY . ./
#linux related to make file executable and any use can execute
RUN chmod u+x /test/entrypoint.sh
RUN chmod 777 /test/entrypoint.sh
RUN dos2unix /test/entrypoint.sh
#define entry point to start this shell once Docker run command is triggered
ENTRYPOINT ["/bin/sh","./entrypoint.sh"]