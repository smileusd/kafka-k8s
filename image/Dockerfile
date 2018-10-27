FROM centos:7.5.1804
WORKDIR /
RUN yum install java-1.8.0-openjdk-devel-1.8.0.181-3.b13.el7_5 wget net-tools-2.0-0.22.20131004git.el7.x86_64 -y
RUN wget http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/0.11.0.2/kafka_2.11-0.11.0.2.tgz
RUN wget dtPro.int.xiaohongshu.com/files/jmx_exporter.jar
RUN mkdir -p /root/jmx_exporter && mv jmx_exporter.jar /root/jmx_exporter/
ADD config.yaml /root/jmx_exporter/
RUN tar -xvf kafka_2.11-0.11.0.2.tgz
WORKDIR /kafka_2.11-0.11.0.2/
ADD run-class.sh bin/
ADD health-check.sh bin/
RUN chmod a+x bin/run-class.sh bin/health-check.sh
RUN wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -ivh epel-release-latest-7.noarch.rpm
RUN yum install jq -y

CMD ["kafka-server-start.sh"]
