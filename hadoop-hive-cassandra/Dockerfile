FROM ubuntu:16.04
RUN mkdir /opt/mdp && apt-get update  && apt-get install -y sudo
RUN groupadd -r user && useradd --no-log-init -r -g user user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER user
RUN sudo apt-get install -y --no-install-recommends openjdk-8-jdk openssh-server curl\  
   && sudo curl -s "https://archive.apache.org/dist/hadoop/core/hadoop-2.7.6/hadoop-2.7.6.tar.gz"   | sudo tar xzvf -  -C /opt/mdp \
    && sudo curl -s "http://archive.apache.org/dist/hive/hive-2.1.0/apache-hive-2.1.0-bin.tar.gz" | sudo tar xzvf -  -C /opt/mdp \
    && sudo echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list \
    && sudo curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add - \
    && sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA \
    && sudo apt-get update && sudo apt-get  install -y --no-install-recommends cassandra

COPY ./hadoop-env.sh /opt/mdp/hadoop-2.7.6/etc/hadoop/hadoop-env.sh
COPY ./core-site.xml /opt/mdp/hadoop-2.7.6/etc/hadoop/core-site.xml
COPY ./mapred-site.xml /opt/mdp/hadoop-2.7.6/etc/hadoop/mapred-site.xml
COPY ./yarn-site.xml /opt/mdp/hadoop-2.7.6/etc/hadoop/yarn-site.xml
COPY ./hdfs-site.xml /opt/mdp/hadoop-2.7.6/etc/hadoop/hdfs-site.xml
COPY ./hive-env.sh /opt/mdp/apache-hive-2.1.0-bin/conf/hive-env.sh
COPY ./hive-site.xml /opt/mdp/apache-hive-2.1.0-bin/conf/hive-site.xml

RUN sudo /opt/mdp/apache-hive-2.1.0-bin/bin/schematool -initSchema -dbType derby


ENV PATH=${PATH}:/opt/mdp/hadoop-2.7.6/sbin
ENV PATH=${PATH}:/opt/mdp/hadoop-2.7.6/bin
ENV PATH=${PATH}:/opt/mdp/apache-hive-2.1.0-bin/bin
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/

COPY ./start.sh /
RUN sudo chmod +x /start.sh
WORKDIR /projects
