FROM zricethezav/gitleaks:v8.18.2
RUN apk add curl jq
COPY ./upload-results-s3.sh /usr/local/bin/upload-results-s3.sh
RUN chmod a+x /usr/local/bin/upload-results-s3.sh
ENTRYPOINT ["/bin/sh"]
