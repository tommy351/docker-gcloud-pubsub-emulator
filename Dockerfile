FROM google/cloud-sdk:slim

RUN apt-get install -y --no-install-recommends google-cloud-sdk-pubsub-emulator
