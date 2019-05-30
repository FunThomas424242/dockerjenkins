#!/usr/bin/env bash
docker rm -v jenkins

docker run -d --rm --name jenkins -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker -v ~/jenkins_home:/var/jenkins_home -e "DOCKER_GID_ON_HOST=$(cat /etc/group | grep docker: | cut -d: -f3)" funthomas424242/dockerjenkins

echo initial password für admin:
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword