FROM centos

# 作成したユーザの情報
LABEL maintainer="mitani <mitani@daisuke2.com>"

# RUN: docker buildするときに実行される
RUN echo "now building..."

## 必要なプログラム類のインストール
RUN yum -y install openssh-server initscripts
RUN yum -y install unzip
RUN yum -y install git
RUN cd /tmp; curl -L -O https://services.gradle.org/distributions/gradle-6.2-bin.zip; unzip gradle-6.2-bin.zip; mv gradle-6.2 gradle; mv gradle /usr/local/

## JDKのダウンロード
RUN cd /tmp; curl -L -O https://download.java.net/java/GA/jdk13.0.2/d4173c853231432d94f001e99d882ca7/8/GPL/openjdk-13.0.2_linux-x64_bin.tar.gz; tar xzvf openjdk-13.0.2_linux-x64_bin.tar.gz; mv jdk-13.0.2 /usr/local/;

## SSHの設定
RUN ssh-keygen -A
RUN sed -i -e "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config
RUN sed -i -e "s/#PermitRootLogin yes/PermitRootLogin yes/g" /etc/ssh/sshd_config

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

# ポート22を開ける
EXPOSE 22 8080

# ENTRYPOINT : docker runするときに実行される
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
