FROM centos

# 作成したユーザの情報
LABEL maintainer="mitani <mitani@daisuke2.com>"

# RUN: docker buildするときに実行される
RUN echo "now building..."

## 必要なプログラム類のインストール
RUN yum -y install openssh-server initscripts
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install git2u yum-utils unzip
RUN yum-config-manager --disable ius
RUN cd /tmp; curl -L -O https://services.gradle.org/distributions/gradle-5.6.1-bin.zip; unzip gradle-5.6.1-bin.zip; mv gradle-5.6.1 gradle; mv gradle /usr/local/

## JDKのダウンロード
RUN cd /tmp; curl -L -O https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz; tar xzvf openjdk-11+28_linux-x64_bin.tar.gz; mv jdk-11 /usr/local/;

## SSHの設定 
RUN sshd-keygen
RUN sed -i -e "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config
RUN sed -i -e "s/#PermitRootLogin yes/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i -e "s/UsePAM yes/UsePAM no/g" /etc/ssh/sshd_config

## 環境設定
RUN echo 'export JAVA_HOME=/usr/local/jdk-11' >> /etc/profile
RUN echo 'export PATH=$PATH:/usr/local/gradle/bin:$JAVA_HOME/bin' >> /etc/profile
RUN source '/etc/profile'
RUN useradd developer
RUN echo "developer:developer" | chpasswd

## 開発環境ディレクトリ作成
RUN mkdir -p /home/developer/src
RUN cd /home/developer/src/; git clone https://github.com/mitani-darwin/DemoWebApplication.git
RUN chown -R developer:developer /home/developer/

#ポート22を開ける
EXPOSE 22

# ENTRYPOINT : docker runするときに実行される
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
