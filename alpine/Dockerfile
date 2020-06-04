FROM google/cloud-sdk:alpine

RUN apk add --update --no-cache openjdk11-jre-headless && \
  gcloud components install beta pubsub-emulator

CMD gcloud beta emulators pubsub start --host-port=0.0.0.0:8681
