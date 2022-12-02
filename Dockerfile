FROM sonarsource/sonar-scanner-cli:4.6

LABEL version="0.0.1" \
      repository="https://github.com/sonarsource/sonarcloud-github-action" \
      homepage="https://github.com/sonarsource/sonarcloud-github-action" \
      maintainer="SonarSource" \
      com.github.actions.name="SonarCloud Scan" \
      com.github.actions.description="Scan your code with SonarCloud to detect bugs, vulnerabilities and code smells in more than 25 programming languages." \
      com.github.actions.icon="check" \
      com.github.actions.color="green"

ARG SONAR_SCANNER_HOME=/opt/sonar-scanner
ARG NODEJS_HOME=/opt/nodejs

ENV PATH=${PATH}:${SONAR_SCANNER_HOME}/bin:${NODEJS_HOME}/bin

RUN echo $PATH

# set up local envs in order to allow for special chars (non-asci) in filenames
ENV LC_ALL="C.UTF-8"

WORKDIR /opt

RUN echo $PATH
# https://help.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions#user
USER root

RUN echo $PATH

# Prepare entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN echo $PATH
RUN chmod +x /entrypoint.sh
RUN echo $PATH
ENTRYPOINT ["/entrypoint.sh"]
