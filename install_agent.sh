#!/bin/bash

# Install Azure DevOps agent
AGENT_URL=$1
PAT_TOKEN=$2
AGENT_POOL=$3

mkdir -p myagent && cd myagent
wget https://vstsagentpackage.azureedge.net/agent/2.196.1/vsts-agent-linux-x64-2.196.1.tar.gz
tar zxvf vsts-agent-linux-x64-2.196.1.tar.gz

./config.sh --unattended --url $AGENT_URL --auth pat --token $PAT_TOKEN --pool $AGENT_POOL --agent $(hostname)

sudo ./svc.sh install
sudo ./svc.sh start

