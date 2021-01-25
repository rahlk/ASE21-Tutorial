#!/bin/sh

echo "ccreate codegen directory"
mkdir -p /home/ibmadmin/m2m-ws-sample/defaultapplication/codegen

echo "change to the codegen diretory"
cd /home/ibmadmin/m2m-ws-sample/defaultapplication/codegen

echo "copy the monolith application to codegen directory"
cp -r /home/ibmadmin/m2m-ws-sample/defaultapplication/monolith .

echo "copy the user modified generated cardinal directoy to codegen directory"
cp -r /home/ibmadmin/m2m-ws-sample/defaultapplication/application-data/mono2micro/mono2micro-user-modified/cardinal .

echo "list the contents of the codegen directory"
ls -R /home/ibmadmin/m2m-ws-sample/defaultapplication/codegen
