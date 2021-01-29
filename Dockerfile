FROM gcr.io/google.com/cloudsdktool/cloud-sdk:slim

RUN \
  # Install equivs
  apt-get install -y equivs && \
  # Create a fake openjdk-8-jdk package
  cd /tmp && \
  equivs-control openjdk-8-jdk && \
  sed -i 's/^Package: .*/Package: openjdk-8-jdk/' openjdk-8-jdk && \
  equivs-build openjdk-8-jdk && \
  dpkg -i openjdk-8-jdk_1.0_all.deb && \
  # Install pubsub emulator
  apt-get install -y openjdk-11-jre-headless google-cloud-sdk-pubsub-emulator && \
  # Uninstall equivs
  apt-get purge -y --auto-remove equivs && \
  # Delete tmp files
  rm -rf /tmp/* /var/lib/apt/lists/*

CMD gcloud beta emulators pubsub start --host-port=0.0.0.0:8681
