#!/bin/bash

read -er -p "Maven user: " user
read -ers -p "Password: " password
master=`head -c 20 /dev/urandom | base64`

epass=`mvn -emp "$master"` cat > $TMPDIR/settings-security.xml <<EOF
<settingsSecurity>
  <master>${epass}</master>
</settingsSecurity>
EOF

epass=`mvn -ep "$password"` cat > $TMPDIR/settings.xml <<EOF
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                    https://maven.apache.org/xsd/settings-1.0.0.xsd">
  <localRepository>/repository</localRepository>
  <interactiveMode>false</interactiveMode>
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
      <name>yashkov.org internal mirror</name>
      <url>http://repo/repository/maven-yashkov/</url>
      <mirrorOf>*</mirrorOf>
    </mirror>
  </mirrors>
</settings>
EOF

kubectl create secret generic maven-settings \
  --from-file=$TMPDIR/settings-security.xml \
  --from-file=$TMPDIR/settings.xml \
  --dry-run -o yaml | kubectl apply -f -

rm $TMPDIR/settings-security.xml $TMPDIR/settings.xml