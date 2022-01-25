echo '========== Get SonarQube Token =========='
# Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
# Install rancher-cli
curl -LO https://github.com/rancher/cli/releases/download/v2.4.6/rancher-linux-amd64-v2.4.6.tar.gz \
    && tar xf rancher-linux-amd64-v2.4.6.tar.gz && mv rancher-v2.4.6/rancher /usr/bin/rancher && rm -rf rancher-v2.4.6/
rancher login ${rancher_url} -t ${rancher_api_token} --skip-verify && export SONAR_TOKEN=$(rancher kubectl get secret sonar-bot -n ${CICD_GIT_REPO_NAME} -o=go-template='{{index .data "sonar-token"}}' | base64 -d)

echo '========== SonarQube(Maven) =========='
cd app && mvn install
mvn clean verify sonar:sonar -Dsonar.host.url=http://sonarqube-server-service.default:9000\
    -Dsonar.projectName=${CICD_GIT_REPO_NAME} -Dsonar.projectKey=${CICD_GIT_REPO_NAME}\
    -Dsonar.projectVersion=${CICD_GIT_BRANCH}:${CICD_GIT_COMMIT}\
	-Dsonar.log.level=DEBUG -Dsonar.qualitygate.wait=true -Dsonar.qualitygate.timeout=600\
	-Dsonar.login=$SONAR_TOKEN