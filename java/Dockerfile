FROM centos:latest

# 作成したユーザの情報
LABEL maintainer="mitani <mitani@daisuke2.com>"

# RUN: docker buildするときに実行される
RUN echo "now building..."

## 必要なプログラム類のインストール
RUN yum -y install openssh-server initscripts \
                    unzip \
                    git
RUN cd /tmp; curl -L -O https://services.gradle.org/distributions/gradle-6.2-bin.zip; unzip gradle-6.2-bin.zip; mv gradle-6.2 gradle; mv gradle /usr/local/

## JDKのダウンロード
RUN cd /tmp; curl -L -O https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz; tar xzvf openjdk-11+28_linux-x64_bin.tar.gz; mv jdk-11 /usr/local/;

## SSHの設定
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key
#RUN sed -i -e "s/#PasswordAuthentication yes/PasswordAuthentication yes/" /etc/ssh/sshd_config
RUN sed -i -e "s/#PermitRootLogin yes/PermitRootLogin yes/g" /etc/ssh/sshd_config
# SSH ログインの設定修正。これを行わないとログインした後に処理実行できない。
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

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
