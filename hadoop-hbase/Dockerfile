FROM ubuntu:16.04
RUN mkdir /opt/mdp && apt-get update  && apt-get install -y sudo
RUN groupadd -r user && useradd --no-log-init -r -g user user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER user
RUN sudo apt-get install -y --no-install-recommends curl  default-jdk openssh-server 
RUN curl -s "https://archive.apache.org/dist/hbase/2.0.0/hbase-2.0.0-bin.tar.gz"   | sudo tar xzvf -  -C /opt/mdp \
   && sudo curl -s "https://archive.apache.org/dist/hadoop/core/hadoop-2.7.6/hadoop-2.7.6.tar.gz"   | sudo tar xzvf -  -C /opt/mdp 


COPY ./hbase.conf /opt/mdp/hbase-2.0.0/conf/hbase-env.sh
COPY ./hbase-site.xml /opt/mdp/hbase-2.0.0/conf/hbase-site.xml
COPY ./hadoop-env.sh /opt/mdp/hadoop-2.7.6/etc/hadoop/hadoop-env.sh
COPY ./core-site.xml /opt/mdp/hadoop-2.7.6/etc/hadoop/core-site.xml
COPY ./mapred-site.xml /opt/mdp/hadoop-2.7.6/etc/hadoop/mapred-site.xml
COPY ./yarn-site.xml /opt/mdp/hadoop-2.7.6/etc/hadoop/yarn-site.xml
COPY ./hdfs-site.xml /opt/mdp/hadoop-2.7.6/etc/hadoop/hdfs-site.xml


ENV PATH=${PATH}:/opt/mdp/hbase-2.0.0/bin
ENV PATH=${PATH}:/opt/mdp/hadoop-2.7.6/sbin
ENV PATH=${PATH}:/opt/mdp/hadoop-2.7.6/bin
ENV PATH=${PATH}:/opt/mdp/pig-0.16.0/bin
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/

COPY ./start.sh /
RUN sudo chmod +x /start.sh
WORKDIR /projects
