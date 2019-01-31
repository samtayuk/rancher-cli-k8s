FROM rancher/cli:v2.0.4

ENV KUBERNETES_VERSION=v1.12.4

RUN apk --update --no-cache add curl gettext \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

COPY assets/root/ /

ENTRYPOINT ["entrypoint"]
CMD ["rancher"]
