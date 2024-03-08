FROM softwaresecurityproject/zap-stable:latest
USER root
RUN apt-get update && \
    apt-get install -y curl jq && \
    rm -rf /var/lib/apt/lists/*
COPY ./upload-results-s3.sh /usr/local/bin/upload-results-s3.sh
RUN  chown -R zap:zap /usr/local/bin/upload-results-s3.sh
RUN chmod a+x /usr/local/bin/upload-results-s3.sh
USER zap
ENTRYPOINT ["/bin/sh"]
