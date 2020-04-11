## JavaDeveloper
Javaの開発環境を構築するプロジェクトです。  
単純な開発環境ではなく、フレームワークにSpringBoot、ビルドツールにGradleを
使用します。  
VSCodeの拡張機能「Remote Development」を使って開発ができるようになります。

## 事前準備  
Windowsの人は、[Windows 上の Docker エンジン](https://docs.microsoft.com/ja-jp/virtualization/windowscontainers/manage-docker/configure-docker-daemon)を参考にDockerをインストールしてください。  
macやLinuxの人は、ググってください。

コンテナを楽に作れるように、スクリプトを用意しています。  
Windowsで以下のエラーが出ている場合、
```
no matching manifest for windows/amd64
```
は、[docker runしたら「no matching manifest for windows/amd64 10.0.18362 in the manifest list entries.」と出る](https://qiita.com/yuta_vamdemic/items/cf3eb8182a63a303c4f7)の通りに設定変更してください。
その後に、タスクトレイのDockerアイコンを右クリックし、「Switch to Linux containers...」をクリックしてください。

## インストールされるもの
* OpenJDK11(centos8版)
* gradle-6.2

## 使い方
コンテナにsshで接続することができます。ポート番号は「2222」に変更しています。  
ユーザ名/パスワードは、developer/developerです。

### コンパイルの仕方
/home/developer/src/demo/  
の下に入って、
```
gradle build
```
でコンパイルができます。

### 実行の仕方
```
gradle bootRun
```
で実行できます。

なお、build.gradleは[Spring Initializr](https://start.spring.io/)を使って作成しました。

# License
[MIT license](https://en.wikipedia.org/wiki/MIT_License).
