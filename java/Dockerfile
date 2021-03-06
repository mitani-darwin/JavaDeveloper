FROM centos:latest

# 作成したユーザの情報
LABEL maintainer="mitani <mitani@daisuke2.com>"

# RUN: docker buildするときに実行される `
RUN echo "now building..."

## 必要なプログラム類のインストール
RUN yum -y install openssh-server initscripts \
                    unzip \
                    git \
                    java-11-openjdk \
                    glibc \
                    libgcc \
                    libstdc++ \
                    ca-certificates \
                    tar
RUN cd /tmp; curl -L -O https://services.gradle.org/distributions/gradle-6.3-bin.zip; unzip gradle-6.3-bin.zip; mv gradle-6.3 gradle; mv gradle /usr/local/

## SSHの設定
RUN mkdir /var/run/sshd && \
    ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key && \
    sed -i -e "s/#PermitRootLogin yes/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

## 環境設定
RUN echo 'export JAVA_HOME=/etc/alternatives/jre' >> /etc/profile && \
    echo 'export PATH=$PATH:/usr/local/gradle/bin:$JAVA_HOME/bin' >> /etc/profile && \
    source '/etc/profile' && \
    useradd developer && \
    echo "developer:developer" | chpasswd

RUN rm -rf /run/nologin

## 開発環境ディレクトリ作成
RUN mkdir -p /home/developer/src && \
    cd /home/developer/src/; git clone https://github.com/mitani-darwin/DemoWebApplication.git && \
    chown -R developer:developer /home/developer/

# ポート22を開ける
EXPOSE 22 8080

# ENTRYPOINT : docker runするときに実行される
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
