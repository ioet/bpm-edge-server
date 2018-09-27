#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
eval $(aws ecr get-login --no-include-email --region us-east-1)
echo 'login done'

version=$(./gradlew -q getVersion)
cat "$version"

echo 'version returned'

eval "docker tag edge-server:$version 524819651720.dkr.ecr.us-east-1.amazonaws.com/bpm-edge-server:$version"
eval "docker push 524819651720.dkr.ecr.us-east-1.amazonaws.com/bpm-edge-server:$version"

echo 'tag uploaded'

eval "docker tag edge-server:$version 524819651720.dkr.ecr.us-east-1.amazonaws.com/bpm-edge-server:latest"
eval "docker push 524819651720.dkr.ecr.us-east-1.amazonaws.com/bpm-edge-server:latest"

echo 'latest version uploaded'