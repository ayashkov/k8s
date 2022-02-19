#!/bin/bash

read -er -p "Maven user: " user
read -ers -p "Password: " password
master=`head -c 20 /dev/urandom | base64`

mkdir -p $HOME/.m2

epass=`mvn -emp "$master"` cat > $HOME/.m2/settings-security.xml <<EOF
<settingsSecurity>
  <master>${epass}</master>
</settingsSecurity>
EOF

epass=`mvn -ep "$password"` cat > $HOME/.m2/settings.xml <<EOF
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
    https://maven.apache.org/xsd/settings-1.0.0.xsd">
  <servers>
    <server>
      <id>yashkov</id>
      <username>${user}</username>
      <password>${epass}</password>
    </server>
    <server>
      <id>yashkov-snapshots</id>
      <username>${user}</username>
      <password>${epass}</password>
    </server>
    <server>
      <id>yashkov-releases</id>
      <username>${user}</username>
      <password>${epass}</password>
    </server>
  </servers>
  <mirrors>
    <mirror>
      <id>yashkov</id>
      <name>yashkov.org</name>
      <url>https://repo.dev.yashkov.org/repository/maven-yashkov/</url>
      <mirrorOf>*</mirrorOf>
    </mirror>
  </mirrors>
  <activeProfiles>
    <activeProfile>yashkov</activeProfile>
  </activeProfiles>
  <profiles>
    <profile>
      <id>yashkov</id>
      <repositories>
        <repository>
          <id>central</id>
          <url>http://central</url>
          <releases>
            <enabled>true</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
      </repositories>
      <pluginRepositories>
        <pluginRepository>
          <id>central</id>
          <url>http://central</url>
          <releases>
            <enabled>true</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </pluginRepository>
      </pluginRepositories>
    </profile>
  </profiles>
</settings>
EOF
