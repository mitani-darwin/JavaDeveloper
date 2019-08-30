## JavaDeveloper
Javaの開発環境を構築プロジェクトです。  
単純な開発環境ではなく、フレームワークにSpringBoot、ビルドツールにGradleを
使用します。

## 事前準備  
Windowsの人は、[Windows 上の Docker エンジン](https://docs.microsoft.com/ja-jp/virtualization/windowscontainers/manage-docker/configure-docker-daemon)を参考にDockerをインストールしてください。  

macやLinuxの人は、ググってください。

コンテナを楽に作れるように、スクリプトを用意しています。(RedHat8向けですが)  
WindowsやMac、LinuxでDockerコマンドを使っている人は、以下を参考にbuild.shを修正してください。  
Windowsを使っている人は、拡張子をbatに変更してください。

build.sh(修正前)
```
podman image build  -f Dockerfile -t xxxxx
```
build.sh(修正後)
```
docker image build  -f Dockerfile -t xxxxx
```

xxxxxはお好きな名前でお願いします。

## インストールされるもの
* OpenJDK11
* git2系
* gradle-5.6.1

## 使い方
コンテナにsshで接続することができます。ユーザ名/パスワードは、developer/developerです。  
/home/developer/src/demo/  
の下に入って、
'''
gradle build
'''
でコンパイルができます。

### 実行の仕方
'''
gradle bootRun
'''
で実行できます。

# License
[MIT license](https://en.wikipedia.org/wiki/MIT_License).
