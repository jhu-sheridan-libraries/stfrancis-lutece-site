#!/bin/bash

git clone https://github.com/jhu-sheridan-libraries/lutece-enroll-plugin.git
git clone https://github.com/jhu-sheridan-libraries/gru-plugin-appointment.git
cd lutece-enroll-plugin
mvn clean install -Dmaven.test.skip
cd -
cd gru-plugin-appointment
git checkout i18n-2.2
mvn clean install -Dmaven.test.skip
cd /work
mvn lutece:site-assembly
