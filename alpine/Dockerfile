FROM google/cloud-sdk:alpine

RUN apk add --update openjdk7-jre && \
  gcloud components install beta pubsub-emulator &&\
  rm -rf /tmp/* /var/cache/apk/*
