FROM alpine:latest

ARG RANCHER_CLI_VERSION=0.6.13

RUN apk --no-cache add curl tar

# Install the Rancher CLI
RUN rancher_cli_url="https://github.com/rancher/cli/releases/download/v${RANCHER_CLI_VERSION}/rancher-linux-amd64-v${RANCHER_CLI_VERSION}.tar.gz" \
    && curl $rancher_cli_url --remote-name --remote-header-name --location \
    && tar xzvf "rancher-linux-amd64-v${RANCHER_CLI_VERSION}.tar.gz" \
    && mv ./rancher-v${RANCHER_CLI_VERSION}/rancher /usr/local/bin/ \
    && rm -rf rancher* \
    && rancher --version

COPY entrypoint.sh /
ENV INTERVAL=300
ENTRYPOINT /entrypoint.sh
