#!/bin/bash

sudo apt-get remove google-cloud-sdk
sudo rm -f /usr/bin/kubectl
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-372.0.0-linux-x86_64.tar.gz

ls

tar -xf google-cloud-sdk-372.0.0-linux-x86_64.tar.gz

sudo ./google-cloud-sdk/install.sh

gcloud init 
gcloud auth list 
gcloud components update 
sudo chown -R $USER /home/$USER/google-cloud-sdk
gcloud components install kubectl 
