#!/bin/sh -ex

CURRENT_DIR=`pwd`

cd "${CURRENT_DIR}"
cd old
mvn clean package

cd "${CURRENT_DIR}"
cd new
mvn clean package

cd "${CURRENT_DIR}"
java \
  -jar ~/.m2//repository/com/github/siom79/japicmp/japicmp/0.9.5-SNAPSHOT/japicmp-0.9.5-SNAPSHOT-jar-with-dependencies.jar \
  --old old/target/japicmp-bug-20170321-1.0.0.jar \
  --new new/target/japicmp-bug-20170321-1.0.1.jar \
  --html-file report.html

